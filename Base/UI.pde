class UI { 
  //variables
  boolean showDebug = false;
  float x_UI = 0;
  float x_UI_w1 = 250;   //w1 = end of first window, start of second window
  float x_UI_w2 = 500;   //w2 = look above
  float y_UI_top = 0;    //differenz between y_UI_bot and y_UI_top = window height
  float y_UI_bot = 45;  
  float x_debug_UI;
  float y_debug_UI;
  

  //--------------------------------------------------------------------------------------------------
  //constructor
  UI() {
  }
  
  //--------------------------------------------------------------------------------------------------
  //methodes -> UI windows

  //showing the players amount of currency
  void coinValue(int coins_) {

    //show coins
    util.mainThemeUI();

    float x1 = x_UI;
    float x2 = x_UI_w1;
    float y1 = y_UI_top;
    float y2 = y_UI_bot;

    quad(x1, y1, x2, y1, x2, y2, x1, y2);

    util.mainTextUI();

    text("Coins: " + coins_, 10, 35);
  }

  //window for open inventory button
  void openInv() {

    util.mainThemeUI();

    float x1 = x_UI_w1;
    float x2 = x_UI_w2;
    float y1 = y_UI_top;
    float y2 = y_UI_bot;

    quad(x1, y1, x2, y1, x2, y2, x1, y2);
  }

  //--------------------------------------------------------------------------------------------------
  //Debug windows

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

  //showing players direction
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
