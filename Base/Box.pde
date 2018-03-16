class Box {
  //variables
  private int type = 0;
  private int size;

  private float threshold = 100;

  private PVector pos = new PVector();

  //--------------------------------------------------------------------------------------------------
  //constructor
  Box(int type_, int size_, float x_, float y_) {
    this.type = type_;
    this.size = size_;

    this.pos.x = x_;
    this.pos.y = y_;
  }

  //--------------------------------------------------------------------------------------------------
  //show
  void show(boolean init) {
    if (nearPlayer() || init) {
      util.mapDebugTheme();
      if (type == 1) {
        image(stone, this.pos.x, this.pos.y, this.size, this.size);
      } else if (type == 2) {
        image(pavement, this.pos.x, this.pos.y, this.size, this.size);
      } else if(type == 3){
        image(iron_ore, this.pos.x, this.pos.y, this.size, this.size);
      } else {
        rect(this.pos.x, this.pos.y, this.size, this.size);
      }

    }
  }

  //--------------------------------------------------------------------------------------------------
  //method body
  boolean nearPlayer() {
    if (this.pos.dist(player1.pos) <= threshold) {
      return true;
    }
    return false;
  }
}