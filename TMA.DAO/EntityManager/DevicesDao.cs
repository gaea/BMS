using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate;
using NHibernate.Criterion;
using TMA.MODEL.Entity;

namespace TMA.DAO.EntityManager
{
    public class DevicesDao : Dao
    {
        public static List<Device> FindBy(int start, int limit, string field, object value)
        {
            Session.Clear();

            ICriteria criteria = Session.CreateCriteria<Device>();

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

            List<Device> iDevice = (List<Device>)criteria.List<Device>();

            return iDevice;
        }

        public static int Count(string field, object value)
        {
            Session.Clear();

            ICriteria criteria = Session.CreateCriteria<Device>();

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

            IList<Device> iDevice = criteria.List<Device>();

            return (iDevice != null) ? iDevice.Count : 0;
        }

        public static int Count()
        {
            Session.Clear();

            IList<Device> iDevice = Session.CreateCriteria<Device>().List<Device>();

            return (iDevice != null) ? iDevice.Count : 0;
        }

        public static List<Device> findAll(int start, int limit)
        {
            Session.Clear();

            IList<Device> iDevice = Session.CreateCriteria<Device>()
                .AddOrder(Order.Desc("Id"))
                .SetFirstResult(start)
                .SetMaxResults(limit)
                .List<Device>();

            return (iDevice != null) ? new List<Device>(iDevice) : new List<Device>();
        }
    }
}
