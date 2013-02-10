
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

        public static Headquarter find(int Id_User)
        {
            Headquarter user = (Headquarter)Session.CreateCriteria<Headquarter>()
                .Add(Restrictions.Eq("Id_Headquarter", Id_User))
                .UniqueResult();

            return user;
        }

        public static List<Headquarter> findAll()
        {
            IList<Headquarter> iHeadquarter = Session.CreateCriteria<Headquarter>().List<Headquarter>();

            return (iHeadquarter != null) ? new List<Headquarter>(iHeadquarter) : new List<Headquarter>();
        }

        public static void save(Headquarter user)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(user);

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

        public static void update(Headquarter user)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Update(user);

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

        public static void delete(Headquarter user)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(user);

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
