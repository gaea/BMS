using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class State
    {
        private int id_State;
        private string state;

        public virtual int Id_State
        {
            get { return id_State; }
            set { id_State = value; }
        }

        public virtual string StateName
        {
            get { return state; }
            set { state = value; }
        }
    }
}
