using System;
using System.Collections.Generic;
using System.Text;

namespace App.Model.ViewModel
{
    public class UserModel
    {
        public UserModel()
        {
            this.Email = this.UserName + "@gmail.com";
        }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
    }
}
