/*
What we want to change:
 - detect wether right or left mouse button get pressed
 - use mouseclick for interactions
 - slim code
 - add more textures
 - add buildings
 - refine textures and code
 */

//import statements
import static javax.swing.JOptionPane.*;
import javax.swing.*;
import java.awt.*;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

//variables
private int tileSize = 10; //size of each maptile or box

public UI mainUI = new UI();

public Player player1;

public Map mainMap;

public Utility util = new Utility();

private PVector newDir = new PVector();

//textures for the map
public PImage stone;
public PImage pavement;
public PImage iron_ore;
public PImage gold_ore;
public PImage diamond_ore;

//--------------------------------------------------------------------------------------------------
//main class body
void setup() {
  size(1000, 600);
  colorMode(RGB);
  ellipseMode(CENTER);

  util.importImages();

  //setting up player character
  player1 = new Player(100, 100, 20, 100);

  //mainMap
  mainMap = new Map(width, height, tileSize, tileSize, "../textures/maps/mainMap.png");
  mainMap.show(true);
}


//--------------------------------------------------------------------------------------------------
// draw method, gets called every frame
void draw() {
  //background(50);

  //show map
  mainMap.show(false);

  //show UI
  mainUI.show(player1);

  resizeDir();
  //show Player
  player1.move(newDir);
  player1.show();
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
  if(keyCode == 130){
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
  if(mouseButton == 37){
    util.interact(util.interacted());
  }
  
  println(mouseButton);
}