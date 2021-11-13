class Triangle {
   float x;
   float y;
   float width;
   float height;
   
   Triangle(float x_, float y_, float w, float h) {
     x = x_;
     y = y_;
     width = w;
     height = h;
   }
   
   boolean contains(float px, float py) {
     return (px > x && px < x + width  && abs(py - y - height/2)/(px - x) < height / (2 * width));
   }
}
