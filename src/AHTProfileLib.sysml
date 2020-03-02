/** This is the very start of a library for Arrowhead Framework
 * I will be experimenting
 */

package AHTProfileLib {
	/** Services and (later) functionalities */
	import Base::*;
	import ScalarValues::*;
	
	port def ServDef{
		serviceDefinition:String;
		serviceDescription:String;
		communicationProtocol:String;
		semanticProfile:String;

		/* operation service1  
		 * operations do not seem to be included yet*/
	}
	
	/** Systems */
	
	block SysDef {
		port services: ServDef[1..*];
		systemName: String;
		systemDescription:String;
	}
	
	block SysRealization :> SysDef{
		ServiceRealization:Performance[1..*]; //means behaviors
	}
	
	/** System of Systems */
	
	block ArrowheadSoS {
		part systems:SysDef[1..*];
	}
	
	
	block LocalCloud :> ArrowheadSoS {
		part SysInstances:SysRealization [1..*] subsets systems;
	}	

}
