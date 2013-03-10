using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TMA.MODEL.Entity
{
    [Serializable]
    public class Company
    {
        #region Attributes

        private int? id_Third;
        private int? id_Subsidiary;
        private int verificationDigit;
        private string name;
        private string address;
        private int? id_City;
        private string airSection;
        private string telephoneNumber;
        private string faxNumber;
        private int codeLegalRepresentation;
        private string nameLegalRepresentation;
        private int documentNumberLegalRepresentation;
        private string observations;
        private string licencySoftware;
        private byte[] logo;
        private int payrollCode;
        private bool biometricReader;
        private string userCreateRegistration;
        private DateTime? dateCreateRegistration;
        private string userModifyRegistration;
        private DateTime? dateModifyRegistration;

        #endregion Attributes

        #region Properties

        public virtual int? Id_Third
        {
            get { return id_Third; }
            set { id_Third = value; }
        }

        public virtual int? Id_Subsidiary
        {
            get { return id_Subsidiary; }
            set { id_Subsidiary = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual int VerificationDigit
        {
            get { return verificationDigit; }
            set { verificationDigit = value; }
        }
        public string Address
        {
            get { return address; }
            set { address = value; }
        }

        public int? Id_City
        {
            get { return id_City; }
            set { id_City = value; }
        }

        public string AirSection
        {
            get { return airSection; }
            set { airSection = value; }
        }

        public string TelephoneNumber
        {
            get { return telephoneNumber; }
            set { telephoneNumber = value; }
        }

        public string FaxNumber
        {
            get { return faxNumber; }
            set { faxNumber = value; }
        }

        public int CodeLegalRepresentation
        {
            get { return codeLegalRepresentation; }
            set { codeLegalRepresentation = value; }
        }

        public string NameLegalRepresentation
        {
            get { return nameLegalRepresentation; }
            set { nameLegalRepresentation = value; }
        }

        public int DocumentNumberLegalRepresentation
        {
            get { return documentNumberLegalRepresentation; }
            set { documentNumberLegalRepresentation = value; }
        }

        public string Observations
        {
            get { return observations; }
            set { observations = value; }
        }

        public string LicencySoftware
        {
            get { return licencySoftware; }
            set { licencySoftware = value; }
        }

        public byte[] Logo
        {
            get { return logo; }
            set { logo = value; }
        }

        public int PayrollCode
        {
            get { return payrollCode; }
            set { payrollCode = value; }
        }

        public bool BiometricReader
        {
            get { return biometricReader; }
            set { biometricReader = value; }
        }

        public virtual string UserCreateRegistration
        {
            get { return userCreateRegistration; }
            set { userCreateRegistration = value; }
        }

        public virtual DateTime? DateCreateRegistration
        {
            get { return dateCreateRegistration; }
            set { dateCreateRegistration = value; }
        }

        public virtual string UserModifyRegistration
        {
            get { return userModifyRegistration; }
            set { userModifyRegistration = value; }
        }

        public virtual DateTime? DateModifyRegistration
        {
            get { return dateModifyRegistration; }
            set { dateModifyRegistration = value; }
        }

        #endregion Properties
    }
}
