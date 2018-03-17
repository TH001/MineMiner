package Base;

public class testcore {
	
	static Inventory inv= new Inventory();
	
	public testcore() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		inv.createItem("wood", 64, 0, 0.5, false, 0);
		inv.createItem("stone", 64, 0, 1, false, 0);
		System.out.println("wood overflow: "+inv.addItem("wood", 2));
		System.out.println("wood overflow: "+inv.addItem("wood", -3));
		System.out.println("stone overflow: "+inv.addItem("stone", 67));
		System.out.println("inventory weight: "+inv.getInventoryWeight());
	}

}
