
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
        public static List<Visit> findPersonBy(string field, string value)
        {
            List<Person> persons = (List<Person>)Session.CreateCriteria<Person>()
                .Add(Restrictions.Like(field, value, MatchMode.Anywhere))
                .List<Person>();

            List<Visit> visits = new List<Visit>();

            foreach (Person person in persons)
            {
                Visit visit = (Visit)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Eq("Id_Visitor", person.Id_Person))
                .UniqueResult();

                if (visit != null)
                {
                    visits.Add(visit);
                }
            }

            return visits;
        }

        public static List<Visit> findBy(string field, int value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Eq(field, value))
                .List<Visit>();

            return visit;
        }

        public static List<Visit> findBy(string field, float value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Like(field, value))
                .List<Visit>();

            return visit;
        }

        public static List<Visit> findBy(string field, string value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Like(field, value))
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
