/**
 * 
 */
package Base;

public class Inventory {

	private int inventoryspace = 64;
	private int nextitem = 0;
	private Item[] inventoryslot = new Item[inventoryspace];
	private int tempstate = 0;
	
	public Inventory() {
		// TODO Auto-generated constructor stub
	}
	
	public int createItem(String name, int stackvalue, int startvalue, boolean duability, double usageprozentage) {
		inventoryslot[nextitem]= new Item(name, stackvalue, startvalue, duability, usageprozentage);
		nextitem++;
		return 0;
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
