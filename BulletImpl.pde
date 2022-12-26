class BulletImpl implements Bullet{
  private float x;
  private float y;
  private float xVel = 0;
  private float yVel = 0;
  private boolean enemy;
  
  public BulletImpl(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void setX(float x){
    this.x = x;
  }
   
  void setY(float y){
    this.y  = y;
  }
  
  void setXVel(float v){
    this.xVel = v;
  }
  
  void setYVel(float v){
    this.yVel = v;
  }
  
  void setIfEnemy(boolean b){
    this.enemy = b;
  }
  
  float getX(){
    return this.x;
  }
  
  float getY(){
    return this.y;
  }
  
  float getXVel(){
    return this.xVel;
  }
  
  float getYVel(){
    return this.yVel;
  }
  
  boolean getIfEnemy(){
    return this.enemy;
  }
  
  void update(){
    this.x += this.xVel;
    this.y += this.yVel;
  }
}
