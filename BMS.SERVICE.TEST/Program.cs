using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TMA.MODEL.Entity;
using TMA.DAO.EntityManager;

namespace BMS.SERVICE.TEST
{
    class Program
    {
        static void Main(string[] args)
        {
            Process();
        }

        static void Process()
        {
            Person person = PersonsDao.findBy("Id_BiometricReader", "10").First<Person>();

            Console.WriteLine(person);

            List<Diary> diaries = DiariesDao.findPersonBy("Id_Person", person.Id_Person.ToString());

            foreach (Diary diary in diaries)
                Console.WriteLine(diary.ToString());

        }
    }
}
