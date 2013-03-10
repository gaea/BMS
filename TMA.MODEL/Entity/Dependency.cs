using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    public class Dependency
    {
        #region Attributes

        private int? id_Dependency;

        private string name;

        private string dependencyClass;

        private string userCreateRegistration;
        
        private DateTime? dateCreateRegistration;
        
        private string userModifyRegistration;
        
        private DateTime? dateModifyRegistration;

        private int? id_Company;

        #endregion Attributes

        #region Properties

        public virtual int? Id_Dependency
        {
            get { return id_Dependency; }
            set { id_Dependency = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual string DependencyClass
        {
            get { return dependencyClass; }
            set { dependencyClass = value; }
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

        public virtual int? Id_Company
        {
            get { return id_Company; }
            set { id_Company = value; }
        }

        #endregion Properties
    }
}
