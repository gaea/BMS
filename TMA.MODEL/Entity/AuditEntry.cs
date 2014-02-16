using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class AuditEntry
    {
        public virtual int Id { get; set; }
        public virtual int EntryPerson { get; set; }
        public virtual string DocumentNumberEntryPerson { get; set; }
        public virtual string NameEntryPerson { get; set; }
        public virtual string ChargeEntryPerson { get; set; }
        public virtual string HeadquarterEntryPerson { get; set; }
        public virtual string CostCenterEntryPerson { get; set; }
        public virtual string CompanyEntryPerson { get; set; }
        public virtual DateTime RecordDate { get; set; }
        public virtual string BiometricDeviceIP { get; set; }
        public virtual string Reason { get; set; }
    }
}
