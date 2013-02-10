using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Headquarter
    {
        #region Attributes

        private short id_Headquarter;

        private string description;

        #endregion

        #region Properties

        public virtual short Id_Headquarter
        {
            get { return id_Headquarter; }
            set { id_Headquarter = value; }
        }

        public virtual string Description
        {
            get { return description; }
            set { description = value; }
        }


        #endregion

        #region Methods

        public override string ToString()
        {
            return string.Format("Id: {1}{0}Description: {2}{0} ", Environment.NewLine, this.Id_Headquarter, this.Description);
        }

        #endregion
    }
}
