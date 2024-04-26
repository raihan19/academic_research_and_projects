package aeroSpaceShooter;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class GamePlatform extends JPanel implements KeyListener{

	Spaceship ship;
	Enemy[][] enemies = new Enemy[6][2];
	Bullet[] bullets = new Bullet[10];
	int bulletCount = 0;
	static int score = 0;
	Enemy_moving emove = new Enemy_moving(this, enemies, 5);
	
	public GamePlatform(){
		super();
		
		super.addKeyListener(this);
		super.setFocusable(true);
		
		ship = new Spaceship(15,315,"images//spaceship.png");
		
		int xEnemy = 1000, yEnemy = 10;
		
		for(int i = 0; i < enemies.length; i++){
			for(int j = 0; j<enemies[i].length; j++)
			{
				enemies[i][j] = new Enemy(xEnemy,yEnemy,true,"images//ghost.png");
				yEnemy += 100;
			}
			
		}
		
		for(int i = 0; i < bullets.length; i++){
			bullets[i] = new Bullet(-100,-100,"images//bullet.png");
			
		}
		
		
		
	}
	
	public void paint(Graphics g){
		
		ImageIcon background = new ImageIcon("images//background.jpg");
		g.drawImage(background.getImage(), 0, 0, null);
		

        ship.draw(g);
		
		for(int i = 0; i < enemies.length; i++)
			for(int j = 0; j<enemies[i].length; j++)
			{
				if(enemies[i][j].getIsAlive() == true)
					enemies[i][j].draw(g);
			}
			
		
		for(int i = 0; i < bullets.length; i++)
			bullets[i].draw(g);
		
		g.setColor(Color.WHITE);
		
		g.drawString("Score::: " + score, 10, 10);
	}

	
	public void keyTyped(KeyEvent e) {
		
		
	}

	
	public void keyPressed(KeyEvent e) {
		
		if(e.getKeyCode() == KeyEvent.VK_UP){
			
			if(ship.getY() > 0)
				ship.setY(ship.getY() - 5);
			
			
		}
		
		else if(e.getKeyCode() == KeyEvent.VK_DOWN){
			
			if(ship.getY() < 630){
				ship.setY(ship.getY() + 5);
			}
		
		}
		
		else if(e.getKeyCode() == KeyEvent.VK_SPACE){
			
			bullets[bulletCount].setX(ship.getX());
			bullets[bulletCount].setY(ship.getY() + 22);
			
			Bullet_fire fire = new Bullet_fire(bullets[bulletCount],enemies,this);
			fire.start();
			
			emove.start();
			
			bulletCount++;
			
			if(bulletCount == 10)
				bulletCount = 0;
			
			
			
		} 
			
		
		super.repaint();
		
		
		
		
	}

	
	public void keyReleased(KeyEvent e) {
		
		
	}
	
}
