using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BMS.MODEL;
using BMS.MODEL.Entity;

namespace BMS.DAO.TEST
{
    class Program
    {
        static void Main(string[] args)
        {
            #region Consulta por Id
            Users userFabian = UsersDao.find(3);
            #endregion Consulta por Id

            #region Crear Registro
            if (userFabian == null)
            {
                userFabian = new Users();
                userFabian.Login = "Fabian";
                userFabian.Password = "Fabian";

                UsersDao.save(userFabian);
            }

            Console.WriteLine("Id: " + userFabian.Id_User + " | User: " + userFabian.Login + " | Password: " + userFabian.Password);
            Console.WriteLine("-----------------------------------------------");
            #endregion Crear Registro

            #region Actualizar Registro
            userFabian.Password = "PasswordFabian3";
            UsersDao.update(userFabian);

            Console.WriteLine("Id: " + userFabian.Id_User + " | User: " + userFabian.Login + " | Password: " + userFabian.Password);
            Console.WriteLine("-----------------------------------------------");
            #endregion Actualizar Registro

            #region Buscar todos los Registros
            List<Users> users = UsersDao.findAll();

            foreach (Users user in users) 
            {
                Console.WriteLine("Id: " + user.Id_User + " | User: " + user.Login + " | Password: " + user.Password);
            }
            #endregion Buscar todos los Registros

            #region Eliminar registro
            UsersDao.delete(userFabian);
            #endregion Eliminar registro
        }
    }
}
