using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMS.MODEL.Entity
{
    [Serializable]
    public class Users
    {
        private int id_User;
        private string login;
        private string password;

        public virtual int Id_User
        {
            get { return id_User; }
            set { id_User = value; }
        }

        public virtual string Login
        {
            get { return login; }
            set { login = value; }
        }

        public virtual string Password
        {
            get { return password; }
            set { password = value; }
        }
    }
}
