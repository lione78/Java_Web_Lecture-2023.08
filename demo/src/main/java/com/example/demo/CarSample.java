package com.example.demo;

public class CarSample {
	private int carNo;
	private String name;
	private String color;
	private String size;
	private String tire;
	
	public CarSample(int carNo, String name, String color, String size, String tire) {
		this.carNo = carNo;
		this.name = name;
		this.color = color;
		this.size = size;
		this.tire = tire;
	}

	public int getCarNo() {
		return carNo;
	}

	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getTire() {
		return tire;
	}

	public void setTire(String tire) {
		this.tire = tire;
	}

	@Override
	public String toString() {
		return "CarSample [carNo=" + carNo + ", name=" + name + ", color=" + color + ", size=" + size + ", tire=" + tire
				+ "]";
	}
	
}
