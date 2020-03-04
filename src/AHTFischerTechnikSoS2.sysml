/**
 * This is variant 2 of the Fische Tecknik plant
 * that uses a pressure sensor to detect a new job 
 * at the start of the first conveyor 
 */
 package AHTFischerTechnikSoS2 {
 	import AHTProfileLib::*;
	import AHTCoreLib::*;
	import ScalarValues::*;
	import AHTFischerTechnikAppSystem::*;
 	
 	block FischerTechnikSoS2 :> FischerTechnikParts {
  		// Connect all the systems according to plan
 		connect cloudUploader::sensorValue to pressureSensor1::sensorValue;
 		connect cloudUploader::sensorValue to lightSensor2::sensorValue;
 		connect cloudUploader::sensorValueStorage to dataStorage::sensorValueStorage;
 	}
 }