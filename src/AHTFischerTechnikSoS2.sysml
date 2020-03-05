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
 		part sensor_I5_2:PushButton subsets systems {
			location = "slider 1";
 		}

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

 		connect cloudUploader::sensorValue to sensor_I5_2::sensorValue;
 	}
 }