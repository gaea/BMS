using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace TMA.DAO.EntityManager
{
    public class DiariesDao : Dao
    {
        public static List<Diary> findBy(string field, int Id_Diary)
        {
            List<Diary> diary = (List<Diary>)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Eq(field, Id_Diary))
                .List<Diary>();

            return diary;
        }

        public static Diary find(int Id_Diary)
        {
            Diary diary = (Diary)Session.CreateCriteria<Diary>()
                .Add(Restrictions.Eq("Id_Diary", Id_Diary))
                .UniqueResult();

            return diary;
        }

        public static List<Diary> findAll()
        {
            IList<Diary> iHeadquarter = Session.CreateCriteria<Diary>().List<Diary>();

            return (iHeadquarter != null) ? new List<Diary>(iHeadquarter) : new List<Diary>();
        }

        public static void save(Diary diary)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Save(diary);

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

        public static void update(Diary diary)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(diary);

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

        public static void delete(Diary diary)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(diary);

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
