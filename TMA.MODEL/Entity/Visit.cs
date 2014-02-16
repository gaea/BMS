using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Visit
    {
        #region Attributes

        private int? id_Visit;
        private decimal? id_Visitor;
        private DateTime? dateCreateTransaction;
        private float id_Functionary;
        private string visitDescription;
        private string elementsToGetIn;
        private char activity;
        private DateTime? initialDate;
        private DateTime? initialHour;
        private DateTime? finalDate;
        private DateTime? finalHour;
        private string visitDuration;
        private int id_Usuario;
        private int id_Area;
        private string tracing;
        private bool outEquipment;
        private bool scheduledVisit;
        private string barCode;
        private string provider;
        private DateTime? dateCreateRegistration;
        private DateTime? dateModifyRegistration;
        private string id_UserCreateRegistration;
        private string id_UserModifyRegistration;


        #endregion

        #region Properties

        public virtual int? Id_Visit
        {
            get { return id_Visit; }
            set { id_Visit = value; }
        }

        public virtual decimal? Id_Visitor
        {
            get { return id_Visitor; }
            set { id_Visitor = value; }
        }

        public virtual DateTime? DateCreateTransaction
        {
            get { return dateCreateTransaction; }
            set { dateCreateTransaction = value; }
        }

        public virtual float Id_Functionary
        {
            get { return id_Functionary; }
            set { id_Functionary = value; }
        }

        public virtual string VisitDescription
        {
            get { return visitDescription; }
            set { visitDescription = value; }
        }

        public virtual char Activity
        {
            get { return activity; }
            set { activity = value; }
        }

        public virtual string ElementsToGetIn
        {
            get { return elementsToGetIn; }
            set { elementsToGetIn = value; }
        }

        public virtual DateTime? InitialDate
        {
            get { return initialDate; }
            set { initialDate = value; }
        }

        public virtual DateTime? InitialHour
        {
            get { return initialHour; }
            set { initialHour = value; }
        }

        public virtual DateTime? FinalDate
        {
            get { return finalDate; }
            set { finalDate = value; }
        }

        public virtual DateTime? FinalHour
        {
            get { return finalHour; }
            set { finalHour = value; }
        }

        public virtual string VisitDuration
        {
            get { return visitDuration; }
            set { visitDuration = value; }
        }

        public virtual int Id_Usuario
        {
            get { return id_Usuario; }
            set { id_Usuario = value; }
        }

        public virtual int Id_Area
        {
            get { return id_Area; }
            set { id_Area = value; }
        }

        public virtual string Tracing
        {
            get { return tracing; }
            set { tracing = value; }
        }

        public virtual bool OutEquipment
        {
            get { return outEquipment; }
            set { outEquipment = value; }
        }

        public virtual bool ScheduledVisit
        {
            get { return scheduledVisit; }
            set { scheduledVisit = value; }
        }

        public virtual string BarCode
        {
            get { return barCode; }
            set { barCode = value; }
        }

        public virtual string Provider
        {
            get { return provider; }
            set { provider = value; }
        }

        public virtual DateTime? DateCreateRegistration
        {
            get { return dateCreateRegistration; }
            set { dateCreateRegistration = value; }
        }

        public virtual DateTime? DateModifyRegistration
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



        #endregion

        #region Methods

        public override string ToString()
        {
            return string.Format("Id: {1}{0}Activity: {2}{0} ", Environment.NewLine, this.Id_Visit, this.activity);
        }

        #endregion
    }
}
