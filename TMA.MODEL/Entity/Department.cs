using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Department
    {
        #region Attributes

        private int? id_Department;

        private string name;

        #endregion Attributes

        #region Properties

        public virtual int? Id_Department
        {
            get { return id_Department; }
            set { id_Department = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        #endregion Properties

    }
}
