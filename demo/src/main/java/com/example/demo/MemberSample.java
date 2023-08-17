package com.example.demo;

public class MemberSample {
	private int id;
	private String name;
	private AddressSample addr;
	private CarSample car;
	
	public MemberSample(int id, String name, AddressSample addr, CarSample car) {
		this.id = id;
		this.name = name;
		this.addr = addr;
		this.car = car;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public AddressSample getAddr() {
		return addr;
	}

	public void setAddr(AddressSample addr) {
		this.addr = addr;
	}

	public CarSample getCar() {
		return car;
	}

	public void setCar(CarSample car) {
		this.car = car;
	}

	@Override
	public String toString() {
		return "MemberSample [id=" + id + ", name=" + name + ", addr=" + addr + ", car=" + car + "]";
	}
	
	
}
