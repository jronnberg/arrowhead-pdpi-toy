/** This is a toy mockup of the Fischer Technik plant for Arrowhead Framework */
package AHTFischerTechnikAppSystem {
	// The use-case is for Productive4.0 and Arrowhead Tools
	// This is focusing on storing sensor values in a cloud
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
	
	block LightSensor1 :> LightSensor {
		location = "Start of first conveyor";
	}

	block LightSensor2 :> LightSensor {
		location = "End of last conveyor";
	}

	block PressureSensor1 :> PressureSensor {
		location = "Start of first conveyor";
	}


}
