using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Spring.Context.Support;
using NHibernate;
using Spring.Context;
using NHibernate.Cfg;
using BMS.CONFIGURATION;
using NHibernate.Context;

namespace TMA.DAO
{
    public class Dao
    {
        private static ISessionFactory sessionFactory;

        public static ISession Session
        {
            get
            {
                if (sessionFactory == null)
                {
                    IApplicationContext IoC = ContextRegistry.GetContext();
                    sessionFactory = (ISessionFactory)IoC.GetObject("TMA.SessionFactory");
                }

                if (!CurrentSessionContext.HasBind(sessionFactory))
                {
                    CurrentSessionContext.Bind(sessionFactory.OpenSession());
                }

                return sessionFactory.GetCurrentSession();
            }
        }
    }
}
