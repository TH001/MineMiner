/* version history
 Alpha 1.0 - 912  lines of code - Base, Box, Inventory, Item, Map, Market, Player, UI, Utility         - 9 classes
 Alpha 1.1 - 1074 lines of code - Base, Bos, Inventory, Item, Map, Market, Player, UI, Utility, Marker - 10 classes
 */

/*
What we want to change:
 - slim code, do more cleanup
 - finish market
 - add more textures
 - add buildings
 - add other textures, change textures
 */

//import statements
import static javax.swing.JOptionPane.*;
import javax.swing.*;
import java.awt.*;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import controlP5.*;

//variables
private int tileSize = 10; //size of each maptile or box
private int cicle    = 300;
private int ccicle   = 0;

public float intRadius = 100;

private boolean fogOfWar = true;

public boolean selling = false;

private PVector startPos = new PVector(100, 100);
private PVector newDir = new PVector();

//istances of custom classes
public UI mainUI;
public Player player1;
public Map mainMap;
public Map underworld;
public Map overworld;
public Utility util;
public Market shop = new Market();

//tools for buttons etc in UI
ControlP5 sell;
ControlP5 nav;

//textures for the map
public PImage stone;
public PImage grass;
public PImage pavement;
public PImage iron_ore;
public PImage gold_ore;
public PImage diamond_ore;
public PImage forest;
public PImage water;
public PImage lava;

public PImage market;

//--------------------------------------------------------------------------------------------------
//main class body
void setup() {
  size(1000, 600);
  frameRate(60);
  colorMode(RGB);
  ellipseMode(CENTER);

  println(color(255, 74, 0));

  //setting up UI and Utilities
  mainUI = new UI();
  util = new Utility(mainUI.px, mainUI.py, mainUI.sx, mainUI.sy, mainUI.boff);

  sell   = new ControlP5(this);
  nav    = new ControlP5(this);

  sell.setAutoDraw(true);
  nav.setAutoDraw(true);

  util.importImages();
  util.initiateCP5();

  //setting up player character
  player1 = new Player(startPos.x, startPos.y, 20, 100);

  //mainMap
  underworld = new Map(width, height, tileSize, tileSize, "../textures/maps/mainMap.png");

  //overworld
  overworld = new Map(width, height, tileSize, tileSize, "../textures/maps/overworld.png");

  //mainMap
  mainMap = overworld;
  if (!fogOfWar || mainMap == overworld) {
    mainMap.show(true);
  }

  //setting CP% windows to hide
  sell.hide();
}


//--------------------------------------------------------------------------------------------------
// draw method, gets called every frame
void draw() {

  //reserved for print statements

  //

  if (fogOfWar && mainMap == underworld) {
    background(0);
  }

  //show map
  mainMap.show(false);

  //show UI
  mainUI.show(player1, shop);

  resizeDir();
  //show Player
  player1.move(newDir);
  player1.show();

  //update market
  if (ccicle == cicle) {
    shop.updatePrizes();
    ccicle = 0;
  } else {
    ccicle++;
  }
}

//--------------------------------------------------------------------------------------------------
//methods
void resizeDir() {
  if (newDir.x < 0) {
    newDir.x = -1;
  } else if (newDir.x > 0) {
    newDir.x = 1;
  } else {
    newDir.x = 0;
  }

  if (newDir.y < 0) {
    newDir.y = -1;
  } else if (newDir.y > 0) {
    newDir.y = 1;
  } else {
    newDir.y = 0;
  }
}

//--------------------------------------------------------------------------------------------------
//key registering methods
void keyPressed() {
  //detecting players movement
  if (keyCode == 38) {
    newDir.y = -1;
  }
  if (keyCode == 40) {  //down
    newDir.y = 1;
  }
  if (keyCode == 37 ) { //left
    newDir.x = -1;
  }
  if (keyCode == 39) { //right
    newDir.x = 1;
  }
  if (keyCode == 130) {
    mainUI.showDebug = !mainUI.showDebug;
  }
  //println(keyCode); //print keyCode for easier key implementation
}

void keyReleased() {
  switch(keyCode) {
    //movement reset
  case 37:
    newDir.x = 0;
    break;
  case 38:
    newDir.y = 0;
    break;
  case 39:
    newDir.x = 0;
    break;
  case 40:
    newDir.y = 0;
    break;

    //default statement
  default:
    break;
  }
}

void mousePressed() {
  if (mouseButton == 37) {  //LMB
    util.interact(util.interacted(), "mine");
  }

  if (mouseButton == 38) {  //MMB
  }

  if (mouseButton == 39) {  //RMB
    util.interact(util.interacted(), "open");
  }
}

//--------------------------------------------------------------------------------------------------
//controlP5 events
void SellStone() {
  if (player1 != null) {
    player1.inv.sell("stone");
  }
}

void SellIron() {
  if (player1 != null) {
    player1.inv.sell("iron");
  }
}

void SellGold() {
  if (player1 != null) {
    player1.inv.sell("gold");
  }
}

void SellDiamond() {
  if (player1 != null) {
    player1.inv.sell("diamond");
  }
}

void ChangeMap() {
  if (player1 != null) {
    if (mainMap == overworld) {
      mainMap = underworld;
    } else {
      mainMap = overworld;
      mainMap.show(true);
    }
    player1.pos = startPos;
  }
}