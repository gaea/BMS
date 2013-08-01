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
        public virtual DateTime RecordDate { get; set; }
        public virtual string Reason { get; set; }
    }
}
