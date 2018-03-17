class UI { 
  //variables
  boolean showDebug = false;

  //window option UI
  float x_UI = 0;
  float x_UI_w1 = 250;   //w1 = end of first window, start of second window
  float x_UI_w2 = 500;   //w2 = look above
  float y_UI_top = 0;    //differenz between y_UI_bot and y_UI_top = window height
  float y_UI_bot = 45;
  //window option DebugUI
  float x_debug_UI_w1 = 70;
  float x_debug_UI_w2 = 140;
  float x_debug_UI_w3 = 210;
  float y_debug_UI_top;
  float y_debug_UI_bot;
  //window options text pos
  float x_UI_text = 10;
  float y_UI_text = 35;
  float y_debug_UI_text = 12;





  //--------------------------------------------------------------------------------------------------
  //constructor
  UI() {    
    y_debug_UI_top = height - 40;
    y_debug_UI_bot = height;
  }

  //--------------------------------------------------------------------------------------------------
  //methodes -> UI windows

  //showing the players amount of currency
  void coinValue(int coins_) {

    util.mainThemeUI();

    //coordinates window
    float x1 = x_UI;
    float x2 = x_UI_w1;
    float y1 = y_UI_top;
    float y2 = y_UI_bot;
    //coordinates text
    float tx = x_UI_text;
    float ty = y_UI_text;

    quad(x1, y1, x2, y1, x2, y2, x1, y2);


    util.mainTextUI();

    //show text
    text("Coins: " + coins_, tx, ty);
  }

  //window for open inventory button
  void showInv(int stone_, int iron_, int gold_, int diamond_) {

    util.mainThemeUI();

    //coordinates window
    float x1 = x_UI_w1;
    float x2 = x_UI_w2;
    float y1 = y_UI_top;
    float y2 = y_UI_bot;
    //coordinates text
    float tx = x_UI_text;
    float ty = y_debug_UI_text + 6;  //top border distance

    quad(x1, y1, x2, y1, x2, y2, x1, y2);

    util.mainDebugTextUI();

    //show text
    //text("Gold: " + gold_ + "   " + "Diamond: " + diamond_, x_UI_w1 + tx, ty);
    text("Stone: " + stone_, x1 + tx, ty);
    text("Iron: " + iron_, x1 + tx + 70, ty);
    text("Gold: " + gold_, x1 + tx + 140, ty);
    text("Diamond: " + diamond_, x1 + tx, ty*2);
    
    
  }


  //--------------------------------------------------------------------------------------------------
  //Debug windows

  //showing the players position coordinates
  void playerPos(float x_, float y_) {

    util.mainThemeUI();

    //coordinates window
    float x1 = x_UI;
    float x2 = x_debug_UI_w1;
    float y1 = y_debug_UI_top;
    float y2 = y_debug_UI_bot;
    //coordinates text
    float tx = x_UI_text;  // distance from left side stroke
    float ty = y_debug_UI_text;  //distance from top stroke

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

    //coordinates window
    float x1 = x_debug_UI_w1;
    float x2 = x_debug_UI_w2;
    float y1 = y_debug_UI_top;
    float y2 = y_debug_UI_bot;
    //coordinates text
    float tx = x_debug_UI_w1 + x_UI_text;  // distance from left side stroke
    float ty = y_debug_UI_text;  //distance from top stroke

    quad(x1, y1, x2, y1, x2, y2, x1, y2);

    util.mainDebugTextUI();

    //show text
    text("dir", tx, y1 + ty);
    text(x_, tx, y1 + ty*2);
    text(y_, tx, y1 + ty*3);
  }

  //showing players inventory space
  void invSpace(float invSpace_, float maxSpace_) {

    util.mainThemeUI();

    float x1 = x_debug_UI_w2;
    float x2 = x_debug_UI_w3;
    float y1 = y_debug_UI_top;
    float y2 = y_debug_UI_bot;

    float tx = x_debug_UI_w2 + x_UI_text;  // distance from left side stroke
    float ty = y_debug_UI_text;  //distance from top stroke


    quad(x1, y1, x2, y1, x2, y2, x1, y2);

    util.mainDebugTextUI();

    //show text
    text("InvSpace", tx, y1 + ty);
    text(invSpace_, tx, y1 + ty*2);
    text(maxSpace_, tx, y1 + ty*3);
  }


  //--------------------------------------------------------------------------------------------------
  //showing HUD via this method
  void show(Player p_) {
    //usual
    coinValue(p_.coins);
    showInv(p_.inv.stone.size(), p_.inv.iron.size(), p_.inv.gold.size(), p_.inv.diamond.size());

    //debug
    if (showDebug == true) {
      playerPos(parseInt(p_.pos.x), parseInt(p_.pos.y));
      playerDir(parseInt(p_.dir.x), parseInt(p_.dir.y));
      invSpace(parseInt(p_.inv.calcWeight()), parseInt(p_.inv.weightLimit));
    }
  }
}