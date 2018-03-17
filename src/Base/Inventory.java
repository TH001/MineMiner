/**
 * 
 */
package Base;

public class Inventory {

	private int inventoryspace = 64;
	private int nextitem = 0;
	private Item[] inventoryslot = new Item[inventoryspace];
	private double inventoryweight = 0;
	private double inventoryweightlimit = 100;
	private int tempstate = 0;
	private double tempvalue = 0;
	
	public Inventory() {
		//creating basic Items
		createItem("wood", 64, 0, 0.5, false, 0);
		createItem("stone", 64, 0, 1, false, 0);
		createItem("iron", 64, 0, 1.5, false, 0);
		createItem("gold", 64, 0, 2, false, 0);
		createItem("diamond", 64, 0, 4, false, 0);
		
	}
	
	public int createItem(String name, int stackvalue, int startvalue, double weight, boolean duability, double usageprozentage) {
		for (int i = 0; i < nextitem; i++) {
			if(inventoryslot[i].getItemname()==name) return -1;	//item already exists
		}
		inventoryslot[nextitem]= new Item(name, stackvalue, startvalue, weight, duability, usageprozentage);
		nextitem++;
		return 0;
	}
	
	public double getInventoryWeight() {
		inventoryweight= 0;
		for (int i = 0; i < nextitem; i++) {
			inventoryweight=inventoryweight+inventoryslot[i].getStackWeight();
		}
		return inventoryweight;
	}
	
	public int checkInventoryWeight() {
		if(getInventoryWeight()>inventoryweightlimit) return -1;
		else return 0;
	}
	
	public int addItem(String name, int value) {
		/** function for adding and taking Items from inventory 
		 *  returns the number missing in inventory as neg. digits
		 *  returns 0 if everything correct
		 *  returns pos. digits when there are to many Items*/
		for (int i = 0; i < inventoryslot.length; i++) {
			if (inventoryslot[i].getItemname()==name) {
				tempstate=inventoryslot[i].changevalue(value);
				if(tempstate>0)return tempstate;/**Item over stacksize */
				else if(tempstate<0)return tempstate;/** Item empty*/
				return tempstate;/** item added inventory */
			}				
		}
		return -1;/** item does not exists in inventory */
	}
	
	public int outputallitems() {
		
		return 0;
	}

}
