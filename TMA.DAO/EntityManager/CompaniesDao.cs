using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate.Criterion;
using NHibernate;

namespace TMA.DAO.EntityManager
{
    public class CompaniesDao : Dao
    {
        public static List<Company> findBy(string field, string val)
        {
            List<Company> company = (List<Company>)Session.CreateCriteria<Company>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), val, MatchMode.Anywhere))
                .List<Company>();

            return company;
        }

        public static Company find(int Id_Third)
        {
            Company company = (Company)Session.CreateCriteria<Company>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property("Id_Third")), Id_Third))
                .UniqueResult();

            return company;
        }

        public static List<Company> findAll()
        {
            IList<Company> iCompany = Session.CreateCriteria<Company>().List<Company>();

            return (iCompany != null) ? new List<Company>(iCompany) : new List<Company>();
        }

        public static void save(Company company)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(company);

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

        public static void update(Company company)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(company);

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

        public static void delete(Company company)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(company);

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
