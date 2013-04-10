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
        public static int CountPerson(string field, string value)
        {
            List<Person> persons = PersonsDao.findBy(field, value);

            List<Diary> result = new List<Diary>();

            foreach (Person person in persons)
            {
                List<Diary> diaries = DiariesDao.findBy("Id_Visitor", person.Id_Person.ToString());

                if (diaries != null)
                {
                    result.AddRange(diaries);
                }
            }

            return result.Count;
        }

        public static List<Diary> findPersonBy(int start, int limit, string field, string value)
        {
            List<Person> persons = PersonsDao.findBy(field, value);

            List<Diary> result = new List<Diary>();

            foreach (Person person in persons)
            {
                List<Diary> diaries = DiariesDao.findBy(start, limit, "Id_Visitor", person.Id_Person.ToString());

                if (diaries != null)
                {
                    result.AddRange(diaries);
                }
            }

            return result;
        }

        public static int CountFunctionary(string field, string value)
        {
            List<Functionary> functionaries = FunctionariesDao.findBy(field, value);

            List<Diary> result = new List<Diary>();

            foreach (Functionary functionary in functionaries)
            {
                List<Diary> diaries = DiariesDao.findBy("Id_Functionary", (float)functionary.Id_Functionary);

                if (diaries != null)
                {
                    result.AddRange(diaries);
                }
            }

            return result.Count;
        }

        public static List<Diary> findFunctionaryBy(int start, int limit, string field, string value)
        {
            List<Functionary> functionaries = FunctionariesDao.findBy(field, value);

            List<Diary> result = new List<Diary>();

            foreach (Functionary functionary in functionaries)
            {
                List<Diary> diaries = DiariesDao.findBy(start, limit, "Id_Functionary", (float)functionary.Id_Functionary);

                if (diaries != null)
                {
                    result.AddRange(diaries);
                }
            }

            return result;
        }

        public static int CountCompany(string field, string value)
        {
            List<Company> companys = CompaniesDao.findBy(field, value);

            List<Diary> result = new List<Diary>();

            foreach (Company company in companys)
            {
                List<Person> persons = PersonsDao.findBy("Company", company.Id_Third.ToString()); ;

                foreach (Person person in persons)
                {
                    List<Diary> diaries = DiariesDao.findBy("Id_Visitor", person.Id_Person.ToString());

                    if (diaries != null)
                    {
                        result.AddRange(diaries);
                    }
                }
            }

            return result.Count;
        }

        public static List<Diary> findCompanyBy(int start, int limit, string field, string value)
        {
            List<Company> companys = CompaniesDao.findBy(field, value);

            List<Diary> result = new List<Diary>();

            foreach (Company company in companys)
            {
                List<Person> persons = PersonsDao.findBy(start, limit, "Company", company.Id_Third.ToString()); ;

                foreach (Person person in persons)
                {
                    List<Diary> diaries = DiariesDao.findBy("Id_Visitor", person.Id_Person.ToString());

                    if (diaries != null)
                    {
                        result.AddRange(diaries);
                    }
                }
            }

            return result;
        }

        public static List<Diary> findBy(int start, int limit, string field, string value)
        {
            List<Diary> diaries = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), value.ToString(), MatchMode.Anywhere))
                .SetFirstResult(start)
                .SetMaxResults(limit)
                .List<Diary>();

            return diaries;
        }

        public static int Count(string field, string value)
        {
            List<Diary> diaries = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), value.ToString(), MatchMode.Anywhere))
                .List<Diary>();

            return diaries.Count;
        }

        public static List<Diary> findBy(string field, string value)
        {
            List<Diary> diaries = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), value.ToString(), MatchMode.Anywhere))
                .List<Diary>();

            return diaries;
        }

        public static List<Diary> findBy(int start, int limit, string field, float value)
        {
            List<Diary> diaries = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.Double, Projections.Property(field)), value ))
                .SetFirstResult(start)
                .SetMaxResults(limit)
                .List<Diary>();
 
            return diaries;
        }

        public static List<Diary> findBy(string field, float value)
        {
            List<Diary> diaries = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.Double, Projections.Property(field)), value))
                .List<Diary>();

            return diaries;
        }

        public static int Count(string field, DateTime value)
        {
            List<Diary> diary = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Gt(field, value))
                .List<Diary>();

            return diary.Count;
        }

        public static List<Diary> findBy(int start, int limit, string field, DateTime value)
        {
            List<Diary> diary = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Gt(field, value))
                .SetFirstResult(start)
                .SetMaxResults(limit)
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
