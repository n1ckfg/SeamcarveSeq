import dynamicprogramming.*;

SeamCarving carver;
PImage img;
ArrayList photoArrayNames;
int counter = 0;
String fileName = "frame";
String filePath = "render";
String fileType = "png";

void setup() {
  countFrames();
  img = loadImage((String) photoArrayNames.get(counter));
  size(img.width,img.height);
      
}

void draw() {
  img = loadImage((String) photoArrayNames.get(counter));
  carver = new SeamCarving(this, img);
  image(carver.getScoreImage(),0,0);
  saveFrame(filePath + "/" + fileName + zeroPadding(counter+1,photoArrayNames.size()) + "." + fileType);
  if(counter<photoArrayNames.size()) counter++;
  if(counter==photoArrayNames.size()) exit();
}

void countFrames() {
  photoArrayNames = new ArrayList();
    try {
        //loads a sequence of frames from a folder
        File dataFolder = new File(sketchPath, "data/"); 
        String[] allFiles = dataFolder.list();
        for (int j=0;j<allFiles.length;j++) {
          if (allFiles[j].toLowerCase().endsWith("png")||allFiles[j].toLowerCase().endsWith("jpg")||allFiles[j].toLowerCase().endsWith("jpeg")||allFiles[j].toLowerCase().endsWith("gif")||allFiles[j].toLowerCase().endsWith("tga")) {
            photoArrayNames.add(allFiles[j]);
          }
        }
    }catch(Exception e){ }
  }

String zeroPadding(int _val, int _maxVal){
  String q = ""+_maxVal;
  return nf(_val,q.length());
}
