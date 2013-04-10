﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using TMA.MODEL.Entity;

namespace TMA.DAO.EntityManager
{
    public class AuthorizationsDao : Dao
    {
        public static List<Authorization> findBy(int start, int limit, string field, int value)
        {
            List<Authorization> authorizations = (List<Authorization>)Session.CreateCriteria<Authorization>()
                .Add(Restrictions.Eq(field, value))
                .List<Authorization>();

            return authorizations;
        }

        public static Authorization findBy(int start, int limit, string field, string value)
        {
            Authorization authorization = (Authorization)Session.CreateCriteria<Authorization>()
                .Add(Restrictions.Eq(field, value))
                .SetFirstResult(start)
                .SetMaxResults(limit)
                .UniqueResult();

            return authorization;
        }

        public static Authorization find(int Id_Authorization)
        {
            Authorization authorization = (Authorization)Session.CreateCriteria<Authorization>()
                .Add(Restrictions.Eq("Id_Authorization", Id_Authorization))
                .UniqueResult();

            return authorization;
        }

        public static int Count()
        {
            IList<Authorization> iAuthorizations = Session.CreateCriteria<Authorization>()
                .List<Authorization>();

            return iAuthorizations.Count;
        }

        public static List<Authorization> findAll(int start, int limit)
        {
            IList<Authorization> iAuthorizations = Session.CreateCriteria<Authorization>()
                .SetFirstResult(start)
                .SetMaxResults(limit)
                .List<Authorization>();

            return (iAuthorizations != null) ? new List<Authorization>(iAuthorizations) : new List<Authorization>();
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
                    Session.Clear();
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