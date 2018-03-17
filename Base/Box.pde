class Box {
  //variables
  private int type = 0;
  private int size;

  private float threshold = 150;

  private PVector pos = new PVector();
  private PVector posM = new PVector();

  //--------------------------------------------------------------------------------------------------
  //constructor
  Box(int type_, int size_, float x_, float y_) {
    this.type = type_;
    this.size = size_;

    this.pos.x = x_;
    this.pos.y = y_;
    
    this.posM.x = x_ + (size_ / 2);
    this.posM.y = y_ + (size_ / 2);
  }

  //--------------------------------------------------------------------------------------------------
  //show
  void show(boolean init) {
    if (nearPlayer() || init) {
      util.mapDebugTheme();
      if (type == 1) {
        image(pavement, this.pos.x, this.pos.y, this.size, this.size);
      } else if (type == 2) {
        image(stone, this.pos.x, this.pos.y, this.size, this.size);
      } else if(type == 3){
        image(iron_ore, this.pos.x, this.pos.y, this.size, this.size);
      } else if(type == 4){
        image(gold_ore, this.pos.x, this.pos.y, this.size, this.size);
      } else if(type == 5){
        image(diamond_ore, this.pos.x, this.pos.y, this.size, this.size);
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
  
  //--------------------------------------------------------------------------------------------------
  //get and set methods
  int getType(){
    return this.type;
  }
  
  void setType(int type_){
    this.type = type_;
  }
}