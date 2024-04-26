package aeroSpaceShooter;

import java.awt.Graphics;
import javax.swing.ImageIcon;

public class Enemy {

	private int x, y;
	private boolean isAlive;
	private String imagePath;
	
	public Enemy(int x, int y, boolean isAlive, String imagePath)
	{
		this.x = x;
		this.y = y;
		this.isAlive = isAlive;
		this.imagePath = imagePath;
	}
	public int getX()
	{
		return x;
	}
	public void setX(int x)
	{
		this.x = x;
	}
	public int getY()
	{
		return y;
	}
	public void setY()
	{
		this.y = y;
	}
	public boolean getIsAlive()
	{
		return isAlive;
	}
	public void setIsAlive(boolean isAlive)
	{
		this.isAlive = isAlive;
	}
	public String getImagePath()
	{
		return imagePath;
	}
	public void setImagePath(String imagePath)
	{
		this.imagePath = imagePath;
	}
	public void draw(Graphics g)
	{
		ImageIcon enemy = new ImageIcon(imagePath);
		g.drawImage(enemy.getImage(), x, y, null);
	}
	
}

