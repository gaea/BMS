
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using TMA.MODEL.Entity;

namespace TMA.DAO.EntityManager
{
    public class HeadquartersDao : Dao
    {
        public static List<Headquarter> findBy(string field, int Id_User)
        {
            List<Headquarter> Headquarter = (List<Headquarter>)Session.CreateCriteria<Headquarter>()
                .Add(Restrictions.Eq(field, Id_User))
                .List<Headquarter>();

            return Headquarter;
        }

        public static Headquarter find(short Id_User)
        {
            Headquarter headquarter = (Headquarter)Session.CreateCriteria<Headquarter>()
                .Add(Restrictions.Eq("Id_Headquarter", Id_User))
                .UniqueResult();

            return headquarter;
        }

        public static List<Headquarter> findAll()
        {
            IList<Headquarter> iHeadquarter = Session.CreateCriteria<Headquarter>().List<Headquarter>();

            return (iHeadquarter != null) ? new List<Headquarter>(iHeadquarter) : new List<Headquarter>();
        }

        public static void save(Headquarter headquarter)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(headquarter);

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

        public static void update(Headquarter headquarter)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Update(headquarter);

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

        public static void delete(Headquarter headquarter)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(headquarter);

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
