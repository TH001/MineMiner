class Item {
  //--------------------------------------------------------------------------------------------------
  //variables
  private String itemname = "empty";

  private int stackSize;
  private int value;

  private boolean durability;
  private double usage;

  //--------------------------------------------------------------------------------------------------
  //constructor
  public Item(String name_, int stackValue_, int startValue_, boolean durability_, double usage_) {
    itemname     = name_;
    stackSize    = stackValue_;
    value        = startValue_;
    durability_  = durability_;
    usage        = usage_;

    //System.out.println("new Item: "+ name);
  }

  //--------------------------------------------------------------------------------------------------
  //main method body
  
  //get methods
  public String getItemname() {
    return itemname;
  }

  public int getStackSize() {
    return stackSize;
  }

  //set methods
  public int changevalue(int itemnumber) {
    if (value + itemnumber > stackSize) {
      value = stackSize;
      System.out.println(getItemname() + " changed value to: " + value);
      return itemnumber - stackSize;
      
    } else if (value + itemnumber <= 0) {
      itemnumber = value + itemnumber;
      value = 0;      
      System.out.println(getItemname() + " changed value to: " + value);
      return(itemnumber);
      
    } else {
      value=value+itemnumber;
      System.out.println(getItemname() + " changed value to: " + value);
      return 0;
    }
  }

  public double changeDurability(double durability_) {
    if (usage + durability_ > 100) {
      usage = 1;
      return 1;
      
    } else if (usage + durability_ > 0) {
      return (usage+durability_);
      
    } else if (usage + durability_ == 0) {
      if (value<1) {
        value=value-1;
        usage=1;
        return 1;
        
      } else if (value==1) {
        value=0;
        usage=0;
        return 0;
        
      } else {
        return -1;
        
      }
    } else {
      usage = usage + durability_;
      return 0;
    }
  }
}