//import statements


//variables
public UI mainUI = new UI();

public Player player1;


//main class body
void setup(){
  size(1000, 600);
  colorMode(RGB);
  ellipseMode(CENTER);
  background(50); //50 100 255
  
  //setting up player character
  player1 = new Player(50, 100);
}


// draw method
void draw(){
 //show UI
 mainUI.show();
 
 //show Player
 player1.show();
}

//key registering methods
void keyPressed(){
  
}

void mousePressed(){
  
}