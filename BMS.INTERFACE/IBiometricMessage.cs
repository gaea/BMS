using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMS.INTERFACE
{
    public interface IBiometricMessage
    {
        void Receive();
        void Send();
    }
}
