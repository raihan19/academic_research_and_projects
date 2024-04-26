package aeroSpaceShooter;

public class Enemy_moving extends Thread{

	private Enemy [][] enemy;
	private GamePlatform gamePlatform;
	int stepX;
	
	public Enemy_moving(GamePlatform gamePlatform, Enemy[][] enemy, int stepX)
	{
		this.enemy = enemy;
		this.gamePlatform = gamePlatform;
		this.stepX = stepX;
	}
	
	public int getStepX()
	{
		return stepX;
	}
	
	public void setStepX(int stepX)
	{
		this.stepX = stepX;
	}
	
	public void run()
	{
       while(enemy[0][0].getX() > 770){
			
			
			for(int i = 0 ; i < enemy.length; i++){
				
				for(int j = 0; j < enemy[i].length; j++){
					
					enemy[i][j].setX(enemy[i][j].getX() - stepX);
					
					
				}
				
				gamePlatform.repaint();
				try {
					Thread.sleep(10);
				} catch (Exception e) {
					
				}
			}
       }
	}
}
