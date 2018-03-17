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
	private int shifting;
	private String[][] inventoryout;
	
	public Inventory() {
		//creating basic Items
		createItem("wood", 64, 0, 0.5, false, 1);
		createItem("stone", 64, 0, 1, false, 1);
		createItem("iron", 64, 0, 1.5, false, 1);
		createItem("gold", 64, 0, 2, false, 1);
		createItem("diamond", 64, 0, 4, false, 1);
		
	}
	
	public int getItemNummber() {
		return nextitem;
	}
	
	public int createItem(String name, int stackvalue, int startvalue, double weight, boolean duability, double usageprozentage) {
		for (int i = 0; i < nextitem; i++) {
			if(inventoryslot[i].getItemname()==name) return -1;	//item already exists
		}
		inventoryslot[nextitem]= new Item(name, stackvalue, startvalue, weight, duability, usageprozentage);
		nextitem++;
		return 0;
	}
	
	public int clearItem(String name) {
		for (int i = 0; i < nextitem; i++) {
			if(shifting!=1) {
				if(inventoryslot[i].getItemname()==name) {
					System.out.println(inventoryslot[i].getItemname()+" slot cleared");
					inventoryslot[i]=inventoryslot[i+1];
					nextitem=nextitem-1;
				}
			}
			else {
				inventoryslot[i]=inventoryslot[i+1];
			}
		}
		return 1;//item does not even exits
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
		for (int i = 0; i < nextitem; i++) {
			if (inventoryslot[i].getItemname()==name) {
				tempstate=inventoryslot[i].changeValue(value);
				if(tempstate>0)return tempstate;/**Item over stacksize */
				else if(tempstate<0)return tempstate;/** Item empty*/
				return tempstate;/** item added inventory */
			}				
		}
		return -1;/** item does not exists in inventory 
		 * @return */
	}
	
	
	
	public String[][] outputallitems() {
		inventoryout = new String[nextitem][2];
		for (int i = 0; i < nextitem; i++) {
			inventoryout[i][0]=inventoryslot[i].getItemname();
			inventoryout[i][1]=""+inventoryslot[i].getValue();
		}
		return inventoryout;
	}

}
