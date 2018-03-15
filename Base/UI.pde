class UI { 
  

  
  UI(){
    //coinValue();
    
  
  }
  
  void openInventory(){
    //square base, square is for slots as inventory space
    quad(20,20, 220,20, 20,220, 220,220);
    
  }
  
  void coinValue(int coins){
    //show coins
    fill(0);
    stroke(255);
    quad(0,0,250,0,250,45,0,45);
    textSize(36);
    fill(0,255,0);
    text("Coins: " + coins, 10, 35);
  }
  
  void playerPos(float x, float y){
    fill(0);
    stroke(255);
    quad(250,0,500,0,500,45,250,45);
    textSize(10);
    fill(255,0,0);
    text("pos", 260, 12);
    text("x: " + x, 260, 24);
    text("y: " + y, 260, 36);
    
  }
   //x: " + x + ",y: " + y, 260, 35);
  
  void show(Player p){

    playerPos(p.pos.x,p.pos.y);
    coinValue(p.coins);
    
  }
  
  
  
}