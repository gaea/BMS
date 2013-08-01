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
