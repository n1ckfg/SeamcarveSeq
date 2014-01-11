import dynamicprogramming.*;

SeamCarving carver;
PImage img;
ArrayList imgNames;
int counter = 0;
String filePath = "render";
String fileType = "png";
boolean firstRun = true;

void setup() {
  Settings settings = new Settings("settings.txt");
  chooseFolderDialog();
  while(firstRun){
    try{
      if(imgNames.size() > 0) img = loadImage((String) imgNames.get(counter));
    }catch(Exception e){ }
  }
  size(img.width,img.height,P3D);
}

void draw() {
  img = loadImage((String) imgNames.get(counter));
  carver = new SeamCarving(this, img);
  image(carver.getScoreImage(),0,0);
  saveFrame(filePath + "/" + fileName + zeroPadding(counter+1,imgNames.size()) + "." + fileType);
  if(counter<imgNames.size()) counter++;
  if(counter==imgNames.size()) exit();
}


