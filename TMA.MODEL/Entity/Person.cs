using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    public class Person
    {
        #region Attributes

        private float? id_Person;

        private int id_BiometricReader;

        private string company;

        private int id_Headquarter;

        private string name;

        private string lastName;

        private int birthdayMonth;

        private int birthdayDay;

        private string address;

        private int city;

        private int postalZone;

        private string zipCode;

        private int telephoneNumber;

        private float celphoneNumber;

        private string beeperNumber;

        private string beeperCode;

        private int faxNumber;

        private string email;

        private string password;

        private int chargeCode;

        private int byPayroll;

        private int byHour;

        private int integralSalary;

        private int contractClass;

        private int isActive;

        private int dependencyCode;

        private int centerCost;

        private string turn;

        private int extensionNumber;

        private string bossName;

        private int extensionBoss;

        private string observations;

        private int indexReader;

        private int indexOther;

        private byte fingerPrint;

        private byte photo;

        private string id_UserCreateRegistration;

        private DateTime dateCreateRegistration;

        private string id_UserModifyRegistration;

        private DateTime dateModifyRegistration;

        private int contractor;
      
        private string dateValidityARP;
       
        #endregion Attributes

        #region Properties

        public virtual float? Id_Person
        {
            get { return id_Person; }
            set { id_Person = value; }
        }

        public virtual int Id_BiometricReader
        {
            get { return id_BiometricReader; }
            set { id_BiometricReader = value; }
        }

        public virtual string Company
        {
            get { return company; }
            set { company = value; }
        }

        public virtual int Id_Headquarter
        {
            get { return id_Headquarter; }
            set { id_Headquarter = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual string LastName
        {
            get { return lastName; }
            set { lastName = value; }
        }

        public virtual int BirthdayMonth
        {
            get { return birthdayMonth; }
            set { birthdayMonth = value; }
        }

        public virtual int BirthdayDay
        {
            get { return birthdayDay; }
            set { birthdayDay = value; }
        }

        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }

        public virtual int City
        {
            get { return city; }
            set { city = value; }
        }

        public virtual int PostalZone
        {
            get { return postalZone; }
            set { postalZone = value; }
        }

        public virtual string ZipCode
        {
            get { return zipCode; }
            set { zipCode = value; }
        }

        public virtual int TelephoneNumber
        {
            get { return telephoneNumber; }
            set { telephoneNumber = value; }
        }

        public virtual float CelphoneNumber
        {
            get { return celphoneNumber; }
            set { celphoneNumber = value; }
        }

        public virtual string BeeperNumber
        {
            get { return beeperNumber; }
            set { beeperNumber = value; }
        }

        public virtual string BeeperCode
        {
            get { return beeperCode; }
            set { beeperCode = value; }
        }

        public virtual int FaxNumber
        {
            get { return faxNumber; }
            set { faxNumber = value; }
        }

        public virtual string Email
        {
            get { return email; }
            set { email = value; }
        }

        public virtual string Password
        {
            get { return password; }
            set { password = value; }
        }

        public virtual int ChargeCode
        {
            get { return chargeCode; }
            set { chargeCode = value; }
        }

        public virtual int ByPayroll
        {
            get { return byPayroll; }
            set { byPayroll = value; }
        }

        public virtual int ByHour
        {
            get { return byHour; }
            set { byHour = value; }
        }

        public virtual int IntegralSalary
        {
            get { return integralSalary; }
            set { integralSalary = value; }
        }

        public virtual int ContractClass
        {
            get { return contractClass; }
            set { contractClass = value; }
        }

        public virtual int IsActive
        {
            get { return isActive; }
            set { isActive = value; }
        }

        public virtual int DependencyCode
        {
            get { return dependencyCode; }
            set { dependencyCode = value; }
        }

        public virtual int CenterCost
        {
            get { return centerCost; }
            set { centerCost = value; }
        }

        public virtual string Turn
        {
            get { return turn; }
            set { turn = value; }
        }

        public virtual int ExtensionNumber
        {
            get { return extensionNumber; }
            set { extensionNumber = value; }
        }

        public virtual string BossName
        {
            get { return bossName; }
            set { bossName = value; }
        }

        public virtual int ExtensionBoss
        {
            get { return extensionBoss; }
            set { extensionBoss = value; }
        }

        public virtual string Observations
        {
            get { return observations; }
            set { observations = value; }
        }

        public virtual int IndexReader
        {
            get { return indexReader; }
            set { indexReader = value; }
        }

        public virtual int IndexOther
        {
            get { return indexOther; }
            set { indexOther = value; }
        }

        public virtual byte FingerPrint
        {
            get { return fingerPrint; }
            set { fingerPrint = value; }
        }

        public virtual byte Photo
        {
            get { return photo; }
            set { photo = value; }
        }

        public virtual string Id_UserCreateRegistration
        {
            get { return id_UserCreateRegistration; }
            set { id_UserCreateRegistration = value; }
        }

        public virtual DateTime DateCreateRegistration
        {
            get { return dateCreateRegistration; }
            set { dateCreateRegistration = value; }
        }

        public virtual string Id_UserModifyRegistration
        {
            get { return id_UserModifyRegistration; }
            set { id_UserModifyRegistration = value; }
        }

        public virtual DateTime DateModifyRegistration
        {
            get { return dateModifyRegistration; }
            set { dateModifyRegistration = value; }
        }

        public virtual int Contractor
        {
            get { return contractor; }
            set { contractor = value; }
        }

        public virtual string DateValidityARP
        {
            get { return dateValidityARP; }
            set { dateValidityARP = value; }
        }
        #endregion Properties
    }
}

