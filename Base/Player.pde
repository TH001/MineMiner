class Player {
  
  //Position
  private PVector pos = new PVector(50, 100);
  
  //Inventory
  private Inventory inv;
  
  //Coins
  private int coins;
  
  //size of player
  private float r;
  
  Player(float r_, int coins_){
    
    inv = new Inventory();
    
    coins = coins_;
    r = r_;
  }
  
  void show(){
    fill(200,200,0);
    ellipse(pos.x, pos.y, r, r);
  }
}