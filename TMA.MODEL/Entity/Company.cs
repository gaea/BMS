using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Company
    {
        #region Attributes

        private int? id_Third;

        private string name;

        private int? id_Subsidiary;

        #endregion Attributes

        #region Properties

        public virtual int? Id_Third
        {
            get { return id_Third; }
            set { id_Third = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }
        public virtual int? Id_Subsidiary
        {
            get { return id_Subsidiary; }
            set { id_Subsidiary = value; }
        }

        #endregion Properties
    }
}
