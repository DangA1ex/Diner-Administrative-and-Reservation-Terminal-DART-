package models;

import java.util.ArrayList;

public class Menu {

	String name;
	Integer id;
	ArrayList<String> photo;
	ArrayList<Ingredients> ingredients;
	String description;
	Float price;
	Integer quantity;
	
	public Menu (Integer id, String name, Float price, Integer quantity) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
	
	public ArrayList<Ingredients> getIngredients() {
		return ingredients;
	}

	public Float getPrice() {
		return price;
	}

	public String getName() {
		return name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ArrayList<String> getPhotos() {
		return photo;
	}

	public void setPhoto(ArrayList<String> photo) {
		this.photo = photo;
	}
	
	public String getPhoto(int i) {
		return this.photo.get(i);
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
