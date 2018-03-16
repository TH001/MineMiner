class UI { 
  //variables
  boolean showDebug = false;

  //--------------------------------------------------------------------------------------------------
  //constructor
  UI() {
  
  }

  //showing the players amount of currency
  void coinValue(int coins_) {

    //show coins
    util.mainThemeUI();

    float x1 = 0;
    float x2 = 250;
    float y1 = 0;
    float y2 = 45;

    quad(x1, y1, x2, y1, x2, y2, x1, y2);

    util.mainTextUI();

    text("Coins: " + coins_, 10, 35);
  }

  //showing the players position coordinates
  void playerPos(float x_, float y_) {

    util.mainThemeUI();

    //coordinates window
    float x1 = 0;
    float x2 = 70;
    float y1 = 560;
    float y2 = 600;

    float tx = x1 + 10;  // distance from left side stroke
    float ty = 12;  //distance from top stroke

    quad(x1, y1, x2, y1, x2, y2, x1, y2);

    util.mainDebugTextUI();

    //show text
    text("pos", tx, y1 + ty);
    text("x: " + x_, tx, y1 + ty*2);
    text("y: " + y_, tx, y1 + ty*3);
  }

  void playerDir(float x_, float y_) {

    util.mainThemeUI();

    float x1 = 70;
    float x2 = 140;
    float y1 = 560;
    float y2 = 600;

    float tx = x1 + 10;  // distance from left side stroke
    float ty = 12;  //distance from top stroke


    quad(x1, y1, x2, y1, x2, y2, x1, y2);

    util.mainDebugTextUI();

    //show text
    text("dir", tx, y1 + ty);
    text(x_, tx, y1 + ty*2);
    text(y_, tx, y1 + ty*3);
  }

  void openInv() {

    util.mainThemeUI();

    float x1 = 310;
    float x2 = 500;
    float y1 = 0;
    float y2 = 45;

    quad(x1, y1, x2, y1, x2, y2, x1, y2);
  }

  //showing HUD via this method
  void show(Player p_) {
    //usual
    coinValue(p_.coins);
    openInv();

    //debug
    if (showDebug == true) {
      playerPos(parseInt(p_.pos.x), parseInt(p_.pos.y));
      playerDir(parseInt(p_.dir.x), parseInt(p_.dir.y));
    }
  }
}
