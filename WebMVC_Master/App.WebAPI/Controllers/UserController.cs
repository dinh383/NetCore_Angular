using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using App.Data.Entities;
using App.Model.ViewModel;
using App.Service.Interface;
using App.WebAPI.Infrastructure.DevExtreme;
using DevExtreme.AspNet.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Microsoft.Extensions.Configuration;
using System.Text;
using System.Security.Cryptography;

namespace App.WebAPI.Controllers
{
    [Route("api/user")]
    [ApiController]
    public class UserController : Controller
    {
        private const string NotFoundUserOrInvalidPasswordErrorMessage = "The email or password you entered is incorrect Or user Is Active.";
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly IUserService _userService;
        private static IConfiguration _configuration { get; set; }
        public UserController(IConfiguration configuration, IUserService userService, UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            this._userService = userService;
            _configuration = configuration;
            this._signInManager = signInManager;
            this._userManager = userManager;
        }
        [HttpGet, Route("getAll")]
        public IActionResult GetAll(DataSourceLoadOptions loadOptions)
        {
            var data = DataSourceLoader.Load(_userService.GetAll(), loadOptions);
            return Ok(data);
        }
        [AllowAnonymous]
        [HttpPost, Route("login")]
        public async Task<IActionResult> Login([FromBody]UserModel loginViewModel)
        {
            if (ModelState.IsValid)
            {
                AppUser user = await _userManager.FindByNameAsync(loginViewModel.UserName);
                bool isAuthentication = await _userManager.CheckPasswordAsync(user, loginViewModel.Password);
                if (!isAuthentication || user.Stop == true)
                {
                    ModelState.AddModelError(string.Empty, NotFoundUserOrInvalidPasswordErrorMessage);
                    return Unauthorized();
                }
                var result = _signInManager.SignInAsync(user, false);
                //var result = await _signInManager.(user, loginViewModel.Password, false, lockoutOnFailure: false);
                //var isSucceeded = result.Succeeded;
                if (result != null)
                {
                    var claims = new[]
                    {
                        new Claim(ClaimTypes.Name, loginViewModel.UserName),
                        new Claim(JwtRegisteredClaimNames.Sub, user.Id.ToString()),
                        //new Claim(ClaimTypes.Role, string.Join(",", roles.ToArray())),
                        new Claim(JwtRegisteredClaimNames.Email, loginViewModel.Email),
                        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
                    };
                    var token = new JwtSecurityToken
                    (
                            issuer: _configuration.GetSection("TokenAuthentication:Issuer").Value,
                            audience: _configuration.GetSection("TokenAuthentication:Audience").Value,
                            claims: claims,
                            //expires: DateTime.Now.AddDays(7), //DateTime.UtcNow.AddSeconds(10),
                            //expires: DateTime.Now.AddSeconds(10), //DateTime.UtcNow.AddSeconds(10),
                            //notBefore: DateTime.Now,
                            notBefore: DateTime.UtcNow,
                            expires: DateTime.UtcNow.AddSeconds(30),
                            signingCredentials: new SigningCredentials(new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration.GetSection("TokenAuthentication:SecretKey").Value)),
                                 SecurityAlgorithms.HmacSha256)
                    );
                    var data = new UserLoginModel
                    {
                        Id = user.Id,
                        UserName = user.UserName,
                        Email = user.Email,
                        Token = new JwtSecurityTokenHandler().WriteToken(token),
                        FullName = user.FullName,
                        Permissions = null,
                        Roles = null,
                        Avatar = null
                    };
                    return Ok(data);
                }

            }
            return BadRequest();
        }

        [HttpPost, Route("refresh-Token")]
        public IActionResult Refresh([FromBody] RefreshTokenModel refreshTokenModel)
        {
            var principal = GetPrincipalFromExpiredToken(refreshTokenModel.Token);
            var username = principal.Identity.Name;
            //var savedRefreshToken = GetRefreshToken(username); //retrieve the refresh token from a data store
            //if (savedRefreshToken != refreshToken)
            //    throw new SecurityTokenException("Invalid refresh token");

            var newJwtToken = GenerateToken(principal.Claims);
            var newRefreshToken = GenerateRefreshToken();
            //DeleteRefreshToken(username, refreshToken);
            //SaveRefreshToken(username, newRefreshToken);

            return Ok(new
            {
                token = newJwtToken,
                refreshToken = newRefreshToken
            });
        }

        private ClaimsPrincipal GetPrincipalFromExpiredToken(string token)
        {
            var tokenValidationParameters = new TokenValidationParameters
            {
                //ValidateAudience = false, //you might want to validate the audience and issuer depending on your use case
                //ValidateIssuer = false,
                //ValidateIssuerSigningKey = true,
                //IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("the server key used to sign the JWT token is here, use more than 16 chars")),
                //ValidateLifetime = false //here we are saying that we don't care about the token's expiration date

                ValidateActor = true,
                ValidateAudience = true,
                ValidateLifetime = false,
                ValidateIssuerSigningKey = true,
                ClockSkew = TimeSpan.Zero,
                ValidIssuer = _configuration.GetSection("TokenAuthentication:Issuer").Value,
                ValidAudience = _configuration.GetSection("TokenAuthentication:Audience").Value,
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(_configuration.GetSection("TokenAuthentication:SecretKey").Value))
            };

            var tokenHandler = new JwtSecurityTokenHandler();
            SecurityToken securityToken;
            var principal = tokenHandler.ValidateToken(token, tokenValidationParameters, out securityToken);
            var jwtSecurityToken = securityToken as JwtSecurityToken;
            if (jwtSecurityToken == null || !jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256, StringComparison.InvariantCultureIgnoreCase))
                throw new SecurityTokenException("Invalid token");

            return principal;
        }

        private string GenerateRefreshToken()
        {
            var randomNumber = new byte[32];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(randomNumber);
                return Convert.ToBase64String(randomNumber);
            }
        }
        private string GenerateToken(IEnumerable<Claim> claims)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("the server key used to sign the JWT token is here, use more than 16 chars"));

            var jwt = new JwtSecurityToken(issuer: "Blinkingcaret",
                audience: "Everyone",
                claims: claims, //the user's claims, for example new Claim[] { new Claim(ClaimTypes.Name, "The username"), //... 
                notBefore: DateTime.UtcNow,
                expires: DateTime.UtcNow.AddMinutes(5),
                signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256)
            );

            return new JwtSecurityTokenHandler().WriteToken(jwt); //the method is called WriteToken but returns a string
        }
        [HttpPost, Route("addAsync")]
        public async Task<IActionResult> AddAsync([FromBody]UserModel model)
        {
            if (ModelState.IsValid)
            {
                var EmailName = model.Email.Trim();
                //var isExistUser = _repositoryUser.Query().Any(x => x.Email.Equals(EmailName, StringComparison.InvariantCultureIgnoreCase));
                //var isExistUser = await _userService.AnyAsync(n => n.UserName == model.UserName && n.PasswordHash == model.Password);
                //if (isExistUser)
                //{
                //    return BadRequest();
                //}

                string passgen = model.Password;
                AppUser user = new AppUser
                {
                    //Name = model.Name.Trim(),
                    Email = model.Email.Trim(),
                    EmailConfirmed = true,
                    //IsActive = model.IsActive,
                    UserName = model.UserName.Trim(),
                };

                //foreach (var id in model.RoleIds)
                //{
                //    var userRole = new UserRole
                //    {
                //        User = user,
                //        RoleId = id
                //    };

                //    user.Roles.Add(userRole);
                //}

                var result = await _userManager.CreateAsync(user, passgen);
                if (result.Succeeded)
                {
                    return Ok(model);
                }
                //AddErrors(result);
                return BadRequest(ModelState);
            }

            return BadRequest(ModelState);
        }

    }
}