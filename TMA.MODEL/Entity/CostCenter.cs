using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class CostCenter
    {
        #region Attributes

        private int? id_CostCenter;
        private int? id_Dependency;
        private string name;

        #endregion Attributes

        #region Properties

        public virtual int? Id_CostCenter
        {
            get { return id_CostCenter; }
            set { id_CostCenter = value; }
        }

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
        
        #endregion Properties
    }
}
