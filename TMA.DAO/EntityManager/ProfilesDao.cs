
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using TMA.MODEL.Entity;

namespace TMA.DAO.EntityManager
{
    public class ProfilesDao : Dao
    {
        public static List<Profile> findBy(string field, int Id_Profile)
        {
            List<Profile> profile = (List<Profile>)Session.CreateCriteria<Profile>()
                .Add(Restrictions.Eq(field, Id_Profile))
                .List<Profile>();

            return profile;
        }

        public static Profile find(int Id_Profile)
        {
            Profile profile = (Profile)Session.CreateCriteria<Profile>()
                .Add(Restrictions.Eq("Id_Profile", Id_Profile))
                .UniqueResult();

            return profile;
        }

        public static List<Profile> findAll()
        {
            IList<Profile> iHeadquarter = Session.CreateCriteria<Profile>().List<Profile>();

            return (iHeadquarter != null) ? new List<Profile>(iHeadquarter) : new List<Profile>();
        }

        public static void save(Profile profile)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(profile);

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

        public static void update(Profile profile)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(profile);

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

        public static void delete(Profile profile)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(profile);

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
