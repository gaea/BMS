using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate.Criterion;
using NHibernate;

namespace TMA.DAO.EntityManager
{
    public class FunctionariesDao : Dao
    {
        public static List<Functionary> findBy(string field, string value)
        {
            List<Functionary> functionary = (List<Functionary>)Session.CreateCriteria<Functionary>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.String, Projections.Property(field)), value, MatchMode.Anywhere))
                .List<Functionary>();

            return functionary;
        }

        public static List<Functionary> findBy(string field, float value)
        {
            List<Functionary> functionary = (List<Functionary>)Session.CreateCriteria<Functionary>()
                .Add(Restrictions.Eq(Projections.Cast(NHibernateUtil.Double, Projections.Property(field)), value))
                .List<Functionary>();

            return functionary;
        }

        public static Functionary find(float Id_Functionary)
        {
            Functionary functionary = (Functionary)Session.CreateCriteria<Functionary>()
                .Add(Restrictions.Like(Projections.Cast(NHibernateUtil.Double, Projections.Property("Id_Functionary")), Id_Functionary))
                .UniqueResult();

            return functionary;
        }

        public static List<Functionary> findByAll()
        {
            IList<Functionary> iPerson = Session.CreateCriteria<Functionary>().List<Functionary>();

            return (iPerson != null) ? new List<Functionary>(iPerson) : new List<Functionary>();
        }

        public static List<Functionary> findAll()
        {
            IList<Functionary> iPerson = Session.CreateCriteria<Functionary>().List<Functionary>();

            return (iPerson != null) ? new List<Functionary>(iPerson) : new List<Functionary>();
        }

        public static void save(Functionary functionary)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Save(functionary);

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

        public static void update(Functionary functionary)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Clear();

                    Session.Update(functionary);

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

        public static void delete(Functionary functionary)
        {
            using (ITransaction transaction = Session.BeginTransaction())
            {
                try
                {
                    Session.Delete(functionary);

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
