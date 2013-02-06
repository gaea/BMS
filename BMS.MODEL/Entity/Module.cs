using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMS.MODEL.Entity
{
    public class Module
    {
        #region Attributes

        private int id_Module;

        private string name;

        private string description;

        #endregion

        #region Properties

        public virtual int Id_Module
        {
            get { return id_Module; }
            set { id_Module = value; }
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
            return string.Format("Id: {1}{0}Name: {2}{0}Description: {3}{0} ", Environment.NewLine, this.Id_Module, this.Name, this.Description);
        }

        #endregion
    }
}
