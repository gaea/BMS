using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Profile
    {
        #region Attributes

        private int? id_Profile;

        private string description;

        private int id_User;

        private DateTime? dateCreateRegistration;

        private int id_UserModifyRegistration;

        private DateTime? dateModifyRegistration;

        #endregion

        #region Properties

        public virtual int? Id_Profile
        {
            get { return id_Profile; }
            set { id_Profile = value; }
        }

        public virtual string Description
        {
            get { return description; }
            set { description = value; }
        }

        public virtual int Id_User
        {
            get { return id_User; }
            set { id_User = value; }
        }

        public virtual DateTime? DateCreateRegistration
        {
            get { return dateCreateRegistration; }
            set { dateCreateRegistration = value; }
        }

        public virtual int Id_UserModifyRegistration
        {
            get { return id_UserModifyRegistration; }
            set { id_UserModifyRegistration = value; }
        }

        public virtual DateTime? DateModifyRegistration
        {
            get { return dateModifyRegistration; }
            set { dateModifyRegistration = value; }
        }

        #endregion

        #region Methods

        public override string ToString()
        {
            return string.Format("Id: {1}{0}Description: {2}{0} ", Environment.NewLine, this.Id_Profile, this.Description);
        }

        #endregion
    }
}
