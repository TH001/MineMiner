package Base;

public class testcore {
	
	static Inventory inv= new Inventory();
	
	private static String[][] inventoryview;
	
	public testcore() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		inv.createItem("wood", 64, 0, 0.5, false, 1);
		inv.createItem("stone", 64, 0, 1, false, 1);
		System.out.println("wood overflow: "+inv.addItem("wood", 2));
		System.out.println("wood overflow: "+inv.addItem("wood", 3));
		System.out.println("stone overflow: "+inv.addItem("stone", 67));
		inv.clearItem("stone");
		System.out.println("inventory weight: "+inv.getInventoryWeight());
		inventoryview = new String[inv.getItemNummber()][2];
		inventoryview = inv.outputallitems();
		for (int i = 0; i < inventoryview.length; i++) {
			System.out.println(inventoryview[i][0]+"|"+inventoryview[i][1]);
		}
	}

}
