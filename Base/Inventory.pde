class Inventory {
  //--------------------------------------------------------------------------------------------------
  //variables
  private int inventoryspace = 64;
  private int nextItem = 0;
  private int tempstate = 0;

  private Item[] inventoryslot = new Item[inventoryspace];

  //--------------------------------------------------------------------------------------------------
  //constructor
  public Inventory() {
  }

  //--------------------------------------------------------------------------------------------------
  //main method body
  public int createItem(String name_, int stackValue_, int startValue_, boolean hasDurability_, double usage_) {   //creating new item
    inventoryslot[nextItem] = new Item(name_, stackValue_, startValue_, hasDurability_, usage_);
    nextItem++;
    return 0;
  }

  public int addItem(String name_, int value_) {
    /*method adds or removes items from the inventory
     returns missing space as neg. value
     returns 0 if correctly processed
     returns pos. value for too many items
     */

    for (int i = 0; i < inventoryslot.length; i++) {
      if (inventoryslot[i].getItemname() == name_) {
        tempstate = inventoryslot[i].changevalue(value_);
        if (tempstate > 0) {
          //Item over stacksize
          return tempstate;
        } else if (tempstate < 0) {
          //Item empty
          return tempstate;
        }
        //item gets added successfully
        return tempstate;
      }
    }
    return -1; //item does not currently exist in inventory
  }

  public int outAllItems() {
    return 0;
  }
}