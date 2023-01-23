import processing.sound.*;

SoundFile sfx_point;
SoundFile sfx_wing;

PShape bird;
PImage bg;
JSONObject data;

bird b;
pillar[] p;

boolean end = false;
boolean intro = true;

int score = 0;
int bestScore = 0;

String mainTitle;
String mainText;
String gameOverTitle;
String gameOverText;
String scoreText;
String bestScoreText;

void setup()
{
    size(500, 700);
    
    b = new bird();
    p = new pillar[3];
    
    data = loadJSONObject("data.json");
    
    mainTitle = data.getString("main_title");
    mainText = data.getString("main_text");
    gameOverTitle = data.getString("game_over_title");
    gameOverText = data.getString("game_over_text");
    scoreText = data.getString("score_text");
    bestScoreText = data.getString("best_score_text");

    sfx_point = new SoundFile(this, "sfx_point.wav");
    sfx_wing = new SoundFile(this, "sfx_wing.wav");
        
    bird = loadShape("bird.svg");
    bg = loadImage("bg.png");
    
    for(int i = 0; i < 3; i++){
      p[i] = new pillar(i);
    }
}

void draw()
{
    background(bg);
    
    b.drawBird();
       
    if(end){
      b.move();
      b.gravity();
    }
    
    b.checkCollision();
    
    stroke(0, 255, 0);
    strokeWeight(20);
    
    for(int i = 0; i < 3; i++){
      p[i].drawPillar();
      p[i].checkPosition();
    }
    
    //fill(0, 255, 0);
    stroke(255);
    strokeWeight(4);
    textSize(32);
    
    if(end){
      
      fill(0);
      textSize(50);
      text(score, 240, 75);
      
    }else{
      
      fill(0);
      
      if(intro){
        
        text(mainTitle, 175, 75);
        text(mainText, 170, 535);
        
      }else{
        
        text(gameOverTitle, 175, 100);
        fill(255);
        rect(150, 150, 200, 150);
        fill(0);
        textSize(20);
        text(scoreText, 180, 200);
        text(score, 300, 200);
        text(bestScoreText, 180, 250);
        
        if(bestScore < score){
          bestScore = score;
        }
                
        text(bestScore, 300, 250);
        textSize(32);
        text(gameOverText, 140, 535);
        
      }
    }
}

void reset()
{
    end = true;
    score = 0;
    b.yPos = 350;
    
    for(int i = 0; i < 3; i++){
      p[i].xPos += 500;
      p[i].pass = false;
    }
}

void mousePressed()
{
    b.jump();
    sfx_wing.play();
    intro = false;
    
    if(end == false){
      reset();
    }
}

void keyPressed()
{
    b.jump();
    sfx_wing.play();
    intro = false;
    
    if(end == false){
      reset();
    }
}
