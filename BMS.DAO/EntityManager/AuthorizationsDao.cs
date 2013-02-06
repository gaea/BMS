using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BMS.MODEL;
using BMS.MODEL.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace BMS.DAO.EntityManager
{
    public class AuthorizationsDao : Dao
    {
        public static List<Authorization> findBy(string field, int Id_Authorization)
        {
            List<Authorization> authorizations = (List<Authorization>)Session.CreateCriteria<Authorization>()
                .Add(Restrictions.Eq(field, Id_Authorization))
                .List<Authorization>();

            return authorizations;
        }

        public static Authorization find(int Id_Authorization)
        {
            Authorization authorization = (Authorization)Session.CreateCriteria<Authorization>()
                .Add(Restrictions.Eq("Id_Authorization", Id_Authorization))
                .UniqueResult();

            return authorization;
        }

        public static List<Authorization> findAll()
        {
            IList<Authorization> iModule = Session.CreateCriteria<Authorization>().List<Authorization>();

            return (iModule != null) ? new List<Authorization>(iModule) : new List<Authorization>();
        }

        public static void save(Authorization authorization)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(authorization);
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

        public static void update(Authorization authorization)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Update(authorization);
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

        public static void delete(Authorization authorization)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(authorization);
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
