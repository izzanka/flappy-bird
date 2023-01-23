class bird
{
  float xPos, yPos, ySpeed;
  
  bird()
  {
    xPos = 250;
    yPos = 350;
  }
  
  void drawBird()
  {
    shape(bird, xPos, yPos, 30, 30);
  }
  
  void jump()
  {
    ySpeed =- 10; 
  }
  
  void gravity()
  {
    ySpeed += 0.5; 
  }
  
  void move()
  {
     yPos += ySpeed;
     
     if(score > 5){
       if(score != 0){
          for(int i = 0; i < 3; i++){
            p[i].xPos -= 4;
         }
       } 
     }
     for(int i = 0; i < 3; i++){
          p[i].xPos -= 3;
       }
   
   
  }
  
  void checkCollision()
  {
     if(yPos > 700){
        end = false;
     }else if(yPos < 0){
        end = false;
     }
      
     for(int i = 0; i < 3; i++){
        if((xPos < p[i].xPos + 15 && xPos > p[i].xPos - 15) && (yPos < p[i].yPos - 100 || yPos > p[i].yPos + 100)){
          end = false;
        }
     }
  } 
}
