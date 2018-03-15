class Player {

  //movement via mouse has been removed!
  //movement via arrow-keys, mouse for interactions with UI etc.

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
  
  void checkBorders(){  //checking whether the player has reached the border of the screen, if so, pause movement in a certain direction
    if(this.pos.x <= 0){
     //left border reached 
     this.pos.x = 1;
    }
    if(this.pos.x >= width){
      //right border reached
      this.pos.x = width - 1;
    }
    if(this.pos.y <= 0){
      //upper border reached
      this.pos.y = 1;
    }
    if(this.pos.y >= height){
      //lower border reached
      this.pos.y = height - 1;
    }
  }

  //---------------------------------------------------------------------------
  //shows player on screen
  void show() {  
    fill(200, 200, 0);
    stroke(200, 200, 0);
    ellipse(pos.x, pos.y, r, r);
    
    checkBorders();
  }
}