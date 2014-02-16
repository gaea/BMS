using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using TMA.MODEL.Entity;

namespace TMA.DAO.EntityManager
{
    public class AuditEntryDao : Dao
    {
        public static List<AuditEntry> FindBy(int start, int limit, string field, object value)
        {
            Session.Clear();

            ICriteria criteria = Session.CreateCriteria<AuditEntry>();

            if (field.Equals("RecordDate"))
            {
                DateTime RecordDate = Convert.ToDateTime(value);

                DateTime InitialRecordDate = new DateTime(RecordDate.Year, RecordDate.Month, RecordDate.Day, 0, 0, 0);
                DateTime FinalRecordDate = new DateTime(RecordDate.Year, RecordDate.Month, RecordDate.Day, 23, 59, 59);

                criteria.Add(Restrictions.Between("RecordDate", InitialRecordDate, FinalRecordDate));
            }
            else
            {
                criteria.Add(Restrictions.Like(field, value.ToString(), MatchMode.Anywhere));
            }
          
            criteria.SetFirstResult(start);
            criteria.SetMaxResults(limit);

            List<AuditEntry> iAuditEntrys = (List<AuditEntry>)criteria.List<AuditEntry>();

            return iAuditEntrys;
        }

        public static int Count(string field, object value)
        {
            Session.Clear();

            ICriteria criteria = Session.CreateCriteria<AuditEntry>();

            if (field.Equals("RecordDate"))
            {
                DateTime RecordDate = Convert.ToDateTime(value);

                DateTime InitialRecordDate = new DateTime(RecordDate.Year, RecordDate.Month, RecordDate.Day, 0, 0, 0);
                DateTime FinalRecordDate = new DateTime(RecordDate.Year, RecordDate.Month, RecordDate.Day, 23, 59, 59);

                criteria.Add(Restrictions.Between("RecordDate", InitialRecordDate, FinalRecordDate));
            }
            else
            {
                criteria.Add(Restrictions.Like(field, value.ToString(), MatchMode.Anywhere));
            }

            IList<AuditEntry> iAuditEntrys = criteria.List<AuditEntry>();

            return (iAuditEntrys != null) ? iAuditEntrys.Count : 0;
        }

        public static int Count()
        {
            Session.Clear();

            IList<AuditEntry> iAuditEntry = Session.CreateCriteria<AuditEntry>().List<AuditEntry>();

            return (iAuditEntry != null) ? iAuditEntry.Count : 0;
        }

        public static List<AuditEntry> findAll(int start, int limit)
        {
            Session.Clear();

            IList<AuditEntry> iAuditEntry = Session.CreateCriteria<AuditEntry>()
                .AddOrder(Order.Desc("Id"))
                .SetFirstResult(start)
                .SetMaxResults(limit)
                .List<AuditEntry>();

            return (iAuditEntry != null) ? new List<AuditEntry>(iAuditEntry) : new List<AuditEntry>();
        }
    }
}
