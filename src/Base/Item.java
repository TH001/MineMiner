package Base;

public class Item {
	
	private String itemname = "empty";
//	private int 
	private int stacksize;
	private int value;
	private boolean itemduability;
	private double usage;
	private double itemweight;
	private double stackweight;

	public Item(String name, int stackvalue, int startvalue, double weight, boolean duability, double usageprozentage) {
		itemname = name;
		stacksize = stackvalue;
		value = startvalue;
		itemweight = weight;
		itemduability = duability;
		usage = usageprozentage;
		System.out.println("new Item: "+name);
	}
	
	public String getItemname() {//returns name
		return itemname;
	}
	public int getStackSize() {
		return stacksize;
	}
	public int changevalue(int itemnumber) {
		if(value+itemnumber>stacksize) {
			value=stacksize;
			System.out.println(getItemname()+" changed value to: "+value);
			return itemnumber-stacksize;
		}
		else if(value+itemnumber<=0) {
			itemnumber=value+itemnumber;
			value=0;			
			System.out.println(getItemname()+" changed value to: "+value);
			return(itemnumber);
		}
		else {
			value=value+itemnumber;
			System.out.println(getItemname()+" changed value to: "+value);
			return 0;
		}
	}
	
	public double getStackWeight() {
		stackweight=value*itemweight;
		System.out.println(getItemname()+" stack weight: "+stackweight);

		return stackweight;
	}
	
	public double changeDuability(double duabilitychange) {
		if(usage+duabilitychange>100) {
			usage = 1;
			return 1;
		}
		else if(usage+duabilitychange>0) {
			return (usage+duabilitychange);
		}
		else if(usage+duabilitychange==0) {
			if(value<1) {
				value=value-1;
				usage=1;
				return 1;
			}
			else if(value==1) {
				value=0;
				usage=0;
				return 0;
			}
			else {
				return -1;
			}
		}
		else {
			usage=usage+duabilitychange;
			return 0;
		}
	}

}
