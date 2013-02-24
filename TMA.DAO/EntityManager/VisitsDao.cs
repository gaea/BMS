
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using TMA.MODEL.Entity;

namespace TMA.DAO.EntityManager
{
    public class VisitsDao : Dao
    {
        public static List<Visit> findBy(string field, int Id_Visit)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Eq(field, Id_Visit))
                .List<Visit>();

            return visit;
        }

        public static Visit find(int Id_Visit)
        {
            Visit visit = (Visit)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Eq("Id_Visit", Id_Visit))
                .UniqueResult();

            return visit;
        }

        public static List<Visit> findAll()
        {
            IList<Visit> iHeadquarter = Session.CreateCriteria<Visit>().List<Visit>();

            return (iHeadquarter != null) ? new List<Visit>(iHeadquarter) : new List<Visit>();
        }

        public static void save(Visit visit)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(visit);

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

        public static void update(Visit visit)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(visit);

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

        public static void delete(Visit visit)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(visit);

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
