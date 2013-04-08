using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate.Criterion;
using NHibernate;

namespace TMA.DAO.EntityManager
{
    public class PersonsDao : Dao
    {

        public static int Count()
        {
            IList<Person> iPerson = Session.CreateCriteria<Person>().List<Person>();

            return iPerson.Count;
        }

        public static int Count(string field, string value)
        {
            List<Person> person = (List<Person>)Session.CreateCriteria<Person>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), value, MatchMode.Anywhere))
                .List<Person>();

            return person.Count;
        }

        public static List<Person> findBy(string field, string value)
        {
            List<Person> person = (List<Person>)Session.CreateCriteria<Person>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), value, MatchMode.Anywhere))
                .List<Person>();

            return person;
        }

        public static List<Person> findBy(int start, int limit, string field, string value)
        {
            List<Person> person = (List<Person>)Session.CreateCriteria<Person>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), value, MatchMode.Anywhere))
                .SetFirstResult(start)
                .SetMaxResults(limit)
                .List<Person>();

            return person;
        }

        public static Person find(float Id_Person)
        {
            Person person = (Person)Session.CreateCriteria<Person>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.Double, Projections.Property("Id_Person")), Id_Person.ToString()))
                .UniqueResult();

            return person;
        }

        public static List<Person> findByAll()
        {
            IList<Person> iPerson = Session.CreateCriteria<Person>().List<Person>();

            return (iPerson != null) ? new List<Person>(iPerson) : new List<Person>();
        }

        public static List<Person> findAll(int start, int limit)
        {
            IList<Person> iPerson = Session.CreateCriteria<Person>()
                                                        .SetFirstResult(start)
                                                        .SetMaxResults(limit)
                                                        .List<Person>();

            return (iPerson != null) ? new List<Person>(iPerson) : new List<Person>();
        }

        public static List<Person> findAll()
        {
            IList<Person> iPerson = Session.CreateCriteria<Person>().List<Person>();

            return (iPerson != null) ? new List<Person>(iPerson) : new List<Person>();
        }

        public static void save(Person person)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Save(person);

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

        public static void update(Person person)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(person);

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

        public static void delete(Person person)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(person);

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
