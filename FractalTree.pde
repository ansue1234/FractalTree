private double fractionLength = 0; 
private int smallestBranch = 7; 
//private double branchAngle = .4;  
private double bAn1 = (double)(Math.random()*0.5+0.25);
private double bAn2 = (double)(Math.random()*0.5+0.25);
private boolean growth = true;
//private int b = 255;
private int r = 150;
private int g = 75;
public void setup() 
{ 
  frameRate(30);
	size(1000,800);    
	 
} 
public void draw() 
{   
	//background(r,g,b); 
  background(135,200,235);
	stroke(150,75,0);   
  strokeWeight(12);
	line(500,700,500,800);   
	drawBranches(500,700,140,3*Math.PI/2,10);  //will add later 

  if(growth==true){
    grow();
  }else{
    shrink();
  }
  //if(fractionLength>0.6){
  //  r=0;
  //  g=255;
  //}
	if(fractionLength>0.75){
		growth=false;
	}else if(fractionLength<0){
		growth=true;
	}
} 
public void drawBranches(int x,int y, double branchLength, double angle, double wid) 
{   
	
	double angle1 = angle + bAn1;
	double angle2 = angle - bAn2;
	branchLength= branchLength*fractionLength;
  wid*=fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  strokeWeight((float)wid+1);
  stroke(0,255,0);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
  
	if(branchLength>smallestBranch){
		drawBranches(endX1,endY1,branchLength,angle1,wid);
		drawBranches(endX2,endY2,branchLength,angle2,wid);
		//drawBranches(endX2,endY2,branchLength,angle2+angle1);
	}
  
	// }else{
	// 	drawBranches(endX1,endY1,branchLength,angle1);
	// 	drawBranches(endX2,endY2,branchLength,angle2);
	// }
} 

public void grow(){
  fractionLength+=0.00075;
  //b-=0.000005;
  //g-=0.00001;
  //r-=0.00002;
  
}

public void shrink(){
  fractionLength-=0.00075;
  //b+=0.55;
  //g+=1;
  //r+=2;
}