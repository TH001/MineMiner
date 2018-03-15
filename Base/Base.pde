//import statements


//variables
public UI mainUI = new UI();

public Player player1;

private PVector newDir = new PVector();

//--------------------------------------------------------------------------------------------------
//main class body
void setup() {
  size(1000, 600);
  colorMode(RGB);
  ellipseMode(CENTER);

  //setting up player character
  player1 = new Player(50, 100);
}


//--------------------------------------------------------------------------------------------------
// draw method, gets called every frame
void draw() {
  background(50);

  //show UI
  mainUI.show(player1.coins);

  //show Player
  player1.move(newDir);
  player1.show();
}

//--------------------------------------------------------------------------------------------------
//key registering methods
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

  player1.dest(new PVector(mouseX,mouseY));
}