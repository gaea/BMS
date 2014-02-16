using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMS.MODEL.Entity
{
    public class Authorization
    {
        #region Attributes

        private int id_Authorization;

        private DateTime startDate;

        private DateTime endDate;

        private int id_User;

        #endregion

        #region Properties

        public virtual int Id_Authorization
        {
            get { return id_Authorization; }
            set { id_Authorization = value; }
        }

        public virtual DateTime StartDate
        {
            get { return startDate; }
            set { startDate = value; }
        }

        public virtual DateTime EndDate
        {
            get { return endDate; }
            set { endDate = value; }
        }

        public virtual int Id_User
        {
            get { return id_User; }
            set { id_User = value; }
        }

        #endregion

        #region Methods

        public override string ToString()
        {
            return string.Format("Id: {1}{0}Start Date: {2}{0}End Date: {3}{0}Id User: {4}{0} ", Environment.NewLine, this.Id_Authorization, this.StartDate, this.EndDate, this.Id_User);
        }

        #endregion
    }
}
