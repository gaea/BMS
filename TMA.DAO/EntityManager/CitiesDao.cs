using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate.Criterion;
using NHibernate;

namespace TMA.DAO.EntityManager
{
    public class CitiesDao : Dao
    {
        public static List<City> findBy(string field, int Id_City)
        {
            List<City> city = (List<City>)Session.CreateCriteria<City>()
                .Add(Restrictions.Eq(field, Id_City))
                .List<City>();

            return city;
        }

        public static City find(int Id_City)
        {
            City city = (City)Session.CreateCriteria<City>()
                .Add(Restrictions.Eq("Id_City", Id_City))
                .UniqueResult();

            return city;
        }

        public static List<City> findAll()
        {
            IList<City> iHeadquarter = Session.CreateCriteria<City>().List<City>();

            return (iHeadquarter != null) ? new List<City>(iHeadquarter) : new List<City>();
        }

        public static void save(City city)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(city);

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

        public static void update(City city)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(city);

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

        public static void delete(City city)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(city);

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
