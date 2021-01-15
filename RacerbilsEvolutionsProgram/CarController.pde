class CarController {
  //Forbinder - Sensorer & Hjerne & Bil
  float varians             = 5; //hvor stor er variansen på de tilfældige vægte og bias
  Car bil                    = new Car();
  NeuralNetwork hjerne       = new NeuralNetwork(varians); 
  SensorSystem  sensorSystem = new SensorSystem();
      
  void update() {
    //1.)opdtarer bil 
    bil.update();
    //2.)opdaterer sensorer    
    sensorSystem.updateSensorsignals(bil.pos, bil.vel);
    //3.)hjernen beregner hvor meget der skal drejes
    float turnAngle = 0;
    float x1 = (float)int(sensorSystem.leftSensorSignal);
    float x2 = (float)int(sensorSystem.frontSensorSignal);
    float x3 = (float)int(sensorSystem.rightSensorSignal);    
    turnAngle = hjerne.getOutput(x1, x2, x3);    
    //4.)bilen drejes
    bil.turnCar(turnAngle);
  }
  
  void display(){
    bil.displayCar();
    sensorSystem.displaySensors();
    if(sensorSystem.checker ==true){
      println(hjerne.weights);
    primeWeight= hjerne.weights;
      check = true;
      count ++;
    //  println(sensorSystem.clockWiseRotationFrameCounter);
    sensorSystem.checker = false;
    }
  }
  
    void reset(){
  bil.pos.set(60, 232);
  bil.vel.set(0,5);
  sensorSystem.reset();
  //println(sensorSystem.whiteSensorFrameCount);
  change();
  }
  void change(){
  hjerne.weights[(int)random(0,8)] += random(-1,1);
  }
  
  
}
