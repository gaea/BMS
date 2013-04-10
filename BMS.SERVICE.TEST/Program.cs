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
            List<Person> persons = PersonsDao.findBy("Id_BiometricReader", "500007");

            if (persons != null)
            {
                Person person = persons.First<Person>();
                Console.WriteLine(person.DocumentNumber);

                List<Diary> diaries = DiariesDao.findDateBy("Id_Person", person.DocumentNumber);

                foreach (Diary diary in diaries)
                    Console.WriteLine(diary.ToString());
            }

        }
    }
}
