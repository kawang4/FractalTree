
private double fractionLength = 0.8;
private int smallestBranch = 80;
private double branchAngle = .2;
int colorA = 248;
 int colorB = 185;
 int colorC = 212;
public void setup()
{  
  size(640,480);
}
public void draw()
{  
  background(0);  
  stroke(152, 118, 84);
  line(320,480,320,380);  
  drawBranches(320, 380, 100, 3*Math.PI/2);
  if (keyPressed) {
    if (key == 'a') {
      branchAngle -= 0.05;
    }
    else if (key == 'b' && smallestBranch > 10) {
      smallestBranch -= 5;
    }
    else if (key == 'c') {
      colorA += (int)(Math.random()*10) - 10;
  colorB += (int)(Math.random()*10) - 10;
  colorC += (int)(Math.random()*10) - 10;
    }
    else if (key == 'd') {
      colorA -= (int)(Math.random()*10) - 10;
  colorB -= (int)(Math.random()*10) - 10;
  colorC -= (int)(Math.random()*10) - 10;
    }
  }
}

public void drawBranches(int x,int y, double branchLength, double angle)
{  
  double angle1;
  double angle2;
  angle1 = angle + branchAngle;
  angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  if (branchLength < 25) {
     stroke(colorA, colorB, colorC);
   }
   else {
     stroke(152, 118, 84);
   }
 
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);

  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
 
  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
   

}
