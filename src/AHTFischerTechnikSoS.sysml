/**
 * This is the Fische Tecknik plant
 */
 package AHTFischerTechnikSoS {
 	import AHTProfileLib::*;
	import AHTCoreLib::*;
	import ScalarValues::*;
	import AHTFischerTechnikAppSystem::*;
 	
 	block FischerTechnikSoS :> FischerTechnikParts {
 		// Connect all the systems according to plan
 		connect cloudUploader::sensorValue to lightSensor1::sensorValue;
 		connect cloudUploader::sensorValue to lightSensor2::sensorValue;
 		connect cloudUploader::sensorValueStorage to dataStorage::sensorValueStorage;
 	}
 }