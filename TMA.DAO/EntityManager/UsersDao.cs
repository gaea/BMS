
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using TMA.MODEL.Entity;

namespace TMA.DAO.EntityManager
{
    public class UsersDao : Dao
    {
        public static List<Users> findBy(string field, int Id_User)
        {
            List<Users> users = (List<Users>)Session.CreateCriteria<Users>()
                .Add(Restrictions.Eq(field, Id_User))
                .List<Users>();

            return users;
        }

        public static Users find(int Id_User)
        {
            Users user = (Users)Session.CreateCriteria<Users>()
                .Add(Restrictions.Eq("Id_User", Id_User))
                .UniqueResult();

            return user;
        }

        public static List<Users> findAll()
        {
            IList<Users> iUsers = Session.CreateCriteria<Users>().List<Users>();

            return (iUsers != null) ? new List<Users>(iUsers) : new List<Users>();
        }

        public static void save(Users user)
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

        public static void update(Users user)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    //Session.Evict(user);
                    //Session.Merge(user);
                    Session.Clear();
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

        public static void delete(Users user)
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
