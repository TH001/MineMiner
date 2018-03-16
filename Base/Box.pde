class Box {
  //variables
  private int type = 0;
  private int size;
  
  private PVector pos = new PVector();
  
  //--------------------------------------------------------------------------------------------------
  //constructor
  Box(int type_, int size_, float x_, float y_){
    this.type = type_;
    this.size = size_;
    
    this.pos.x = x_;
    this.pos.y = y_;
  }
  
  //--------------------------------------------------------------------------------------------------
  //show
  void show(){
    util.mapDebugTheme();
    rect(this.pos.x, this.pos.y, this.size, this.size);
  }
  
  //--------------------------------------------------------------------------------------------------
  //method body
  
}