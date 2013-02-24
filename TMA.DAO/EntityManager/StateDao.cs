using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using NHibernate;
using NHibernate.Criterion;

namespace TMA.DAO.EntityManager
{
    public class StateDao : Dao
    {
        public static State find(int Id_State)
        {
            State state = (State)Session.CreateCriteria<State>()
                .Add(Restrictions.Eq("Id_State", Id_State))
                .UniqueResult();

            return state;
        }

        public static List<State> findAll()
        {
            IList<State> iState = Session.CreateCriteria<State>().List<State>();

            return (iState != null) ? new List<State>(iState) : new List<State>();
        }
    }
}
