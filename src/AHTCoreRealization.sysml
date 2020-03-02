/** The realization setup of the Core systems */
package AHTCoreRealization{
	import AHTProfileLib::*;
	import AHTCoreLib::*;
	import ScalarValues::*;
	
	block ServiceRegistryRealization :> ServiceRegistry, SysRealization{
		// We see multiple inheritance here which comes in handy
		
		myServiceRegistration redefines ServiceRealization; 
	}
}