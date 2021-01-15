//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 300;     
int count = 0;
boolean check = false;
float[] primeWeight;
//CarSystem: Indholder en population af "controllere" 
CarSystem carSystem       = new CarSystem(populationSize);

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn 
PImage    trackImage;

void setup() {
  size(500, 600);
  trackImage = loadImage("track.png");
}

void draw() {
  clear();
  fill(255);
  rect(0,50,1000,1000);
  image(trackImage,0,80);  

  carSystem.updateAndDisplay();
  text(count,width/2,height/2);
 // println(populationSize);
   // println("Michael-is-a-big-oldstinker");
  //TESTKODE: Frastortering af dårlige biler, for hver gang der går 200 frame - f.eks. dem der kører uden for banen
  if (frameCount%50==0) {
      //println("FJERN DEM DER KØRER UDENFOR BANEN frameCount: " + frameCount);
      for (int i = carSystem.CarControllerList.size()-1 ; i >= 0;  i--) {
        SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
        if(s.whiteSensorFrameCount > 0){
carSystem.CarControllerList.get(i).reset();
          
   
         }
      }
    }
              if(check){
                for (int i = carSystem.CarControllerList.size()-1 ; i >= 0;  i--){
                if(carSystem.CarControllerList.get(i).sensorSystem.clockWiseRotationFrameCounter< 100){
                  
                carSystem.CarControllerList.get(i).reset();
                for(int i2 =0;i2<8;i2++)
    carSystem.CarControllerList.get(i).hjerne.weights[i2]= primeWeight[i2];
 println("Mathias Lugter");    
                }}
                primeWeight = null;
    check = false;
   }
   
    
    if (frameCount%300==0) {
      for (int i = carSystem.CarControllerList.size()-1 ; i >= 0;  i--) {
         if(carSystem.CarControllerList.get(i).sensorSystem.clockWiseRotationFrameCounter< 100){
    carSystem.CarControllerList.get(i).change();
         }
    }}
    //


}
void mousePressed(){
println("Mathias Lugter"); //<>//
}
