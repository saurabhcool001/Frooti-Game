class Bubble extends StopWatchTimer
{
  int bubbleX, bubbleY, bubbleWidth, bubbleHeight;    //  Some variables to hold information about the bubble
  //int j = 120;
  
  
  
  Bubble ( int bX, int bY, int bW, int bH )           //  The class constructor- sets the values when a new bubble object is made
  {
    bubbleX = bX;
    bubbleY = bY;
    bubbleWidth = bW;
    bubbleHeight = bH;
  }
  
  int update()                                //   The Bubble update function
  {
    int movementAmount;                      //  Create and set a variable to hold the amount of white pixels detected in the area where the bubble is
    movementAmount = 0;

    for ( int y = bubbleY; y < (bubbleY + (bubbleHeight-1)); y++ ) {                //  For loop that cycles through all of the pixels in the area the bubble occupies
      for ( int x = bubbleX; x < (bubbleX + (bubbleWidth-1)); x++ ) {
  //println("new : " +brightness(movementImg.pixels[(x/2) + ((y/2) * width/2)]));
        if ( x < width && x > 0 && y < height && y > 0 ) {             //  If the current pixel is within the screen bondaries
          if (brightness(movementImg.pixels[(x/2) + ((y/2) * width/2)]) > j)    //  and if the brightness is above 127 (in this case, if it is white)
          {
           movementAmount++;                                                     //  Add 1 to the movementAmount variable.
          }
        }
      }
    }

    if (movementAmount > 80)                                                   //  If more than 5 pixels of movement are detected in the bubble area
    {
     
      
      
     poppedBubbles++;                                                        //  Add 1 to the variable that holds the number of popped bubbles
     image(img2,bubbleX,bubbleY);
          
     return 1;

    }
    else {                                                                 //  If less than 5 pixels of movement are detected,
      bubbleY += 5;                                                      //  increase the y position of the bubble so that it falls down

      if (bubbleY > height)                                               //  If the bubble has dropped off of the bottom of the screen
      { 

        return 1;
      }                                                                    //  Return '1' so that the bubble object is destroyed
      
      if((40-sw.second())<35){
        bubbleY+=7;
      }
      if((40-sw.second()<30)){
        bubbleY-=5;
      }
      if((40-sw.second())<25){
        bubbleY+=10;
      }
      if(((40-sw.second())<20)){
        bubbleY-=8;
      }
      if((40-sw.second())<15){
        bubbleY+=11;
      }
      if((40-sw.second())<10){
        bubbleY+=5;
      }
      
    
      image(mangoPNG, bubbleX, bubbleY);    //  Draws the bubble to the screen
      
      return 0;                              //  Returns '0' so that the bubble isn't destroyed
    }
  }


  int update1()                          //  The Bubble update function
  {
    int movementAmount;          //  Create and set a variable to hold the amount of white pixels detected in the area where the bubble is
    movementAmount = 0;

    for ( int y = bubbleY; y < (bubbleY + (bubbleHeight-1)); y++ ) {    //  For loop that cycles through all of the pixels in the area the bubble occupies
      for ( int x = bubbleX; x < (bubbleX + (bubbleWidth-1)); x++ ) {

        if ( x < width && x > 0 && y < height && y > 0 ) {             //  If the current pixel is within the screen bondaries
          if (brightness(movementImg.pixels[(x/2) + ((y/2) * width/2)]) > j)  //  and if the brightness is above 127 (in this case, if it is white)
          {
           movementAmount++;                                         //  Add 1 to the movementAmount variable.
          }
        }
      }
    }

    if (movementAmount > 80)               //  If more than 5 pixels of movement are detected in the bubble area
    {
      poppedBubbles++;                    //  Add 1 to the variable that holds the number of popped bubbles
    
      image(img2,bubbleX,bubbleY);
     
      return 1;                           //  Return 1 so that the bubble object is destroyed
    }
    else {                                 //  If less than 5 pixels of movement are detected,
      bubbleY += 9;                      //  increase the y position of the bubble so that it falls down


      if (bubbleY > height)               //  If the bubble has dropped off of the bottom of the screen
      { 


        return 1;
      }                                   //  Return '1' so that the bubble object is destroyed

      if((40-sw.second())<35){
        
        bubbleY+=10;
      }
      if((40-sw.second()<30)){
        bubbleY+=12;
      }      
      if((40-sw.second()<25)){
        bubbleY-=9;
      }
      if((40-sw.second()<20)){
        bubbleY-=5;
      }
      if((40-sw.second()<15)){
        bubbleY-=7;
      }
      if((40-sw.second())<10){
        bubbleY+=5;
      }
      

      image(mangoPNG1, bubbleX, bubbleY);    //  Draws the bubble to the screen

      return 0;                              //  Returns '0' so that the bubble isn't destroyed
    }
  }
  
  int update2()                                //   The Bubble update function
  {
    int movementAmount;                      //  Create and set a variable to hold the amount of white pixels detected in the area where the bubble is
    movementAmount = 0;

    for ( int y = bubbleY; y < (bubbleY + (bubbleHeight-1)); y++ ) {                //  For loop that cycles through all of the pixels in the area the bubble occupies
      for ( int x = bubbleX; x < (bubbleX + (bubbleWidth-1)); x++ ) {

        if ( x < width && x > 0 && y < height && y > 0 ) {                         //  If the current pixel is within the screen bondaries
          if (brightness(movementImg.pixels[(x/2) + ((y/2) * width/2)]) > j)    //  and if the brightness is above 127 (in this case, if it is white)
         {
           movementAmount++;                                                     //  Add 1 to the movementAmount variable.
         }
        }
      }
    }

    if (movementAmount > 80)                                                   //  If more than 5 pixels of movement are detected in the bubble area
    {
     
      
      
    // poppedBubbles++;                                                        //  Add 1 to the variable that holds the number of popped bubbles
     image(img2,bubbleX,bubbleY);
          
     return 1;

    }
    else {                                                                 //  If less than 5 pixels of movement are detected,
     bubbleY +=15 ;                                                      //  increase the y position of the bubble so that it falls down

      if (bubbleY > height)                                               //  If the bubble has dropped off of the bottom of the screen
      { 

        return 1;
      }                                                                    //  Return '1' so that the bubble object is destroyed
    
      
      image(mangoPNG2, bubbleX, bubbleY);    //  Draws the bubble to the screen
      
      return 0;                              //  Returns '0' so that the bubble isn't destroyed
    }
  }
  

  void stopBubbles() {
    bubbles.clear();
  }
}