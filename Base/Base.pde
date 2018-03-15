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
  //NEU!!!!!!!!!!!!!!!!!!!!!!
  background(50);
  
 //show UI
 mainUI.show(player1.coins);
 
 //show Player
 player1.show();
}

//key registering methods
void keyPressed(){
  //NEU!!!!!!!!!!!!!!!!!!!
  //Spieler bewegen
  //Ich habe neue Variable breite eingeführt, für die bewegung mit der Tastatur
  //Vielleicht sollte man dies als methode in das Objekt player übernehmen und diese Mathode hier aufrufen
  if(keyCode==UP){
    player1.pos.y--;
  }
  if(keyCode==DOWN){
    player1.pos.y++;
  }
  if(keyCode==LEFT){
    player1.pos.x--;
  }
  if(keyCode==RIGHT){
    player1.pos.x++;
  }
  
}

void mousePressed(){
  //NEU!!!!!!!!!!!!!!!!!!
  player1.dest(new PVector(mouseX,mouseY));
}