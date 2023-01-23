class pillar
{  
  float xPos, yPos;
  boolean pass = false;
  
  pillar(int i)
  {
    xPos = 100 + (i * 200);
    yPos = random(500) + 100;
  }
  
  void drawPillar()
  {
    line(xPos, 0, xPos, yPos - 100);  
    line(xPos, yPos + 100, xPos, 700);
  }
  
 void checkPosition()
 {
    if(xPos < 0)
    {
       xPos += (200 * 3);
       yPos = random(500) + 100;
       pass = false;
    }
    
    if(xPos < 250 && pass == false)
    {
       pass = true;
       sfx_point.play();
       score++;
    }
 }
 
}
