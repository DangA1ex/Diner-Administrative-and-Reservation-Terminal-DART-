package models;

public class Ingredients {

	int quantity;
	String name;
	
	public Ingredients(int quantity, String name) {
		this.quantity=quantity;
		this.name= name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
		}
	
	public boolean checkAvailable() {
		if(this.quantity==0) {
			return false;
		}
		return true;
	}
}
