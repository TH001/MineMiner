package Base;

public class testcore {
	
	static Inventory inv= new Inventory();
	
	public testcore() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		inv.createItem("Holz", 64, 0, false, 0);
		inv.createItem("Stein", 64, 0, false, 0);
		System.out.println(inv.addItem("Holz", 2));
		System.out.println(inv.addItem("Holz", -3));
		System.out.println(inv.addItem("Stein", 67));
	}

}
