using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Authorization
    {
        #region Attributes

        private int id_Authorization;
        private string id_PersonEntry;
        private bool? authorized;
        private DateTime? startDate;
        private DateTime? endDate;
        private int? id_PersonAuthorizing;
        private int? id_EntryType;
        private string reason;

        #endregion Attributes

        #region Properties

        public virtual string Reason
        {
            get { return reason; }
            set { reason = value; }
        }

        public virtual int? Id_EntryType
        {
            get { return id_EntryType; }
            set { id_EntryType = value; }
        }

        public virtual int? Id_PersonAuthorizing
        {
            get { return id_PersonAuthorizing; }
            set { id_PersonAuthorizing = value; }
        }

        public virtual DateTime? EndDate
        {
            get { return endDate; }
            set { endDate = value; }
        }

        public virtual DateTime? StartDate
        {
            get { return startDate; }
            set { startDate = value; }
        }

        public virtual bool? Authorized
        {
            get { return authorized; }
            set { authorized = value; }
        }

        public virtual int Id_Authorization
        {
            get { return id_Authorization; }
            set { id_Authorization = value; }
        }

        public virtual string Id_PersonEntry
        {
            get { return id_PersonEntry; }
            set { id_PersonEntry = value; }
        }

        #endregion Properties
    }
}
