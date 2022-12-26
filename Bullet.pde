interface Bullet{
  
  void setX(float x);
  
  void setY(float y);
  
  void setXVel(float v);
  
  void setYVel(float v);
  
  void setIfEnemy(boolean b);
  
  float getX();
  
  float getY();
  
  float getXVel();
  
  float getYVel();
  
  boolean getIfEnemy();
  
  void update();

}
