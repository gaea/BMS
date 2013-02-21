using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BMS.MODEL;
using BMS.MODEL.Entity;
using BMS.DAO.EntityManager;

namespace BMS.DAO.TEST
{
    public class Program
    {
        static void Main(string[] args)
        {
            //#region Users

            //#region Consulta Usuarios por Id
            //Users userFabian = UsersDao.find(5);
            //#endregion Consulta Usuarios por Id

            //#region Crear Registro Usuario
            //if (userFabian == null)
            //{
            //    userFabian = new Users();
            //    userFabian.Login = "Fabian";
            //    userFabian.Password = "Fabian";
            //    userFabian.Id_Role = 3;
            //    UsersDao.save(userFabian);
            //}

            //Console.WriteLine("Id: " + userFabian.Id_User + " | User: " + userFabian.Login + " | Password: " + userFabian.Password);
            //Console.WriteLine("-----------------------------------------------");
            //#endregion Crear Registro Usuario

            //#region Actualizar Registro Usuario
            //userFabian.Password = "PasswordFabian3";
            //UsersDao.update(userFabian);

            //Console.WriteLine("Id: " + userFabian.Id_User + " | User: " + userFabian.Login + " | Password: " + userFabian.Password);
            //Console.WriteLine("-----------------------------------------------");
            //#endregion Actualizar Registro Usuario

            //#region Buscar todos los Registros Usuario
            //List<Users> users = UsersDao.findAll();

            //foreach (Users user in users)
            //{
            //    Console.WriteLine("Id: " + user.Id_User + " | User: " + user.Login + " | Password: " + user.Password);
            //}
            //#endregion Buscar todos los Registros Usuario

            //#region Eliminar registro Usuario
            //UsersDao.delete(userFabian);
            //#endregion Eliminar registro Usuario
            //#endregion Users

            //#region Roles

            //#region Crear Registro Rol

            //Rol role = null;

            //if (role == null)
            //{
            //    role = new Rol() { Name = "Administrator", Description = "Super User" };

            //    RolesDao.save(role);
            //}

            //Console.WriteLine("-----------------------------------------------");
            //Console.WriteLine(role.ToString());
            //Console.WriteLine("-----------------------------------------------");
            //#endregion Crear Registro Rol

            //#region Consulta Rol por Id
            //Rol otherRole = RolesDao.find(3);
            //#endregion Consulta Rol por Id

            //#region Actualizar Registro del Rol
            //otherRole.Name = "User";
            //otherRole.Description = "User";
            //RolesDao.update(otherRole);

            //Console.WriteLine(role.ToString());
            //Console.WriteLine("-----------------------------------------------");
            //#endregion Actualizar Registro del Rol

            //#region Buscar todos los Registros de los Roles
            //List<Rol> roles = RolesDao.findAll();

            //foreach (Rol rol in roles)
            //{
            //    Console.WriteLine(rol.ToString());
            //}
            //#endregion Buscar todos los Registros de los Roles

            //#region Eliminar registro del Rol
            //RolesDao.delete(otherRole);
            //#endregion Eliminar registro del Rol

            //#endregion Roles

            //#region Modules

            //#region Crear Registro Modulo

            //Module module = null;

            //if (module == null)
            //{
            //    module = new Module() { Name = "Module 1", Description = "Module 1" };

            //    ModulesDao.save(module);
            //}

            //Console.WriteLine("-----------------------------------------------");
            //Console.WriteLine(module.ToString());
            //Console.WriteLine("-----------------------------------------------");
            //#endregion Crear Registro Modulo

            //#region Consulta Modulo por Id
            //Module otherModule = ModulesDao.find(1);
            //#endregion Consulta Modulo por Id

            //#region Actualizar Registro del Modulo
            //otherModule.Name = "Other Module";
            //otherModule.Description = "Other Module";
            //ModulesDao.update(otherModule);

            //Console.WriteLine(otherModule.ToString());
            //Console.WriteLine("-----------------------------------------------");
            //#endregion Actualizar Registro del Modulo

            //#region Buscar todos los Registros de los Modulos
            //List<Module> modules = ModulesDao.findAll();

            //foreach (Module mod in modules)
            //{
            //    Console.WriteLine(mod.ToString());
            //}
            //#endregion Buscar todos los Registros de los Modulos

            //#region Eliminar registro del Modulo
            //ModulesDao.delete(otherModule);
            //#endregion Eliminar registro del Modulo

            //#endregion Modules

            //#region Authorizations - NEED FIX

            //#region Crear Registro Autorización

            //Authorization authorization = null;

            //if (authorization == null)
            //{
            //    authorization = new Authorization() { StartDate = DateTime.Now, EndDate = DateTime.Now, Id_User = 16 };

            //    AuthorizationsDao.save(authorization);
            //}

            //Console.WriteLine("-----------------------------------------------");
            //Console.WriteLine(authorization.ToString());
            //Console.WriteLine("-----------------------------------------------");
            //#endregion Crear Registro Autorización

            //#region Consulta Autorización por Id
            //Authorization otherAuthorization = AuthorizationsDao.find(1);
            //#endregion Consulta Autorización por Id

            //#region Actualizar Registro Autorización
            //otherAuthorization.EndDate = DateTime.Now;
            //AuthorizationsDao.update(otherAuthorization);

            //Console.WriteLine(otherAuthorization.ToString());
            //Console.WriteLine("-----------------------------------------------");
            //#endregion Actualizar Registro Autorización

            //#region Buscar todos los Registros de las Autorizaciones
            //List<Authorization> authorizations = AuthorizationsDao.findAll();

            //foreach (Authorization autho in authorizations)
            //{
            //    Console.WriteLine(autho.ToString());
            //}
            //#endregion Buscar todos los Registros de las Autorizaciones

            //#region Eliminar registro de la Autorización
            //AuthorizationsDao.delete(otherAuthorization);
            //#endregion Eliminar registro de la Autorización

            //#endregion Authorizations

            //#region Modules By Rol - NEED FIX

            //#region Crear Registro Modulo por Rol

            //ModuleByRol moduleByRol = null;

            //if (moduleByRol == null)
            //{
            //    moduleByRol = new ModuleByRol() { Id_Module = 1, Id_Rol = 1, Description = "Module 1" };

            //    ModulesByRolDao.save(moduleByRol);
            //}

            //Console.WriteLine("-----------------------------------------------");
            //Console.WriteLine(moduleByRol.ToString());
            //Console.WriteLine("-----------------------------------------------");
            //#endregion Crear Registro Modulo por Rol

            //#region Consulta Modulo por Rol por Id
            //ModuleByRol otherModuleByRol = ModulesByRolDao.find(1);
            //#endregion Consulta Modulo por Rol por Id

            //#region Actualizar Registro del Modulo
            //otherModuleByRol.Description = "Other Module";
            //ModulesByRolDao.update(otherModuleByRol);

            //Console.WriteLine(otherModuleByRol.ToString());
            //Console.WriteLine("-----------------------------------------------");
            //#endregion Actualizar Registro del Modulo por Rol

            //#region Buscar todos los Registros de los Modulos por Rol
            //List<ModuleByRol> modulesByRol = ModulesByRolDao.findAll();

            //foreach (ModuleByRol modByRol in modulesByRol)
            //{
            //    Console.WriteLine(modByRol.ToString());
            //}
            //#endregion Buscar todos los Registros de los Modulos por Rol

            //#region Eliminar registro del Modulo
            //ModulesByRolDao.delete(otherModuleByRol);
            //#endregion Eliminar registro del Modulo

            //#endregion Modules By Rol

            #region Consulta Usuarios por Id
            TMA.MODEL.Entity.Headquarter head = TMA.DAO.EntityManager.HeadquartersDao.find(1);
            TMA.MODEL.Entity.Users user = TMA.DAO.EntityManager.UsersDao.find(2);
            TMA.MODEL.Entity.Profile profile = TMA.DAO.EntityManager.ProfilesDao.find(8);
            TMA.MODEL.Entity.Visit visit = TMA.DAO.EntityManager.VisitsDao.find(8);
            TMA.MODEL.Entity.Person person = TMA.DAO.EntityManager.PersonsDao.find(1);
            TMA.MODEL.Entity.Diary diary = TMA.DAO.EntityManager.DiarysDao.find(1);
            #endregion Consulta Usuarios por Id

            #region Crear Registro Usuario

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

            if (head == null)
            {
                head = new TMA.MODEL.Entity.Headquarter() { Id_Headquarter = 3, Description = "Este" };
                TMA.DAO.EntityManager.HeadquartersDao.save(head);
            }

            if (profile == null)
            {
                profile = new TMA.MODEL.Entity.Profile() { Id_Profile = 4, Description = "Administrador", DateCreateRegistration = DateTime.Now, Id_User = 1, DateModifyRegistration = DateTime.Now, Id_UserModifyRegistration = 1 };
                TMA.DAO.EntityManager.ProfilesDao.save(profile);
            }
            #endregion Crear Registro Usuario

        }
    }
}
