class Inventory {
  //--------------------------------------------------------------------------------------------------
  //variables
  private ArrayList<Item> stone   = new ArrayList<Item>();
  private ArrayList<Item> iron    = new ArrayList<Item>();
  private ArrayList<Item> gold    = new ArrayList<Item>();
  private ArrayList<Item> diamond = new ArrayList<Item>();
  
  private float weightLimit;
  
  //weights
  private float stoneWeight   = 1;
  private float ironWeight    = 1.5;
  private float goldWeight    = 4;
  private float diamondWeight = 1.2;

  //--------------------------------------------------------------------------------------------------
  //constructor
  public Inventory() {
  }

  //--------------------------------------------------------------------------------------------------
  //main method body
  void add(Item tmp){
    
  }
  
  boolean checkWeight(){  //checks if the weightlimit is reached
    if(calcWeight() >= weightLimit){
     return false; 
    }
    return true;
  }
  
  float calcWeight(){  //calculate the weight of all objects held
    float weight = 0;
    weight += stone.size()   * stoneWeight;
    weight += iron.size()    * ironWeight;
    weight += gold.size()    * goldWeight;
    weight += diamond.size() * diamondWeight;
    
    return weight;
  }
}