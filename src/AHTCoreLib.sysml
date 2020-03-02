/** Mandatory Services and Systems */
package AHTCoreLib {
	import AHTProfileLib::*;
	import ScalarValues::*;
	
	block ServiceRegistry :> SysDef {
		systemName = "Service Registry";
		systemDescription = "https://github.com/arrowhead-f/core-java-spring#serviceregistry";

		port serviceDiscovery:ServiceDiscovery subsets services;
	}
	
	port def ServiceDiscovery :> ServDef {
		serviceDefinition = "Service Discovery";
		serviceDescription = "https://github.com/arrowhead-f/core-java-spring#endpoints";
		communicationProtocol = "HTTP/TCP/IP";
		semanticProfile = "json";
			
	}
	
	block Authorization :> SysDef {
		systemName = "Authorization";
		systemDescription = "https://github.com/arrowhead-f/core-java-spring#authorization";

		port serviceDiscovery:~ServiceDiscovery subsets services;
		port tokenGeneration:TokenGeneration subsets services;
		port authorizationControl:AuthorizationControl subsets services;
	}
	
	port def TokenGeneration :> ServDef {
		serviceDefinition = "Token Generation";
		serviceDescription = "https://github.com/arrowhead-f/core-java-spring#services-and-use-cases-1";
		communicationProtocol = "HTTP/TCP/IP";
		semanticProfile = "json";
	}
	port def AuthorizationControl :> ServDef {
		serviceDefinition = "Authorization Control";
		serviceDescription = "https://github.com/arrowhead-f/core-java-spring#services-and-use-cases-1";
		communicationProtocol = "HTTP/TCP/IP";
		semanticProfile = "json";		
	}
	
	
	block Orchestration :> SysDef {
		systemName = "Orchestraztion";
		systemDescription = "https://github.com/arrowhead-f/core-java-spring#orchestrator";

		port serviceDiscovery:~ServiceDiscovery subsets services;
		port tokenGeneration:~TokenGeneration subsets services;
		port authorizationControl:~AuthorizationControl subsets services;
		port orchestrationService:OrchestrationService subsets services;
		port orchestrationStoreManagement:OrchestrationStoreManagement subsets services;
		port orchestrationPush:~OrchestrationPush subsets services;
		port orchestrationCapabiliteis:~OrchestrationCapabiliteis subsets services;		
	}
	
	port def OrchestrationService :> ServDef {
		serviceDefinition = "OrchestrationService";
		serviceDescription = "https://github.com/arrowhead-f/core-java-spring#orchestrator";
		communicationProtocol = "HTTP/TCP/IP";
		semanticProfile = "json";		
	}
	port def OrchestrationStoreManagement :> ServDef {
		serviceDefinition = "OrchestrationStoreManagement";
		serviceDescription = "https://github.com/arrowhead-f/core-java-spring#orchestrator";
		communicationProtocol = "HTTP/TCP/IP";
		semanticProfile = "json";		
	}
	port def OrchestrationPush :> ServDef {
		serviceDefinition = "OrchestrationPush";
		serviceDescription = "https://github.com/arrowhead-f/core-java-spring#orchestrator";
		communicationProtocol = "HTTP/TCP/IP";
		semanticProfile = "json";
	}
	port def OrchestrationCapabiliteis :> ServDef {
		serviceDefinition = "OrchestrationCapabiliteis";
		serviceDescription = "https://github.com/arrowhead-f/core-java-spring#orchestrator";
		communicationProtocol = "HTTP/TCP/IP";
		semanticProfile = "json";				
	}

	block ArrowheadCoreSoS :> ArrowheadSoS {
		part service_registry:ServiceRegistry subsets systems;
		part authorization:Authorization subsets systems;
		part orchestration:Orchestration subsets systems;
		
 		connect authorization::serviceDiscovery to service_registry::serviceDiscovery;
 		connect orchestration::serviceDiscovery to service_registry::serviceDiscovery;
 		connect orchestration::tokenGeneration to authorization::tokenGeneration;
 		connect orchestration::authorizationControl to authorization::authorizationControl;
		
	}
}