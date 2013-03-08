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
            Profile,
            City,
            Department
        }

        static void Main(string[] args)
        {
            //List<Company> companies = CompaniesDao.findAll();

            #region Crear Registro Usuario

            List<Users> users = UsersDao.findAll();

            foreach(Users uniqueuser in users)
            {
                System.Console.WriteLine(uniqueuser.ToString());
            }

            Users user = UsersDao.findBy("Name", "germanavis");

            if (user == null)
            {
                user = new Users()
                {
                    IsActive = true,
                    Id_Role = 1,
                    DocumentType = 1,
                    DocumentNumber = 1130876428,
                    DateCreateRegistration = System.DateTime.Now,
                    DateModifyRegistration = System.DateTime.Now,
                    Name = "germanavis",
                    Login = "german",
                    Password = "germanPass",
                    Address = "Calle falsa # 123",
                    TelephoneNumber = "3303030",
                    EmailAddress = "german@gmail.com"
                };

                UsersDao.save(user);
            }
            else
            {
                user.EmailAddress = "cambiocorreo@gmail.com";

                UsersDao.update(user);
            }

            foreach (Users uniqueuser in users)
            {
                System.Console.WriteLine(uniqueuser.ToString());
            }

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

            //Test(TypeTest.City);

            #endregion Crear Registro Usuario

        }

        public static void Test(TypeTest type)
        {
            switch (type)
            {
                case TypeTest.Diary:
                    {
                        Diary diary = DiariesDao.find(1);

                        if (diary == null)
                        {
                            diary = new TMA.MODEL.Entity.Diary()
                            {
                                DateDiary = "0",
                                HourDiary = "0",
                                DateCreateRegistration = DateTime.Now.ToLocalTime(),
                                DateModifyRegistration = DateTime.Now.ToLocalTime(),
                                CenterCost = 1

                            };

                            TMA.DAO.EntityManager.DiariesDao.save(diary);
                        }

                        break;
                    }
                case TypeTest.Person:
                    {
                        Person person = PersonsDao.find(2);

                        if (person == null)
                        {
                            person = new TMA.MODEL.Entity.Person()
                            {
                                Id_BiometricReader = 500003,
                                Name = "Agustín",
                                LastName = "Mejía",
                                DateCreateRegistration = DateTime.Now,
                            

                            };

                            TMA.DAO.EntityManager.PersonsDao.save(person);
                        }
                        else {
                            person.DateModifyRegistration = DateTime.Now;
                            TMA.DAO.EntityManager.PersonsDao.update(person);
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

                case TypeTest.User:
                    {
                        Users user = TMA.DAO.EntityManager.UsersDao.find(2);

                        if (user == null)
                        {
                            user = new TMA.MODEL.Entity.Users()
                            {
                                Id_User = 2,
                                IsActive = true,
                                Id_Role = 1,
                                DocumentType = 1,
                                DateCreateRegistration = System.DateTime.Now,
                                DateModifyRegistration = System.DateTime.Now,
                                Name = "Agus",
                                Login = "agus"
                            };

                            TMA.DAO.EntityManager.UsersDao.save(user);
                        }
                        break;
                    }
                case TypeTest.Profile: {

                    Profile profile = ProfilesDao.find(8);

                    if (profile == null)
                    {
                        profile = new TMA.MODEL.Entity.Profile() { Id_Profile = 4, Description = "Administrador", DateCreateRegistration = DateTime.Now, Id_User = 1, DateModifyRegistration = DateTime.Now, Id_UserModifyRegistration = 1 };
                        TMA.DAO.EntityManager.ProfilesDao.save(profile);
                    }

                    break;
                }

                case TypeTest.Headquarter:
                    {
                        Headquarter head = HeadquartersDao.find(1);
                        
                        if (head == null)
                        {
                            head = new TMA.MODEL.Entity.Headquarter() { Id_Headquarter = 3, Description = "Este" };
                            TMA.DAO.EntityManager.HeadquartersDao.save(head);
                        }

                        break;
                    }
                
                case TypeTest.Department:
                    {
                        Department department = DepartmentsDao.find(1);

                        if (department == null)
                        {
                            department = new TMA.MODEL.Entity.Department() { Name = "Valle" };
                            TMA.DAO.EntityManager.DepartmentsDao.save(department);
                        }

                        break;
                    }

                case TypeTest.City:
                    {
                        City city = CitiesDao.find(1);

                        if (city == null)
                        {
                            city = new TMA.MODEL.Entity.City() {  Name = "Cali", Id_Department = 1 };
                            TMA.DAO.EntityManager.CitiesDao.save(city);
                        }

                        break;
                    }


            }
        }
    }
}
