using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate.Criterion;
using NHibernate;

namespace TMA.DAO.EntityManager
{
    public class DepartmentsDao : Dao
    {
        public static List<Department> findBy(string field, int Id_Department)
        {
            List<Department> department = (List<Department>)Session.CreateCriteria<Department>()
                .Add(Restrictions.Eq(field, Id_Department))
                .List<Department>();

            return department;
        }

        public static Department find(int Id_Department)
        {
            Department department = (Department)Session.CreateCriteria<Department>()
                .Add(Restrictions.Eq("Id_Department", Id_Department))
                .UniqueResult();

            return department;
        }

        public static List<Department> findAll()
        {
            IList<Department> iHeadquarter = Session.CreateCriteria<Department>().List<Department>();

            return (iHeadquarter != null) ? new List<Department>(iHeadquarter) : new List<Department>();
        }

        public static void save(Department department)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(department);

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

        public static void update(Department department)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(department);

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

        public static void delete(Department department)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(department);

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
