using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Topshelf;
using BMS.CONFIGURATION;
using zkemkeeper;
using log4net;

namespace BMS.SERVICE.ENTRY
{
    public class BiometricService
    {
        readonly static ILog _log = LogManager.GetLogger(typeof(BiometricService));

        public static void Main(string[] args)
        {
            new BiometricService().loadService();
        }

        public void loadService()
        {
            _log.Debug("Iniciando la carga y configuración del servicio");

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

            _log.Debug("Carga satisfactoria de los parámetros del servicio");
        }
    }

}
