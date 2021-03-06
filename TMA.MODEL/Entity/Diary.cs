﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    public class Diary
    {
        #region Attributes

        private int? id_Diary;

        private decimal id_Functionary;

        private string dateDiary;

        private string hourDiary;

        private decimal id_Visitor;

        private string description;

        private Nullable<DateTime> dateCreateRegistration;

        private Nullable<DateTime> dateModifyRegistration;

        private string id_UserCreateRegistration;

        private string id_UserModifyRegistration;

        private int centerCost;

        private string state;

        private int id_User;

        #endregion

        #region Properties

        public virtual int? Id_Diary
        {
            get { return id_Diary; }
            set { id_Diary = value; }
        }

        public virtual decimal Id_Functionary
        {
            get { return id_Functionary; }
            set { id_Functionary = value; }
        }

        public virtual decimal Id_Visitor
        {
            get { return id_Visitor; }
            set { id_Visitor = value; }
        }

        public virtual string DateDiary
        {
            get { return dateDiary; }
            set { dateDiary = value; }
        }

        public virtual string HourDiary
        {
            get { return hourDiary; }
            set { hourDiary = value; }
        }

        public virtual string Description
        {
            get { return description; }
            set { description = value; }
        }

        public virtual Nullable<DateTime> DateCreateRegistration
        {
            get { return dateCreateRegistration; }
            set { dateCreateRegistration = value; }
        }

        public virtual Nullable<DateTime> DateModifyRegistration
        {
            get { return dateModifyRegistration; }
            set { dateModifyRegistration = value; }
        }

        public virtual string Id_UserCreateRegistration
        {
            get { return id_UserCreateRegistration; }
            set { id_UserCreateRegistration = value; }
        }


        public virtual string Id_UserModifyRegistration
        {
            get { return id_UserModifyRegistration; }
            set { id_UserModifyRegistration = value; }
        }

        public virtual int CenterCost
        {
            get { return centerCost; }
            set { centerCost = value; }
        }

        public virtual string State
        {
            get { return state; }
            set { state = value; }
        }

        public virtual int Id_User
        {
            get { return id_User; }
            set { id_User = value; }
        }

        #endregion

        #region Methods

        public override string ToString()
        {
            return string.Format("Id: {1}{0}Activity: {2}{0} ", Environment.NewLine, this.Id_Diary, this.Description);
        }

        #endregion Methods

    }
}
