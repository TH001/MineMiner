class UI { 

  int coins = 100;

  UI() {
    //coinValue();
  }

  /*currently to be ignored
   void openInventory(){
   //square base, square is for slots as inventory space
   quad(20,20, 220,20, 20,220, 220,220);
   
   }
   */

  //showing the players amount of currency
  void coinValue(int coins_) {

    //show coins
    util.mainThemeUI();
    quad(0, 0, 250, 0, 250, 45, 0, 45);
    textSize(36);
    fill(0, 255, 0);
    text("Coins: " + coins_, 10, 35);
  }

  //showing the players position coordinates
  void playerPos(float x_, float y_) {

    util.mainThemeUI();
    quad(250, 0, 310, 0, 310, 45, 250, 45);
    textSize(12);
    fill(255, 0, 0);

    //show text
    text("pos", 260, 12);
    text("x: " + x_, 260, 24);
    text("y: " + y_, 260, 36);
  }

  void openInv() {

    util.mainThemeUI();
    quad(310, 0, 500, 0, 500, 45, 310, 45);
  }

  //showing HUD via this method
  void show(Player p_) {
    playerPos(parseInt(p_.pos.x), parseInt(p_.pos.y));
    coinValue(p_.coins);
    openInv();
  }
}