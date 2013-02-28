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
        public static List<Person> findBy(string field, float Id_Person)
        {
            List<Person> person = (List<Person>)Session.CreateCriteria<Person>()
                .Add(Restrictions.Eq(field, Id_Person))
                .List<Person>();

            return person;
        }

        public static Person find(float Id_Person)
        {
            Person person = (Person)Session.CreateCriteria<Person>()
                .Add(Restrictions.Eq("Id_Person", Id_Person))
                .UniqueResult();

            return person;
        }

        public static List<Person> findByAll()
        {
            IList<Person> iHeadquarter = Session.CreateCriteria<Person>().List<Person>();

            return (iHeadquarter != null) ? new List<Person>(iHeadquarter) : new List<Person>();
        }

        public static List<Person> findAll()
        {
            IList<Person> iHeadquarter = Session.CreateCriteria<Person>().List<Person>();

            return (iHeadquarter != null) ? new List<Person>(iHeadquarter) : new List<Person>();
        }

        public static void save(Person person)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
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
