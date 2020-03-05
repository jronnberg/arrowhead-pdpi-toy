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
 		connect cloudUploader::sensorValue to sensor_I1::sensorValue;
 		connect cloudUploader::sensorValue to sensor_I2::sensorValue;
 		connect cloudUploader::sensorValue to sensor_I3::sensorValue;
 		connect cloudUploader::sensorValue to sensor_I4::sensorValue;
 		connect cloudUploader::sensorValue to sensor_I5::sensorValue;
 		connect cloudUploader::sensorValue to sensor_I6::sensorValue;
 		connect cloudUploader::sensorValue to sensor_I7::sensorValue;
 		connect cloudUploader::sensorValue to sensor_I8::sensorValue;
 		connect cloudUploader::sensorValue to sensor_I9::sensorValue;
 	}
 }