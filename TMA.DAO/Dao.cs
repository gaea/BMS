using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Spring.Context.Support;
using NHibernate;
using Spring.Context;
using NHibernate.Cfg;

namespace TMA.DAO
{
    public class Dao
    {
        private static ISession session;
        private static ISessionFactory sessionFactory;
        private static IApplicationContext IoC;

        public static ISession Session
        {
            get
            {
                //if (sessionFactory == null)
                //{
                    IoC = ContextRegistry.GetContext();
                    sessionFactory = (ISessionFactory)IoC.GetObject("TMA.SessionFactory");

                    session = sessionFactory.OpenSession();
                //}

                return session;
            }
            set { session = value; }
        }
    }
}
