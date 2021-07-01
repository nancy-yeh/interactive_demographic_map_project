class Neighbourhood {
  float x, y;
  float diameter;
  float dia;
  float asianper;
  float aper;
  float whiteper;
  float wper;
  float blackper;
  float bper;
  String label;
  String text;

  // setting up boolean to determine wether the mouse is hovering over the neighbourhood bubble
  boolean over = false;

  // Creating  the Bubble
  Neighbourhood(float x_, float y_, float diameter_, String s, String t, float aper, float wper, float bper) {
    x = x_;
    y = y_;
    diameter = diameter_;
    label = s;
    text = t;
    asianper = aper;  //asian percentage
    whiteper = wper;  //white percentage
    blackper = bper;  //black percentage
  }

  //Checking if mouse is hovering over the bubble
  //if hovering the bubble the referenced groups show up else no group shows up
  void rollover(float px, float py) {
    float d = dist(px, py, x, y);
    if (d < diameter/10) {
      over = true;
    } else {
      over = false;
    }
  }

  // Display the neighbourhood bubble on map
  void display() {
    //display bubble for neighbourhood total population
    stroke(242, 132, 209, 150);
    fill(255, 255, 255, 150);
    dia = map(diameter, 340, 405, 20, 100);
    ellipse(x, y, dia, dia);
    fill(255, 3, 100);
    
    //display neighbourhood labels
    textAlign(CENTER);
    textSize(13);
    text(label, x, y);

  //if over is true (if hovering over the neighbourhood bubble) show groups
    if (over) {
      fill(0);
      textSize(12);
      text(text, 850, 650);
      
      //asian percentage
      aper = asianper;
      fill(20, 60, 693, 150);
      noStroke();
      ellipse(x + 35, y + 50, aper, aper);
      fill(0);
      textSize(10);
      text(int(asianper)+ "%", x + 35, y + 50);
      
      //white percentage
      wper = whiteper;
      fill(156, 89, 245, 200);
      noStroke();
      ellipse(x + 80, y, wper, wper);
      fill(0);
      text(int(whiteper)+ "%", x + 80, y - 5);
      
      //black percentage
      bper = blackper;
      fill(255, 159, 3, 200);
      noStroke();
      ellipse(x + 60, y - 50, bper, bper);
      fill(0);
      text(int(blackper)+ "%", x + 60, y - 50);
      
      //neighbourhood bubble
      fill(255, 3, 100, 50);
      ellipse(x, y, dia, dia);
    }
  }
}
