using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Topshelf;
using BMS.CONFIGURATION;
using zkemkeeper;
using TMA.MODEL.Entity;
using TMA.DAO.EntityManager;

namespace BMS.SERVICE
{
    public class BiometricService
    {
        public static void Main(string[] args)
        {
            new BiometricService().loadService();
        }

        public void loadService()
        {

            HostFactory.Run(hostConfigurator =>
            {
                hostConfigurator.Service<BiometricController>(serviceConfigurator =>
                {
                    serviceConfigurator.ConstructUsing(serviceType => new BiometricController());
                    serviceConfigurator.WhenStarted(service => service.Start());
                    serviceConfigurator.WhenStopped(service => service.Stop());
                });

                hostConfigurator.RunAsLocalSystem();

                hostConfigurator.SetDescription(ConfigManager.ServiceDescription);
                hostConfigurator.SetDisplayName(ConfigManager.ServiceDisplayName);
                hostConfigurator.SetServiceName(ConfigManager.ServiceName);
                hostConfigurator.StartAutomatically();
            });
        }
    }

    public class BiometricController {

        string PATH = @"c:\log.txt";

        public BiometricController(){}

        private CZKEMClass controller;

        public void Start() {

            if (controller == null)
            {
                controller = new CZKEMClass();
            }
            // Realiza la conexión con el dispositivo
            System.IO.File.WriteAllText(PATH, (string.Format("Conectado: {0}", controller.Connect_Net(ConfigManager.ServiceBiometricIPDevice, int.Parse(ConfigManager.ServiceBiometricPortDevice)))));

            // Activa la recepción de los eventos del dispositivo biométrico
            controller.OnAttTransactionEx += new _IZKEMEvents_OnAttTransactionExEventHandler(controller_OnAttTransactionEx);
        }

        void controller_OnAttTransactionEx(string EnrollNumber, int IsInValid, int AttState, int VerifyMethod, int Year, int Month, int Day, int Hour, int Minute, int Second, int WorkCode)
        {
            try
            {
                Person person = PersonsDao.findBy("Id_BiometricReader", EnrollNumber).First<Person>();

                List<Diary> diaries = DiariesDao.findPersonBy("Id_Person", person.Id_Person.ToString());

                System.IO.File.WriteAllText(PATH, person.ToString());

                foreach (Diary diary in diaries)
                    System.IO.File.WriteAllText(PATH, diary.ToString());

                while (false)
                {
                    // Envía la solicitud para desbloquear la puerta
                    controller.ACUnlock(0, 0);
                }
            }
            catch { }

        }

        public void Stop() {

            if (controller != null)
            {
                controller.Disconnect();
            }
        }
    }
}
