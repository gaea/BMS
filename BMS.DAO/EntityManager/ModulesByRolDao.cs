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
    public class ModulesByRolDao : Dao
    {
        public static List<ModuleByRol> findBy(string field, int Id_Module)
        {
            List<ModuleByRol> modules = (List<ModuleByRol>)Session.CreateCriteria<ModuleByRol>()
                .Add(Restrictions.Eq(field, Id_Module))
                .List<ModuleByRol>();

            return modules;
        }

        public static ModuleByRol find(int Id_Module)
        {
            ModuleByRol module = (ModuleByRol)Session.CreateCriteria<ModuleByRol>()
                .Add(Restrictions.Eq("Id_Module", Id_Module))
                .UniqueResult();

            return module;
        }

        public static List<ModuleByRol> findAll()
        {
            IList<ModuleByRol> iModule = Session.CreateCriteria<ModuleByRol>().List<ModuleByRol>();

            return (iModule != null) ? new List<ModuleByRol>(iModule) : new List<ModuleByRol>();
        }

        public static void save(ModuleByRol module)
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

        public static void update(ModuleByRol module)
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

        public static void delete(ModuleByRol module)
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
