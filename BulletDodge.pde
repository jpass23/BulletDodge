float x = 700;
float y = 400;
float x_vel;
float y_vel;
int bulletNum = 10;
float vel = 10; // bullet velocity
int lives = 5;
int score = 0;
int ballSpeed = 15;
int ballSize = 50;
boolean checkCollisions = false;
boolean gameOver = false;

Bullet[] top_arr = new Bullet[150];
Bullet[] left_arr = new Bullet[150];

void setup(){
  size(1400,800);
  for (int i=0;i<150;i++){
    top_arr[i] = new BulletImpl(random(0,1400),-30);
    top_arr[i].setXVel(random(-vel,vel));
    top_arr[i].setYVel(random(3,vel));
    
    left_arr[i] = new BulletImpl(-30,random(0,800));
    left_arr[i].setYVel(random(-vel,vel));
    left_arr[i].setXVel(random(3,vel));
  }
}

void draw(){
  strokeWeight(2);
  background(255);
  fill(0);
  ellipse(x,y,ballSize,ballSize);
  bulletMove(bulletNum);
  x_vel = ((mouseX-x)*0.01*ballSpeed);
  y_vel = ((mouseY-y)*0.01*ballSpeed);
  x += x_vel;
  y += y_vel;
  drawText();
  if (lives <= 0){
    gameOver();
    gameOver = true;
  }
  if(frameCount>120){
    if(frameCount%10 == 0){
      checkCollisions = true;
    }
  }
  if(frameCount%60 == 0 && lives>0){
    score++;
    if(score%5 == 0){
      bulletNum += 2;
    }
  }
}

void drawText(){
  fill(0);
  textSize(50);
  text("Lives: " + lives, 30,70);
  text("Score: " + score, 1200,70);
}

void gameOver(){
  fill(255);
  rect(0,0,1400,800);
  strokeWeight(8);
  rect(600,600,200,80);
  textSize(130);
  fill(0);
  text("Game Over",400,400); 
  textSize(60);
  text("Score: " + score,600,500);
  text("Restart",610,660);
}

void mousePressed(){
  if(gameOver){
    if((mouseX > 600) && (mouseX < 800) && (mouseY > 600) && (mouseY < 680)){
      score = 0;
      lives = 5;
      frameCount = 0;
      gameOver = false;
      bulletNum = 10;
      setup();
    }
  }
}

void bulletMove(int num){
  for(int i=0; i<num;i++){
    ellipse(top_arr[i].getX(), top_arr[i].getY(),10,10);
    ellipse(left_arr[i].getX(),left_arr[i].getY(),10,10);
    if(top_arr[i].getY()>=800){
      top_arr[i].setX(random(0,1400));
      top_arr[i].setY(0);
      top_arr[i].setXVel(random(-vel,vel));
      top_arr[i].setYVel(random(3,vel));
    }else{
      top_arr[i].update();
    }
    if(left_arr[i].getX()>=1400){
      left_arr[i].setX(0);
      left_arr[i].setY(random(0,800));
      left_arr[i].setYVel(random(-vel,vel));
      left_arr[i].setXVel(random(3,vel));
    }else{
      left_arr[i].update();
    }
    
    if(checkCollisions){
      if((top_arr[i].getX()>(x-(ballSize/2)) && top_arr[i].getX()<(x+(ballSize/2))
          && top_arr[i].getY()>(y-(ballSize/2)) && top_arr[i].getY()<(y+(ballSize/2))) || 
          (left_arr[i].getX()>(x-(ballSize/2)) && left_arr[i].getX()<(x+(ballSize/2))
          && left_arr[i].getY()>(y-(ballSize/2)) && left_arr[i].getY()<(y+(ballSize/2)))){
            lives--;
            //fill(255,255,0);
            checkCollisions = false;
            
      }
    }
  }
}
