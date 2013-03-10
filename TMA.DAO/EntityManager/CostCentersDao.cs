using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate;
using TMA.MODEL.Entity;
using NHibernate.Criterion;

namespace TMA.DAO.EntityManager
{
    public class CostCentersDao : Dao
    {
        public static List<CostCenter> findBy(string field, int val)
        {
            List<CostCenter> costCenter = (List<CostCenter>)Session.CreateCriteria<CostCenter>()
                .Add(Restrictions.Eq(field, val))
                .List<CostCenter>();

            return costCenter;
        }

        public static CostCenter find(int Id_CostCenter)
        {
            CostCenter costCenter = (CostCenter)Session.CreateCriteria<CostCenter>()
                .Add(Restrictions.Eq("Id_CostCenter", Id_CostCenter))
                .UniqueResult();

            return costCenter;
        }

        public static List<CostCenter> findAll()
        {
            IList<CostCenter> iCompany = Session.CreateCriteria<CostCenter>().List<CostCenter>();

            return (iCompany != null) ? new List<CostCenter>(iCompany) : new List<CostCenter>();
        }

        public static void save(CostCenter costCenter)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(costCenter);

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

        public static void update(CostCenter costCenter)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(costCenter);

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

        public static void delete(CostCenter costCenter)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(costCenter);

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
