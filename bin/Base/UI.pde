class UI { 
  
  int coins = 100;
  
  UI(){
    
    
  }
  
  void openInventory(){
    //square base, square is for slots as inventory space
    quad(20,20, 220,20, 20,220, 220,220);
    
  }
  
  void coinValue(){
    //show coins
    fill(0);
    quad(0,0,200,0,200,50,0,50);
    textSize(20);
    fill(0,255,0);
    text( coins, 50, 50);
  }
  
  
  void show(){
    
    
    
  }
  
  
  
}