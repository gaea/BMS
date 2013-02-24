using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace TMA.DAO.EntityManager
{
    public class EntryTypeDao: Dao
    {
        public static EntryType find(int Id_EntryType)
        {
            EntryType entryType = (EntryType)Session.CreateCriteria<EntryType>()
                .Add(Restrictions.Eq("Id_EntryType", Id_EntryType))
                .UniqueResult();

            return entryType;
        }

        public static List<EntryType> findAll()
        {
            try
            {
                IList<EntryType> iEntryType = Session.CreateCriteria<EntryType>().List<EntryType>();
                return (iEntryType != null) ? new List<EntryType>(iEntryType) : new List<EntryType>();
            }
            catch (Exception ex)
            {
                throw ex;   
            }
        }
    }
}
