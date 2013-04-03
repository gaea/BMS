using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Topshelf;
using BMS.CONFIGURATION;

namespace BMS.SERVICE
{
    public class Class1
    {
        public static void Main(string[] args)
        {
            loadService();
        }

        public static void loadService()
        {

            HostFactory.Run(hostConfigurator =>
            {
                hostConfigurator.Service<TopShelfImplementation>(serviceConfigurator =>
                {
                    serviceConfigurator.ConstructUsing(serviceType => new TopShelfImplementation());
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

    public class TopShelfImplementation {
        public TopShelfImplementation(){}

        public void Start() { }

        public void Stop() { }
    }
}
