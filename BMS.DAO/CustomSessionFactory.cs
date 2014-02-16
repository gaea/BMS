using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using NHibernate.Bytecode;
using Spring.Data.NHibernate;
using Spring.Data.NHibernate.Bytecode;

namespace BMS.DAO
{
    class CustomSessionFactory : LocalSessionFactoryObject
    {
        public override IBytecodeProvider BytecodeProvider
        {
            get { return new BytecodeProvider(ApplicationContext); }
            set { }
        }
    }
}
