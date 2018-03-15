class Player {

  //NEU!!!!!!!!!!!!!!!!!!!!
  //Geschwindigkeit, gedacht für die flüssige Bewegung mit der Maus, man klickt und der Spieleer bewegt sich mit einer Geschwindigkeit v zu diesem geklickten Punkt
  //private PVector v= new PVector(0,0);

  //variables for movement
  private PVector dir = new PVector(0, 0);
  private PVector pos = new PVector(0, 50);

  private Inventory inv;

  private int coins;

  private float r;
  private float speed = 10;

  //---------------------------------------------------------------------------
  //constructor  
  Player(float r_, int coins_) {

    inv = new Inventory();

    coins = coins_;
    r = r_;
  }

  //---------------------------------------------------------------------------
  //main method body
  void move(PVector arg) { //updating the players movement direction
    dir = arg;
    
    dir.setMag(speed);
    pos.add(dir);
  }
  

  //---------------------------------------------------------------------------
  //shows player on screen
  void show() {  
    fill(200, 200, 0);
    stroke(200, 200, 0);
    ellipse(pos.x, pos.y, r, r);
  }
}