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
	public int changeValue(int itemnumber) {
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
	
	public int getValue() {
		return value;
	}
	
	public double getStackWeight() {
		stackweight=value*itemweight;
		System.out.println(getItemname()+" stack weight: "+stackweight);

		return stackweight;
	}
	
	public double changeDuability(double duabilitychange) {
		if(value>0) {
			if(usage+duabilitychange>100) {
				//max duability
				usage = 1;
				System.out.println(getItemname()+" repaired");
				return 2;
			}
			else if(usage+duabilitychange==0) {
				if(value>1) {
					//one used up ... using next one
					value=value-1;
					usage=1;
					System.out.println(getItemname()+" used, "+getItemname()+" is broken");
					System.out.println("replacement "+getItemname()+ " loaded");
					return 2;
				}
				else /*if(value==1)*/ {
					//one used up stack empty
					value=0;
					usage=0;
					System.out.println(getItemname()+" used, "+getItemname()+" is broken");
					System.out.println("no replacement "+getItemname()+ " stored");
					return 0;
				}
			}
			else if(usage+duabilitychange<0) {
				//negative use not possible returning overflow use
				return (usage+duabilitychange);
			}		
			else {
				//used!
				usage=usage+duabilitychange;
				System.out.println(getItemname()+" used, "+ usage + " left over");
				return usage;
			}
		}
		else {
			//no item -> no use
			System.out.println("no "+getItemname()+", "+getItemname()+" could not be used");
			return -1;
		}
	}

}
