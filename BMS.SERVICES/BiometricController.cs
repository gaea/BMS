using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zkemkeeper;
using log4net;
using System.Reflection;
using BMS.BL;
using BMS.CONFIGURATION;

namespace BMS.SERVICE.ENTRY
{
    public class BiometricController
    {
        readonly ILog _log = LogManager.GetLogger(typeof(BiometricService));

        public BiometricController() { }

        private CZKEMClass controller;

        public void Start()
        {
            _log.Debug("Iniciando el servicio");

            if (controller == null)
            {
                controller = new CZKEMClass();

                controller.Connect_Net(ConfigManager.ServiceBiometricIPDevice, int.Parse(ConfigManager.ServiceBiometricPortDevice));
            }

            // Activa la recepción de los eventos del dispositivo biométrico
            controller.OnAttTransactionEx += new _IZKEMEvents_OnAttTransactionExEventHandler(controller_OnAttTransactionEx);

            _log.Debug("El servicio inició de manera satisfactoria");
        }

        void controller_OnAttTransactionEx(string EnrollNumber, int IsInValid, int AttState, int VerifyMethod, int Year, int Month, int Day, int Hour, int Minute, int Second, int WorkCode)
        {
            try
            {
                _log.Debug(string.Format("Iniciando validación para el usuario con ID: {0}", EnrollNumber));

                BiometricProcess business = new BiometricProcess();

                List<string> message = new List<string>();

                bool entry = business.CanEntryFunctionary(EnrollNumber, out message);

                _log.Debug(string.Format("¿Puede ingressar el usuario: {0}?", entry ? "Si" : "No"));

                // Envía la solicitud para desbloquear la puerta
                if (entry)
                {
                    controller.ACUnlock(0, 0);

                    _log.Debug(string.Format("Realizando la apertura de la puerta para el usuario: {0}", EnrollNumber));
                }
            }
            catch (Exception exc)
            {
                throw exc;
            }

        }

        public void Stop()
        {
            _log.Debug("Se inicia la detención del servicio");

            if (controller != null)
            {
                controller.Disconnect();
            }
            _log.Debug("El servicio {0} ha sido detenido de manera satisfactoria");
        }
    }
}
