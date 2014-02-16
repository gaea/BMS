using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Device
    {
        public virtual int Id { get; set; }
        public virtual string BiometricDeviceIP { get; set; }
        public virtual string State { get; set; }
        public virtual DateTime RecordDate { get; set; }
        public virtual string Observations { get; set; }
    }
}
