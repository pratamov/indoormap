package id.ac.itb.indoormap.model;

public class Koordinat {
	
	private double x;
	private double y;
	public Koordinat(){
		this.x = -1;
		this.y = -1;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public double[] toArray(){
		return new double[] {x, y};
	}
}
