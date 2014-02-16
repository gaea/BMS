using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMS.MODEL.Entity
{
    [Serializable]
    public class Rol
    {
        #region Attributes

        private int id_Role;

        private string name;

        private string description;

        #endregion

        #region Properties

        public virtual int Id_Rol
        {
            get { return id_Role; }
            set { id_Role = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
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
            return string.Format( "Id: {1}{0}Name: {2}{0}Description: {3}{0} ", Environment.NewLine, this.Id_Rol, this.Name, this.Description);
        }

        #endregion
    }
}
