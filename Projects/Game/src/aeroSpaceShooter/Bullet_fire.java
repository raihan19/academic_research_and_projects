package aeroSpaceShooter;

import java.awt.Rectangle;

public class Bullet_fire extends Thread{

	private Bullet bullet;
	private Enemy[][] enemies;
	private GamePlatform gamePlatform;
	
	
	
	public Bullet_fire(Bullet bullet, Enemy[][] enemies, GamePlatform gamePlatform) {
	
		this.bullet = bullet;
		this.enemies = enemies;
		this.gamePlatform = gamePlatform;
	}


	public void run(){
		
		while(bullet.getX() < 2000){
			
			
			bullet.setX(bullet.getX() + 1);
			checkCollision();
			try{
				Thread.sleep(5);
			}
			catch(Exception e){}
			
			gamePlatform.repaint();
		}
		
		
		
	}
	
	public void checkCollision(){
		
		Rectangle bulletRect = new Rectangle(bullet.getX(),bullet.getY(),42,30);
		
		for(int i = 0; i < enemies.length; i++){
			for(int j = 0; j<enemies[i].length;j++)
			{
				Rectangle enemiesRect = new Rectangle(enemies[i][j].getX(),enemies[i][j].getY(),100,100);
				
				if(bulletRect.intersects(enemiesRect) == true){
					enemies[i][j].setIsAlive(false);
					enemies[i][j].setX(-300);
					Gamesound.bulletHitSound();
					GamePlatform.score++;
					break;
			}
			
			}
			
		}
		
		
		
	}
	
}
