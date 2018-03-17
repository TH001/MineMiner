class Utility {
  //this class contains any utility functions which experience frequent use from all other classes

  //coloursetups
  void mainThemeUI() {    //main colourscheme for the UI
    fill(0);
    stroke(255);
  }

  void mainTextUI() {  //main textparameter for debuggtextfor the UI
    textSize(36);
    fill(0, 255, 0);
  }

  void mainDebugTextUI() {  //main textparameter for debuggtextfor the UI
    textSize(12);
    fill(255, 0, 0);
  }

  void mapDebugTheme() {  //theme for debug of map
    fill(50);
    stroke(60);
  }

  //--------------------------------------------------------------------------------------------------
  //Windows to be opened
  void errorLoadingMap() {                    //opens small dialog showing the user thet no map could be loaded
    //JOptionPane pane = new JOptionPane();  
    JDialog dialog = new JDialog();

    JButton akn = new JButton("OK");
    JLabel text = new JLabel();

    text.setText("Error loading map! Program will exit!");
    akn.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e)
      {
        //Execute when button is pressed
        noLoop();
        exit();
      }
    }
    );

    Container pane = dialog.getContentPane();
    pane.setLayout(null);

    //JLabel error1 = new JLabel("Error loading map '" + mapid + "'! Program will exit!");

    //adding cmponents
    pane.add(text);
    pane.add(akn);
    text.setBounds(10, 10, 390, 30);
    akn.setBounds(100, 60, 200, 60);

    //dialog configuration
    dialog.setSize(400, 200);
    dialog.setModal(true);
    dialog.setTitle("Alert");
    dialog.setAlwaysOnTop(true);  

    dialog.setVisible(true);
  }

  //--------------------------------------------------------------------------------------------------
  //interaction
  Box interacted() {
    PVector mouse = new PVector(mouseX, mouseY);
    float minDist = width * height;
    float currDist = 0;
    Box curr = null;

    //check for box nearest to mouse
    for (Box b : mainMap.boxes) {
      currDist = mouse.dist(b.posM);

      if (currDist <= minDist && mouse.dist(player1.pos) <= intRadius) {
        minDist = currDist;
        curr = b;
      }
    }

    //return box nearest to mouse
    return curr;
  }

  void interact(Box b_, String arg) {  //makes the player able to interact with boxes, handles interaction
    if (arg == "mine") {
      mine(b_);
    } else if (arg == "open") {
      open(b_);
    }
  }

  //--------------------------------------------------------------------------------------------------
  //interaction childmethods
  void mine(Box b_) {
    if (b_ == null) {
      return;
    }
    int tmpType = b_.getType();

    b_.setType(1);
    b_.show(true);

    if (tmpType != 1) {
      player1.inv.add(new Item(tmpType));
    }
  }

  void open(Box b_) {
  }

  //--------------------------------------------------------------------------------------------------
  //import files
  void importImages() {
    stone       = loadImage("../textures/stone.png");
    pavement    = loadImage("../textures/pavement.png");
    iron_ore    = loadImage("../textures/iron_ore.png");
    gold_ore    = loadImage("../textures/gold_ore.png");
    diamond_ore = loadImage("../textures/diamond_ore.png");
  }
}