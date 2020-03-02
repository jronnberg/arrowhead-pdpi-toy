/**
 * This is the generic version of the Norway System of System at Unger
 */
 package AHTFischerTechnikSoS2 {
 	import AHTProfileLib::*;
	import AHTCoreLib::*;
	import ScalarValues::*;
	import AHTFischerTechnikAppSystem::*;
 	
 	block FischerTechnikSoS2 :> ArrowheadCoreSoS {
 		part cloudUploader:CloudUploader subsets systems;
 		part dataStorage:DataStorage subsets systems;
 		part sensor1:PressureSensor1 subsets systems;
 		part sensor2:LightSensor2 subsets systems;
 		
 		connect cloudUploader::sensorValue to sensor1::sensorValue;
 		connect cloudUploader::sensorValue to sensor2::sensorValue;
 		connect cloudUploader::sensorValueStorage to dataStorage::sensorValueStorage;
 		
 		// Then we need to connect the application systems to the mandatory systems
 		connect sensor1::serviceDiscovery to service_registry::serviceDiscovery;
 		connect sensor2::serviceDiscovery to service_registry::serviceDiscovery;
 		connect dataStorage::serviceDiscovery to service_registry::serviceDiscovery;
 		connect cloudUploader::orchestrationService to orchestration::orchestrationService;
 		
 		// Same procedure for the other mandatory services
 	}
 }