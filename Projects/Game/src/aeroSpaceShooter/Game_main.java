package aeroSpaceShooter;

import javax.swing.JFrame;

public class Game_main {

	public static void main(String[] args) {
		
        GamePlatform gp = new GamePlatform();
		
		JFrame gameFrame = new JFrame();
		gameFrame.setTitle("Alien Shooter");
		gameFrame.setSize(1000, 700);
		gameFrame.setLocation(200, 20);
		gameFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		gameFrame.add(gp);
		gameFrame.setVisible(true);
		
	}

}
