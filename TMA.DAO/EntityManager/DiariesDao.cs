using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace TMA.DAO.EntityManager
{
    public class DiariesDao : Dao
    {
        public static List<Diary> findPersonBy(string field, string value)
        {
            List<Person> persons = (List<Person>)Session.CreateCriteria<Person>()
                .Add(Restrictions.Like(field, value, MatchMode.Anywhere))
                .List<Person>();

            List<Diary> visits = new List<Diary>();

            foreach (Person person in persons)
            {
                Diary visit = (Diary)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Eq("Id_Visitor", person.Id_Person))
                .UniqueResult();

                if (visit != null)
                {
                    visits.Add(visit);
                }
            }

            return visits;
        }

        public static List<Diary> findCompanyBy(string field, string value)
        {
            List<Company> companys = (List<Company>)Session.CreateCriteria<Company>()
                .Add(Restrictions.Like(field, value, MatchMode.Anywhere))
                .List<Company>();

            List<Person> persons = new List<Person>();
            List<Diary> diaries = new List<Diary>();

            foreach (Company company in companys)
            {
                persons = PersonsDao.findBy("Company", (float)company.Id_Third); ;

                foreach (Person person in persons)
                {
                    Diary diary = DiariesDao.find(int.Parse(person.Id_Person.ToString()));

                    if (diary != null)
                    {
                        diaries.Add(diary);
                    }
                }
            }

            return diaries;
        }

        public static List<Diary> findBy(string field, int value)
        {
            List<Diary> diary = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Eq(field, value))
                .List<Diary>();

            return diary;
        }

        public static List<Diary> findBy(string field, float value)
        {
            List<Diary> diary = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Eq(field, value))
                .List<Diary>();

            return diary;
        }

        public static List<Diary> findBy(string field, DateTime value)
        {
            List<Diary> diary = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Gt(field, value))
                .List<Diary>();

            return diary;
        }

        public static List<Diary> findBy(string field, string value)
        {
            List<Diary> diary = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Like(field, value))
                .List<Diary>();

            return diary;
        }

        public static Diary find(int Id_Diary)
        {
            Diary diary = (Diary)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Eq("Id_Diary", Id_Diary))
                .UniqueResult();

            return diary;
        }

        public static List<Diary> findAll()
        {
            IList<Diary> diaries = Session.CreateCriteria<Diary>().List<Diary>();

            return (diaries != null) ? new List<Diary>(diaries) : new List<Diary>();
        }

        public static void save(Diary diary)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(diary);

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

        public static void update(Diary diary)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(diary);

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

        public static void delete(Diary diary)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(diary);

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
