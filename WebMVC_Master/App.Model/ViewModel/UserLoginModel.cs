using System;
using System.Collections.Generic;
using System.Text;

namespace App.Model.ViewModel
{
    public class UserLoginModel
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string Token { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Avatar { get; set; }
        public string Permissions { get; set; }
        public string Roles { get; set; }
    }
}
