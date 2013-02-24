using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using TMA.DAO.EntityManager;

namespace TMA.DAO.TEST
{
    public class Program
    {
        public enum TypeTest
        {
            Diary,
            Person,
            Headquarter,
            User,
            Visit,
            Profile
        }

        static void Main(string[] args)
        {
            #region Consulta Usuarios por Id
            //Headquarter head = HeadquartersDao.find(1);
            //Users user = TMA.DAO.EntityManager.UsersDao.find(2);
            //Profile profile = ProfilesDao.find(8);

            #endregion Consulta Usuarios por Id

            #region Crear Registro Usuario

            Test(TypeTest.Visit);


            //if (user == null)
            //{
            //    user = new TMA.MODEL.Entity.Users()
            //    {
            //        Id_User = 2,
            //        IsActive = true,
            //        Id_Role = 1,
            //        DocumentType = 1,
            //        DateCreateRegistration = System.DateTime.Now,
            //        DateModifyRegistration = System.DateTime.Now,
            //        Name = "Agus",
            //        Login = "agus"
            //    };

            //    TMA.DAO.EntityManager.UsersDao.save(user);
            //}

            //if (head == null)
            //{
            //    head = new TMA.MODEL.Entity.Headquarter() { Id_Headquarter = 3, Description = "Este" };
            //    TMA.DAO.EntityManager.HeadquartersDao.save(head);
            //}

            //if (profile == null)
            //{
            //    profile = new TMA.MODEL.Entity.Profile() { Id_Profile = 4, Description = "Administrador", DateCreateRegistration = DateTime.Now, Id_User = 1, DateModifyRegistration = DateTime.Now, Id_UserModifyRegistration = 1 };
            //    TMA.DAO.EntityManager.ProfilesDao.save(profile);
            //}
            #endregion Crear Registro Usuario

        }

        public static void Test(TypeTest type)
        {
            switch (type)
            {
                case TypeTest.Diary:
                    {
                        Diary diary = DiarysDao.find(1);

                        if (diary == null)
                        {
                            diary = new TMA.MODEL.Entity.Diary()
                            {
                                DateCreateTransaction = "0",
                                HourCreateTransaction = "0",
                                DateCreateRegistration = DateTime.Now.ToLocalTime(),
                                DateModifyRegistration = DateTime.Now.ToLocalTime(),
                                CenterCost = 1

                            };

                            TMA.DAO.EntityManager.DiarysDao.save(diary);
                        }

                        break;
                    }
                case TypeTest.Person:
                    {
                        Person person = PersonsDao.find(1);

                        if (person == null)
                        {
                            person = new TMA.MODEL.Entity.Person()
                            {
                                Id_BiometricReader = 500003,
                                Name = "Agustín",
                                LastName = "Mejía",
                                DateCreateRegistration = DateTime.Now,
                                DateModifyRegistration = DateTime.Now,

                            };

                            TMA.DAO.EntityManager.PersonsDao.save(person);
                        }

                        break;
                    }

                case TypeTest.Visit:
                    {
                        Visit visit = VisitsDao.find(8);

                        if (visit == null)
                        {
                            visit = new TMA.MODEL.Entity.Visit()
                            {
                                Id_Visit = 0,
                                Id_Visitor = 1,
                                DocumentNumberVisitor = 1,
                                VisitDescription = "Capacitación",
                                ElementsToGetIn = "Pc",
                                DateCreateTransaction = DateTime.Now,
                                DateCreateRegistration = DateTime.Now,
                                DateModifyRegistration = DateTime.Now,
                                FinalDate = DateTime.Now,
                                FinalHour = DateTime.Now,
                                InitialDate = DateTime.Now,
                                InitialHour = DateTime.Now,
                                Id_UserCreateRegistration = "1",
                                Id_UserModifyRegistration = "1",
                                Id_Area = 1
                            };

                            TMA.DAO.EntityManager.VisitsDao.save(visit);
                        }

                        break;
                    }
            }
        }
    }
}
