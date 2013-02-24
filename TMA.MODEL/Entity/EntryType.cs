using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class EntryType
    {
        private int id_EntryType;
        private string entryTypeName;

        public virtual int Id_EntryType
        {
            get { return id_EntryType; }
            set { id_EntryType = value; }
        }

        public virtual string EntryTypeName
        {
            get { return entryTypeName; }
            set { entryTypeName = value; }
        }
    }
}
