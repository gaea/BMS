using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate.Criterion;
using NHibernate;

namespace TMA.DAO.EntityManager
{
    public class ChargesDao : Dao
    {
        public static List<Charge> findBy(string field, int Id_Charge)
        {
            List<Charge> charge = (List<Charge>)Session.CreateCriteria<Charge>()
                .Add(Restrictions.Eq(field, Id_Charge))
                .List<Charge>();

            return charge;
        }

        public static Charge find(int Id_Charge)
        {
            Charge charge = (Charge)Session.CreateCriteria<Charge>()
                .Add(Restrictions.Eq("Id_Charge", Id_Charge))
                .UniqueResult();

            return charge;
        }

        public static List<Charge> findAll()
        {
            IList<Charge> iHeadquarter = Session.CreateCriteria<Charge>().List<Charge>();

            return (iHeadquarter != null) ? new List<Charge>(iHeadquarter) : new List<Charge>();
        }

        public static void save(Charge charge)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(charge);

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

        public static void update(Charge charge)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(charge);

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

        public static void delete(Charge charge)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(charge);

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
