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
    public class ModulesDao : Dao
    {
        public static List<Module> findBy(string field, int Id_Module)
        {
            List<Module> modules = (List<Module>)Session.CreateCriteria<Module>()
                .Add(Restrictions.Eq(field, Id_Module))
                .List<Module>();

            return modules;
        }

        public static Module find(int Id_Module)
        {
            Module module = (Module)Session.CreateCriteria<Module>()
                .Add(Restrictions.Eq("Id_Module", Id_Module))
                .UniqueResult();

            return module;
        }

        public static List<Module> findAll()
        {
            IList<Module> iModule = Session.CreateCriteria<Module>().List<Module>();

            return (iModule != null) ? new List<Module>(iModule) : new List<Module>();
        }

        public static void save(Module module)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(module);
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

        public static void update(Module module)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Update(module);
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

        public static void delete(Module module)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(module);
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
