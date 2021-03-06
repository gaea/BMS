﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Users
    {
        #region Attributes

        private int? id_User;
        private string login;
        private string name;
        private string password;
        private int? id_Role;
        private bool isActive;
        private int? documentType;
        private int documentNumber;
        private string address;
        private string telephoneNumber;
        private string emailAddress;
        private string userCreateRegistration;
        private DateTime? dateCreateRegistration;
        private string userModifyRegistration;
        private DateTime? dateModifyRegistration;

        #endregion Attributes

        #region Properties

        public virtual int? Id_User
        {
            get { return id_User; }
            set { id_User = value; }
        }

        public virtual string Login
        {
            get { return login; }
            set { login = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }
        
        public virtual string Password
        {
            get { return password; }
            set { password = value; }
        }

        public virtual int? Id_Role
        {
            get { return id_Role; }
            set { id_Role = value; }
        }

        public virtual bool IsActive
        {
            get { return isActive; }
            set { isActive = value; }
        }

        public virtual int? DocumentType
        {
            get { return documentType; }
            set { documentType = value; }
        }

        public virtual int DocumentNumber
        {
            get { return documentNumber; }
            set { documentNumber = value; }
        }

        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }

        public virtual string TelephoneNumber
        {
            get { return telephoneNumber; }
            set { telephoneNumber = value; }
        }

        public virtual string EmailAddress
        {
            get { return emailAddress; }
            set { emailAddress = value; }
        }

        public virtual string UserCreateRegistration
        {
            get { return userCreateRegistration; }
            set { userCreateRegistration = value; }
        }

        public virtual DateTime? DateCreateRegistration
        {
            get { return dateCreateRegistration; }
            set { dateCreateRegistration = value; }
        }

        public virtual string UserModifyRegistration
        {
            get { return userModifyRegistration; }
            set { userModifyRegistration = value; }
        }

        public virtual DateTime? DateModifyRegistration
        {
            get { return dateModifyRegistration; }
            set { dateModifyRegistration = value; }
        }

        #endregion Properties
    
        #region methods
        public override string ToString() 
        {
            string strUser = string.Empty;

            strUser += "Id_User: " + this.Id_User + System.Environment.NewLine;
            strUser += "Name: " + this.Name + System.Environment.NewLine;
            strUser += "DocumentNumber: " + this.DocumentNumber + System.Environment.NewLine;
            strUser += "Login: " + this.Login + System.Environment.NewLine;
            strUser += "Password: " + this.Password + System.Environment.NewLine;
            strUser += "Address: " + this.Address + System.Environment.NewLine;
            strUser += "EmailAddress: " + this.EmailAddress + System.Environment.NewLine;
            strUser += "TelephoneNumber: " + this.TelephoneNumber + System.Environment.NewLine;
            //strUser += "UserCreateRegistration: " + this.UserCreateRegistration.ToString() + System.Environment.NewLine;
            //strUser += "UserModifyRegistration: " + this.UserModifyRegistration.ToString() + System.Environment.NewLine;

            return strUser;
        }
        #endregion
    }
}
