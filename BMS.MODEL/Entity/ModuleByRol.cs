using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMS.MODEL.Entity
{
    public class ModuleByRol
    {
        #region Attributes

        private int id_Module;

        private int id_Rol;

        private string description;

        #endregion

        #region Properties

        public virtual int Id_Module
        {
            get { return id_Module; }
            set { id_Module = value; }
        }

        public virtual int Id_Rol
        {
            get { return id_Rol; }
            set { id_Rol = value; }
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
            return string.Format("Id Module: {1}{0}Id Rol: {2}{0}Description: {3}{0} ", Environment.NewLine, this.Id_Module, this.Id_Rol, this.Description);
        }

        #endregion
    }
}
