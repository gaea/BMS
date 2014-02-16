using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Charge
    {
        #region Attributes

        private int? id_Charge;
        private string name;
        private string id_UserCreateRegistration;
        private DateTime? dateCreateRegistration;
        private string id_UserModifyRegistration;
        private DateTime? dateModifyRegistration;

        #endregion Attributes

        #region Properties

        public int? Id_Charge
        {
            get { return id_Charge; }
            set { id_Charge = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual string Id_UserCreateRegistration
        {
            get { return id_UserCreateRegistration; }
            set { id_UserCreateRegistration = value; }
        }

        public virtual DateTime? DateCreateRegistration
        {
            get { return dateCreateRegistration; }
            set { dateCreateRegistration = value; }
        }

        public virtual string Id_UserModifyRegistration
        {
            get { return id_UserModifyRegistration; }
            set { id_UserModifyRegistration = value; }
        }

        public virtual DateTime? DateModifyRegistration
        {
            get { return dateModifyRegistration; }
            set { dateModifyRegistration = value; }
        }

        #endregion Properties
    }
}
