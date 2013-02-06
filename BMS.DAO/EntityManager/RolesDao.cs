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
    public class RolesDao : Dao
    {
        public static List<Rol> findBy(string field, int Id_Rol)
        {
            List<Rol> roles = (List<Rol>)Session.CreateCriteria<Rol>()
                .Add(Restrictions.Eq(field, Id_Rol))
                .List<Rol>();

            return roles;
        }

        public static Rol find(int Id_Rol)
        {
            Rol rol = (Rol)Session.CreateCriteria<Rol>()
                .Add(Restrictions.Eq("Id_Rol", Id_Rol))
                .UniqueResult();

            return rol;
        }

        public static List<Rol> findAll()
        {
            IList<Rol> iRol = Session.CreateCriteria<Rol>().List<Rol>();

            return (iRol != null) ? new List<Rol>(iRol) : new List<Rol>();
        }

        public static void save(Rol role)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(role);
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

        public static void update(Rol role)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Update(role);
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

        public static void delete(Rol rol)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(rol);
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
