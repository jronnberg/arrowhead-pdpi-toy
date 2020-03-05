/**
 * This is the generic version of a toy muckup of the Fische Tecknik plant
 */
package AHTFischerTechnikAppSystem {
	import AHTProfileLib::*;
	import AHTCoreLib::*;
	import ScalarValues::*;
	
	port def SensorValue :> ServDef {
		serviceDefinition = "SensorValueService";
		serviceDescription = "";
		communicationProtocol = "HTTP/TCP/IP";
		semanticProfile = "senml+json";
	}

	port def SensorValueStorage :> ServDef {
		serviceDefinition = "SensorValueStorageService";
		serviceDescription = "";
		communicationProtocol = "HTTP/TCP/IP";
		semanticProfile = "senml+json";
	}
	
	block Sensor :> SysDef {
		port serviceDiscovery:~ServiceDiscovery subsets services; // communicating with ServiceRegistry
		port sensorValue:SensorValue subsets services; // producing the SensorValueService

		sensorType:String;
		location:String;
	}
	
	block DataStorage :> SysDef {
		port serviceDiscovery:~ServiceDiscovery subsets services; // communicating with ServiceRegistry
		port sensorValueStorage:SensorValueStorage subsets services; // producing the SensorValueStorageService		
	}	
		
	block CloudUploader :> SysDef {
		port orchestrationService:~OrchestrationService subsets services; // communicating with Orchestration
		port sensorValueStorage:~SensorValueStorage subsets services; // consuming the SensorValueStorageService		
		port sensorValue:~SensorValue subsets services; // consuming the SensorValueService
	}
	
	block Phototransistor :> Sensor {
		sensorType = "Phototransistor";
	}
	
	block PushButton :> Sensor {
		sensorType = "Push-button";
	}
	
 	block FischerTechnikParts :> ArrowheadCoreSoS {
 		// Declare all sensors and actuators
 		part cloudUploader:CloudUploader subsets systems;
 		part dataStorage:DataStorage subsets systems;
 		part sensor_I1:PushButton subsets systems {
			location = "slider 1 front";
 		}
 		part sensor_I2:PushButton subsets systems {
			location = "slider 1 rear";
 		}
 		part sensor_I3:PushButton subsets systems {
			location = "slider 2 front";
 		}
 		part sensor_I4:PushButton subsets systems {
			location = "slider 2 rear";
 		}
 		part sensor_I5:Phototransistor subsets systems {
			location = "slider 1";
 		}
 		part sensor_I6:Phototransistor subsets systems {
			location = "milling machine";
 		}
 		part sensor_I7:Phototransistor subsets systems {
			location = "loading station";
 		}
 		part sensor_I8:Phototransistor subsets systems {
			location = "drilling machine";
 		}
 		part sensor_I9:Phototransistor subsets systems {
			location = "conveyor belt swap";
 		}
 		
 		// Then we need to connect the application systems to the core systems.
 		// This should be done for all systems in all variants
 		connect dataStorage::serviceDiscovery to service_registry::serviceDiscovery;

 		connect cloudUploader::orchestrationService to orchestration::orchestrationService;

 		connect sensor_I1::serviceDiscovery to service_registry::serviceDiscovery;
 		connect sensor_I2::serviceDiscovery to service_registry::serviceDiscovery;
 		connect sensor_I3::serviceDiscovery to service_registry::serviceDiscovery;
 		connect sensor_I4::serviceDiscovery to service_registry::serviceDiscovery;
 		connect sensor_I5::serviceDiscovery to service_registry::serviceDiscovery;
 		connect sensor_I6::serviceDiscovery to service_registry::serviceDiscovery;
 		connect sensor_I7::serviceDiscovery to service_registry::serviceDiscovery;
 		connect sensor_I8::serviceDiscovery to service_registry::serviceDiscovery;
 		connect sensor_I9::serviceDiscovery to service_registry::serviceDiscovery;

 		connect cloudUploader::sensorValueStorage to dataStorage::sensorValueStorage;
	}
	
}
