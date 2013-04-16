using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using TMA.MODEL.Entity;
using NHibernate.Engine.Query;

namespace TMA.DAO.EntityManager
{
    public class VisitsDao : Dao
    {
        public static List<Visit> findFunctionaryBy(int start, int limit, string field, string value)
        {
            List<Functionary> functionaries = FunctionariesDao.findBy(field, value);

            List<Visit> result = new List<Visit>();

            foreach (Functionary functionary in functionaries)
            {
                List<Visit> visits = VisitsDao.findBy("Id_Functionary", functionary.Id_Functionary);

                if (visits != null)
                {
                    result.AddRange(visits);
                }
            }

            if (result.Count >= limit) { return result.GetRange(start, limit); }
            else { return result; }
        }

        public static int CountFunctionaryBy(string field, string value)
        {
            List<Functionary> functionaries = FunctionariesDao.findBy(field, value);

            List<Visit> result = new List<Visit>();

            foreach (Functionary functionary in functionaries)
            {
                List<Visit> visits = VisitsDao.findBy("Id_Functionary", float.Parse(functionary.Id_Functionary.ToString()));

                if (visits != null)
                {
                    result.AddRange(visits);
                }
            }

            return result.Count;
        }

        public static List<Visit> findFunctionaryBy(string field, string value)
        {
            List<Functionary> functionaries = FunctionariesDao.findBy(field, value);

            List<Visit> result = new List<Visit>();

            foreach (Functionary functionary in functionaries)
            {
                List<Visit> visits = VisitsDao.findBy("Id_Functionary", float.Parse(functionary.Id_Functionary.ToString()));

                if (visits != null)
                {
                    result.AddRange(visits);
                }
            }

            return result;
        }

        public static List<Visit> findPersonBy(int start, int limit, string field, string value)
        {
            List<Person> persons = PersonsDao.findBy(field, value);
            List<Visit> result = new List<Visit>();

            foreach (Person person in persons)
            {
                List<Visit> visits = VisitsDao.findBy("Id_Visitor", person.Id_Person);

                if (visits != null)
                {
                    result.AddRange(visits);
                }
            }

            if (result.Count >= limit) { return result.GetRange(start, limit); }
            else { return result; }
        }

        public static List<Visit> findPersonBy(string field, string value)
        {
            List<Person> persons = PersonsDao.findBy(field, value);

            List<Visit> result = new List<Visit>();

            foreach (Person person in persons)
            {
                List<Visit> visits = VisitsDao.findBy("Id_Visitor", float.Parse(person.Id_Person.ToString()));

                if (visits != null)
                {
                    result.AddRange(visits);
                }
            }

            return result;
        }

        public static int CountPersonBy(string field, string value)
        {
            List<Person> persons = PersonsDao.findBy(field, value);

            List<Visit> result = new List<Visit>();

            foreach (Person person in persons)
            {
                List<Visit> visits = VisitsDao.findBy("Id_Visitor", person.Id_Person);

                if (visits != null)
                {
                    result.AddRange(visits);
                }
            }

            return result.Count;
        }

        public static List<Visit> findCompanyBy(int start, int limit, string field, string value)
        {
            List<Company> companys = CompaniesDao.findBy(field, value);
            List<Visit> result = new List<Visit>();

            foreach (Company company in companys)
            {
                List<Person> persons = PersonsDao.findBy("Company", company.Id_Third.ToString());

                foreach (Person person in persons)
                {
                    List<Visit> visits = (List<Visit>)VisitsDao.findBy("Id_Visitor", float.Parse(person.Id_Person.ToString()));

                    if (visits != null)
                    {
                        result.AddRange(visits);
                    }
                }
            }

            if (result.Count >= limit) { return result.GetRange(start, limit); }
            else { return result; }
        }

        public static int CountCompanyBy(string field, string value)
        {
            List<Company> companys = CompaniesDao.findBy(field, value);

            List<Visit> result = new List<Visit>();

            foreach (Company company in companys)
            {
                List<Person> persons = PersonsDao.findBy("Company", company.Id_Third.ToString());

                foreach (Person person in persons)
                {
                    List<Visit> visits = (List<Visit>)VisitsDao.findBy("Id_Visitor", float.Parse(person.Id_Person.ToString()));

                    if (visits != null)
                    {
                        result.AddRange(visits);
                    }
                }
            }

            return result.Count;
        }

        public static List<Visit> findCompanyBy(string field, string value)
        {
            List<Company> companys = CompaniesDao.findBy(field, value);

            List<Visit> result = new List<Visit>();

            foreach (Company company in companys)
            {
                List<Person> persons = PersonsDao.findBy("Company", company.Id_Third.ToString());

                foreach (Person person in persons)
                {
                     List<Visit> visits =  (List<Visit>)VisitsDao.findBy("Id_Visitor", float.Parse(person.Id_Person.ToString()));

                     if (visits != null)
                    {
                        result.AddRange(visits);
                    }
                }
            }

            return result;
        }

        public static List<Visit> findBy(int start, int limit, string field, int value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.Int32, Projections.Property(field)), value))
                .SetFirstResult(start)
                .SetMaxResults(limit)
                .List<Visit>();

            return visit;
        }

        public static int Count(string field, int value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.Int32, Projections.Property(field)), value))
                .List<Visit>();

            return visit.Count;
        }

        public static List<Visit> findBy(string field, int value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.Int32, Projections.Property(field)), value))
                .List<Visit>();

            return visit;
        }
        
        public static List<Visit> findBy(string field, float? value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Eq(Projections.Cast(NHibernateUtil.Double, Projections.Property(field)), value))
                .List<Visit>();

            return visit;
        }

        public static List<Visit> findBy(string field, decimal? value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Eq(field, value))
                .List<Visit>();

            return visit;
        }

        public static List<Visit> findBy(string field, DateTime value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Gt(field, value))
                .List<Visit>();

            return visit;
        }

        public static List<Visit> findBy(int start, int limit, string field, DateTime value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Gt(field, value))
                .SetFirstResult(start)
                .SetMaxResults(limit)
                .List<Visit>();

            return visit;
        }

        public static int Count(string field, DateTime value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Gt(field, value))
                .List<Visit>();

            return visit.Count;
        }

        public static List<Visit> findBy(int start, int limit, string field, string value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
               .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), value))
               .SetFirstResult(start)
               .SetMaxResults(limit)
               .List<Visit>();

            return visit;
        }

        public static List<Visit> findBy(string field, string value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
               .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), value))
               .List<Visit>();

            return visit;
        }

        public static int Count(string field, string value)
        {
            List<Visit> visit = (List<Visit>)Session.CreateCriteria<Visit>()
               .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), value))
               .List<Visit>();

            return visit.Count;
        }

        public static Visit find(int Id_Visit)
        {
            Visit visit = (Visit)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property("Id_Visit")), Id_Visit.ToString()))
                .UniqueResult();

            return visit;
        }

        public static List<Visit> findAll()
        {
            IList<Visit> visits = Session.CreateCriteria<Visit>().List<Visit>();

            return (visits != null) ? new List<Visit>(visits) : new List<Visit>();
        }

        public static List<Visit> findByInitialDate(DateTime InitialDate)
        {
            List<Visit> visits = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Gt("InitialDate", InitialDate))
                .List<Visit>();

            return visits;
        }

        public static List<Visit> findByInitialDate(int start, int limit, DateTime InitialDate)
        {
            List<Visit> visits = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Gt("InitialDate", InitialDate))
                .SetFirstResult(start)
                .SetMaxResults(limit)
                .List<Visit>();

            return visits;
        }

        public static int CountByInitialDate(DateTime InitialDate)
        {
            List<Visit> visits = (List<Visit>)Session.CreateCriteria<Visit>()
                .Add(Restrictions.Gt("InitialDate", InitialDate))
                .List<Visit>();

            return visits.Count;
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
