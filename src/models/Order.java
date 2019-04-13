package models;

import java.util.ArrayList;

public class Order {

	static int count=0;
	int id;
	ArrayList<Menu> menu;
	int totalCost;
	
	public Order(ArrayList<Menu> menu) {
		this.id=count++;
		this.menu=menu;
	}
}
