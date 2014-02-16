using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class City
    {
        #region Attributes

        private int? id_City;

        private string name;

        private int? id_Department;

        private int daneCode;

        #endregion Attributes

        #region Properties

        public virtual int? Id_City
        {
            get { return id_City; }
            set { id_City = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }
        public virtual int? Id_Department
        {
            get { return id_Department; }
            set { id_Department = value; }
        }
        public virtual int DaneCode
        {
            get { return daneCode; }
            set { daneCode = value; }
        }

        #endregion Properties
    }
}
