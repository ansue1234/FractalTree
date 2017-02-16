public double fractionLength = 0; 
private int smallestBranch = 5; 
private double branchAngle = .4;  
private double bAn = (double)(Math.random()*0.5+0.25);
public void setup() 
{   
	size(1000,800);    
	 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(500,700,500,800);   
	drawBranches(500,700,140,3*Math.PI/2);  //will add later 
	if(fractionLength>=0.4){
		fractionLength-=0.001;
	}else if(fractionLength>=0){
		fractionLength+=0.001;
	}
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	
	double angle1 = angle + bAn ;
	double angle2 = angle - bAn;
	branchLength= branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength>smallestBranch){
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
		
	}
	// }else{
	// 	drawBranches(endX1,endY1,branchLength,angle1);
	// 	drawBranches(endX2,endY2,branchLength,angle2);
	// }

} 
