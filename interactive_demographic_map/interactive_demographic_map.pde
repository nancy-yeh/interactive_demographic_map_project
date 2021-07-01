//Nancy Yeh
//Queenie (Yi Xiu) Lu
//Interactive Demographic map

Neighbourhood[] neighbourhoods;
PImage toronto;
PImage outline;
XML xml;

void setup() {
  size(1280, 721);
  //load data and image
  toronto = loadImage("Toronto-Map.jpg");
  outline = loadImage("toronto-city-outline.jpg");
  loadData();
}

void draw() {
  background(255);
  image(toronto, -150, -80, 1584, 852);
  
  //draw neighbourhood and group bubbles
  for (int i=0; i<neighbourhoods.length; i++) {
    neighbourhoods[i].display();
    neighbourhoods[i].rollover(mouseX, mouseY);
  }

  textAlign(LEFT);
  fill(0);
  text("Hover mouse over region to see groups.", 10, height-10);
  
  //legend
  text("LEGEND", width-160, height-155);
  text("Total Population", width-130, height-125);
  text("Asain Population %", width-130, height-95);
  text("White Population %", width-130, height-65);
  text("Black Population %", width-130, height-35);
  drawLegend();
  image(outline, 1020, 430, width/5, height/5);
}

void drawLegend() {
  noStroke();
  fill(20, 60, 693, 200);
  ellipse(width-150, height-100, 20, 20);
  fill(156, 89, 245, 200);
  ellipse(width-150, height-70, 20, 20);
  fill(255, 159, 3, 200);
  ellipse(width-150, height-40, 20, 20);
  stroke(0);
  fill(255);
  ellipse(width-150, height-130, 20, 20);
}

void loadData() {
  xml = loadXML("Toronto.xml");
  XML[] children= xml.getChildren("group");
  neighbourhoods = new Neighbourhood[children.length];

  for (int i= 0; i< neighbourhoods.length; i++) {

    XML positionElement = children[i].getChild("position");
    float x = positionElement.getInt("x");
    float y = positionElement.getInt("y");
    
    XML diameterElement = children[i].getChild("diameter");
    float diameter = diameterElement.getFloatContent();

    XML asianperElement = children[i].getChild("asianper");
    float asianper = asianperElement.getFloatContent();

    XML whiteperElement = children[i].getChild("whiteper");
    float whiteper = whiteperElement.getFloatContent();

    XML blackperElement = children[i].getChild("blackper");
    float blackper = blackperElement.getFloatContent();

    XML groupElement = children[i].getChild("label");
    String label = groupElement.getContent();

    XML textElement = children[i].getChild("text");
    String text = textElement.getContent();

    neighbourhoods[i] = new Neighbourhood(x, y, diameter, label, text, asianper, whiteper, blackper);
  }
}
