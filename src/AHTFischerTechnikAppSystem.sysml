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
		unit:String;	
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
	
	block LightSensor :> Sensor {
		systemDescription = "uri to description of Light sensor";

		sensorType = "Light beam sensor";
		unit = "Boolean";
	}
	
	block PressureSensor :> Sensor {
		systemDescription = "uri to description of Pressure sensor";

		sensorType = "Pressure sensor";
		unit = "Boolean";
	}
	
 	block FischerTechnikParts :> ArrowheadCoreSoS {
 		// Declare all sensors and actuators
 		part cloudUploader:CloudUploader subsets systems;
 		part dataStorage:DataStorage subsets systems;
 		part lightSensor1:LightSensor subsets systems {
			location = "Start of first conveyor";
 		}
 		part lightSensor2:LightSensor subsets systems {
			location = "End of last conveyor";
 		}
 		part pressureSensor1:PressureSensor subsets systems {
			location = "Start of first conveyor";
 		}
 		
 		// Then we need to connect the application systems to the core systems.
 		// This should be done for all systems in all variants
 		connect lightSensor1::serviceDiscovery to service_registry::serviceDiscovery;
 		connect lightSensor2::serviceDiscovery to service_registry::serviceDiscovery;
 		connect pressureSensor1::serviceDiscovery to service_registry::serviceDiscovery;
 		connect dataStorage::serviceDiscovery to service_registry::serviceDiscovery;
 		connect cloudUploader::orchestrationService to orchestration::orchestrationService;
 		
	}
	
}
