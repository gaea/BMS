using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace TMA.DAO.EntityManager
{
    public class DependenciesDao : Dao
    {
        public static List<Dependency> findBy(string field, int Id_Dependency)
        {
            List<Dependency> dependency = (List<Dependency>)Session.CreateCriteria<Dependency>()
                .Add(Restrictions.Eq(field, Id_Dependency))
                .List<Dependency>();

            return dependency;
        }

        public static Dependency find(int Id_Dependency)
        {
            Dependency dependency = (Dependency)Session.CreateCriteria<Dependency>()
                .Add(Restrictions.Eq("Id_Dependency", Id_Dependency))
                .UniqueResult();

            return dependency;
        }

        public static List<Dependency> findAll()
        {
            IList<Dependency> iHeadquarter = Session.CreateCriteria<Dependency>().List<Dependency>();

            return (iHeadquarter != null) ? new List<Dependency>(iHeadquarter) : new List<Dependency>();
        }

        public static void save(Dependency dependency)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(dependency);

                    transaction.Commit();

                    Session.Flush();
                }
                catch (Exception exception)
                {
                    transaction.Rollback();
                    throw exception;
                }
            }
        }

        public static void update(Dependency dependency)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(dependency);

                    transaction.Commit();

                    Session.Flush();
                }
                catch (Exception exception)
                {
                    transaction.Rollback();
                    throw exception;
                }
            }
        }

        public static void delete(Dependency dependency)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(dependency);

                    transaction.Commit();

                    Session.Flush();
                }
                catch (Exception exception)
                {
                    transaction.Rollback();
                    throw exception;
                }
            }
        }
    }
}
