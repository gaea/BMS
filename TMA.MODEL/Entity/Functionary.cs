using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Functionary
    {
        #region Attributes

        private decimal? id_Functionary;
        private int? id_BiometricReader;
        private int? id_Company;
        private int? id_Headquarter;
        private string name;
        private string lastName;
        private int? id_Dependency;
        private int? birthdayMonth;
        private int? birthdayDay;
        private string address;
        private int? id_City;
        private int? postalZone;
        private string airSection;
        private int? telephoneNumber;
        private float? celphoneNumber;
        private string beeperNumber;
        private string beeperCode;
        private int? faxNumber;
        private string email;
        private string password;
        private int? id_Charge;
        private bool byPayroll;
        private bool byHour;
        private bool integralSalary;
        private int? contractClass;
        private bool isActive;
        private int? id_CostCenter;
        private string turn;
        private int? extensionNumber;
        private string bossName;
        private int? bossExtensionNumber;
        private string observations;
        private int? indexReader;
        private int? id_Between;
        private byte[] fingerPrint;
        private byte[] photo;
        private string id_UserCreateRegistration;
        private DateTime? dateCreateRegistration;
        private string id_UserModifyRegistration;
        private DateTime? dateModifyRegistration;

        #endregion Attributes

        #region Properties

        public virtual decimal? Id_Functionary
        {
            get { return id_Functionary; }
            set { id_Functionary = value; }
        }

        public virtual int? Id_BiometricReader
        {
            get { return id_BiometricReader; }
            set { id_BiometricReader = value; }
        }

        public virtual int? Id_Company
        {
            get { return id_Company; }
            set { id_Company = value; }
        }

        public virtual int? Id_Headquarter
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

        public virtual int? Id_Dependency
        {
            get { return id_Dependency; }
            set { id_Dependency = value; }
        }

        public virtual int? BirthdayMonth
        {
            get { return birthdayMonth; }
            set { birthdayMonth = value; }
        }

        public virtual int? BirthdayDay
        {
            get { return birthdayDay; }
            set { birthdayDay = value; }
        }

        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }

        public virtual int? Id_City
        {
            get { return id_City; }
            set { id_City = value; }
        }

        public virtual int? PostalZone
        {
            get { return postalZone; }
            set { postalZone = value; }
        }

        public virtual string AirSection
        {
            get { return airSection; }
            set { airSection = value; }
        }

        public virtual int? TelephoneNumber
        {
            get { return telephoneNumber; }
            set { telephoneNumber = value; }
        }

        public virtual float? CelphoneNumber
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

        public virtual int? FaxNumber
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

        public virtual int? Id_Charge
        {
            get { return id_Charge; }
            set { id_Charge = value; }
        }

        public virtual bool ByPayroll
        {
            get { return byPayroll; }
            set { byPayroll = value; }
        }

        public virtual bool ByHour
        {
            get { return byHour; }
            set { byHour = value; }
        }

        public virtual bool IntegralSalary
        {
            get { return integralSalary; }
            set { integralSalary = value; }
        }

        public virtual int? ContractClass
        {
            get { return contractClass; }
            set { contractClass = value; }
        }

        public virtual bool IsActive
        {
            get { return isActive; }
            set { isActive = value; }
        }

        public virtual int? Id_CostCenter
        {
            get { return id_CostCenter; }
            set { id_CostCenter = value; }
        }

        public virtual string Turn
        {
            get { return turn; }
            set { turn = value; }
        }

        public virtual int? ExtensionNumber
        {
            get { return extensionNumber; }
            set { extensionNumber = value; }
        }

        public virtual string BossName
        {
            get { return bossName; }
            set { bossName = value; }
        }

        public virtual int? BossExtensionNumber
        {
            get { return bossExtensionNumber; }
            set { bossExtensionNumber = value; }
        }

        public virtual string Observations
        {
            get { return observations; }
            set { observations = value; }
        }

        public virtual int? IndexReader
        {
            get { return indexReader; }
            set { indexReader = value; }
        }

        public virtual int? Id_Between
        {
            get { return id_Between; }
            set { id_Between = value; }
        }

        public virtual byte[] FingerPrint
        {
            get { return fingerPrint; }
            set { fingerPrint = value; }
        }

        public virtual byte[] Photo
        {
            get { return photo; }
            set { photo = value; }
        }

        public virtual string Id_UserCreateRegistration
        {
            get { return id_UserCreateRegistration; }
            set { id_UserCreateRegistration = value; }
        }

        public virtual DateTime? DateCreateRegistration
        {
            get { return dateCreateRegistration; }
            set { dateCreateRegistration = value; }
        }

        public virtual string Id_UserModifyRegistration
        {
            get { return id_UserModifyRegistration; }
            set { id_UserModifyRegistration = value; }
        }

        public virtual DateTime? DateModifyRegistration
        {
            get { return dateModifyRegistration; }
            set { dateModifyRegistration = value; }
        }

        #endregion Properties
    }
}
