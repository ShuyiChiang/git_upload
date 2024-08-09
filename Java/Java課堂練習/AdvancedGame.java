package com.cathybk1;
import java.util.Random;

public class AdvancedGame {

	public static void main(String[] args) {
		String[] options= {"石頭","剪刀","布"};
		Random rand=new Random();
		int aWins=0,bWins=0;//計算贏了幾局
		
		for(int i=0; i<3; i++) {
			int aChoice=rand.nextInt(3);
			int bChoice=rand.nextInt(3);
			
			String aString=options[aChoice];//數字轉出拳字串
			String bString=options[bChoice];
			
			if(aChoice==bChoice) {
				System.out.println("A出拳：" + aString + "、B出拳：" + bString+ "，平手");
				//continue; // 出拳相同，重來
			}else if((aChoice==0 && bChoice==1)||(aChoice==1 && bChoice==2)||(aChoice==2 && bChoice==0)) {
				System.out.println("A出拳：" + aString + "、B出拳：" + bString+ "，A贏");
				aWins++;
			}else {
				System.out.println("A出拳：" + aString + "、B出拳：" + bString + "，B贏");
				bWins++;
			}
		}
		
		 if (aWins == 2) {
	            System.out.println("最後贏家：A");
	        } else {
	            System.out.println("最後贏家：B");
	        }

    }

}
