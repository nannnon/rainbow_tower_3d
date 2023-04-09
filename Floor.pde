class Floor
{
  static final float pillarHeight = 5;
  static final float boxHeight = 20;
  
  float _radius;
  float _y;
  
  Floor(float radius, float y)
  {
    _radius = radius;
    _y = y;
  }
  
  void draw()
  {
    // 四角柱
    final int boxNum = round(2 * PI * _radius / 30);
    for (int i = 0; i < boxNum; ++i)
    {
      pushMatrix();
      
      float r = i * 2 * PI / boxNum;
      float x = _radius * cos(r);
      float z = _radius * sin(r);
      translate(x, _y - boxHeight / 2, z);
      
      noStroke();
      colorMode(HSB, 1);
      fill(float(i) / boxNum, 1, 1);
      box(10, boxHeight, 10);
      
      popMatrix();
    }
    
    // 円盤
    {
      pushMatrix();
      
      translate(0, _y - boxHeight - pillarHeight / 2, 0);
      
      colorMode(RGB, 1);
      fill(1);
      noStroke();
      
      pillar(pillarHeight, _radius, _radius);
      
      popMatrix();
    }
  }
}
