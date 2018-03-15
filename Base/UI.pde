class UI { 
  
  int coins = 100;
  
  UI(){
    //coinValue();
    
  
  }
  
  void openInventory(){
    //square base, square is for slots as inventory space
    quad(20,20, 220,20, 20,220, 220,220);
    
  }
  
  void coinValue(){
    //show coins
    fill(0,0,0);
    stroke(255);
    quad(0,0,250,0,250,45,0,45);
    textSize(36);
    fill(0,255,0);
    text("Coins: " + coins, 10, 35);
  }
  
  void playerPos(){
    
    quad(0,0,250,0,250,45,0,45);
    
  }
  
  
  void show(int coins_){
    coins = coins_;
    coinValue();
    
  }
  
  
  
}