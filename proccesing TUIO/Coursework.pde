   //<>// //<>//
import TUIO.*;
import java.util.*;
TuioProcessing tuioClient;

float obj_size = 60;
int level = 0;
List<Hazard> HazardList = new ArrayList<Hazard>();
float origPosid_10 = 0;
float orignPosid_0 = 0;



void setup()
{
  

  size(600, 500); //600 / 500
  textSize(30);
  if(level == 1)
  {
    //Hazard H1 = new Hazard("rock1",500,50,50,50);  //hazard class name , xpos, ypos, width, height
    Hazard H2 = new Hazard("rock2",100,450,50,50);
    Hazard H3 = new Hazard("rock3",250,450,50,50);
   // HazardList.add(H1);
    HazardList.add(H2);
    HazardList.add(H3);
    println(HazardList.get(0));
  }
  if (level == 2)
  {
    Hazard H1 = new Hazard("rock1",250,150,250,250);
   HazardList.add(H1);
    Hazard H2 = new Hazard("rock2",300,300,50,50);
    Hazard H3 = new Hazard("rock3",200,450,50,50);
    HazardList.add(H2);
    HazardList.add(H3);
  }

  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  // an instance of the TuioProcessing
  // since we ad "this" class as an argument the TuioClient expects
  // an implementation of the TUIO callback methods (see below)
  tuioClient  = new TuioProcessing(this);
}

void draw()
{
  
  background(255);
    if(level == 0)
  {
    fill(0);
    text("Welcome in the Mars Colony",300,200);
    text("To start place object 0 on Board" , 300,300);
  ArrayList<TuioObject> tuioObjectList = new ArrayList<TuioObject>();
  
 
  tuioObjectList.addAll(tuioClient.getTuioObjectList());
  for (TuioObject tobj : tuioObjectList){
  
  if(tobj.getSymbolID() == 0 ){
  level = level + 1 ;
  }
  
  
  }
  }
  
  
  else
  {
  
  
  if (level == 1)
  {
    fill(0,0,255);
    pushMatrix();
    rect(0,0,150,150);
    fill(100,255,0);
    rect(500,0,150,150);
    popMatrix();
    
  }
  
  if(level == 2)
  {
     fill(0,0,255);
    pushMatrix();
    rect(0,0,150,150);
    fill(100,255,0);
    rect(500,250,150,150);
    popMatrix();
    
  }
  

  for(int i = 0 ; i < HazardList.size() ; i++)
  {
    fill(255,0,0);
    pushMatrix();
    rect(HazardList.get(i).x,HazardList.get(i).y,HazardList.get(i).width,HazardList.get(i).height);
    translate(HazardList.get(i).x,HazardList.get(i).y);
    fill(255);
    textSize(14);
    text(HazardList.get(i).name,0,0);
    popMatrix();
    
    
  }
  
  
  ArrayList<TuioObject> tuioObjectList = new ArrayList<TuioObject>();
  List<Pipe> PipeList = new ArrayList<Pipe>();
  // get all the tuio objects detected and sort by X position
  tuioObjectList.addAll(tuioClient.getTuioObjectList());
  Collections.sort(tuioObjectList, comp);
  for(int i = 0 ; i < tuioObjectList.size() ; i++)
  {
    int id_pipe = tuioObjectList.get(i).getSymbolID();
    float x_pipe = tuioObjectList.get(i).getScreenX(width);
    float y_pipe = tuioObjectList.get(i).getScreenY(height);
    float ang_pipe = tuioObjectList.get(i).getAngle();
    switch(id_pipe)
    {
      case 1 : 
      PipeList.add(new Pipe(id_pipe,100,1,false,x_pipe,y_pipe,ang_pipe));
      break;
      case 2 :
      PipeList.add(new Pipe(id_pipe,100,1,false,x_pipe,y_pipe,ang_pipe));
      break;
      case 3 :
      PipeList.add(new Pipe(id_pipe,100,1,false,x_pipe,y_pipe,ang_pipe));
     break;
      case 4 :
      PipeList.add(new Pipe(id_pipe,100,2,false,x_pipe,y_pipe,ang_pipe));
      break;
      case 5 :
      PipeList.add(new Pipe(id_pipe,100,2,false,x_pipe,y_pipe,ang_pipe));
      break;
      case 6 : 
      PipeList.add(new Pipe(id_pipe,100,2,false,x_pipe,y_pipe,ang_pipe));
      break;
      case 7 : 
      PipeList.add(new Pipe(id_pipe,100,3,false,x_pipe,y_pipe,ang_pipe));
      break;
      case 8 : 
      PipeList.add(new Pipe(id_pipe,100,3,false,x_pipe,y_pipe,ang_pipe));
      break;
      case 9 : 
      PipeList.add(new Pipe(id_pipe,100,3,false,x_pipe,y_pipe,ang_pipe));
      break;
    
    
    
    
    }
    
    
  }
  //Collections.sort(tuioObjectList, compY);
  Collections.sort(tuioObjectList, comp);
  
 
  
    
    /*   fill(50,255,100);
         pushMatrix(); 
         translate(tobj.getScreenX(width),tobj.getScreenY(height));
         rect(0, 0, obj_size,obj_size, 5, 5, 5, 5);
         fill(255);
      
         float id = degrees(tobj.getAngle());
   
          text(id, 0, -0.15*textAscent());
          popMatrix(); */
  
  
  
    pushMatrix();
  fill(0);
 
  text(level,250,50);
  popMatrix();
  
  
  
  // Draw objects on the screen

   for (TuioObject tobj : tuioObjectList){
    int id_pipe = tobj.getSymbolID();
     
      
     println(tuioObjectList.size());
     println(PipeList.size());
  
    if((tobj.getScreenX(width) - obj_size <= 100) && (tobj.getScreenY(height) - obj_size <= 50))
    {
        
    
    
     float id = degrees(tobj.getAngle());
   
    
    for(int i = 0 ; i < PipeList.size(); i++)
    {
      if(tobj.getSymbolID() == PipeList.get(i).id)
      {
        PipeList.get(i).is_good = true;
      
      }
    
    }
    
    }
    
    
    else{  
    
    if(tuioObjectList.size() > 1 && tobj.getSymbolID() != 10 && PipeList.size() > 1)
    {  Pipe tobj2 = PipeList.get(PipeList.size()-2);
       
    
       if(tobj2.Xpos +100  >= tobj.getScreenX(width)) // && (PipeList.get(PipeList.size()-2).is_good)
       {
         
        
         if(  (tobj2.id == 1) || (tobj2.id == 2) || (tobj2.id == 3)  )
           { 
             if((tobj.getSymbolID() == 1) || (tobj.getSymbolID() == 2) || (tobj.getSymbolID() == 3))
             {
              
               if( (((degrees(tobj2.Angle) - 10 <= degrees(tobj.getAngle())) && ((degrees(tobj2.Angle)) + 10 >= degrees(tobj.getAngle()))) || ((((degrees(tobj2.Angle)+180)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 180)%360) + 10 >= degrees(tobj.getAngle())))     )) 
             // (( (degrees(tobj2.Angle)+180%360) - 10 <= degrees(tobj.getAngle()) ) && ((degrees(tobj2.Angle)) + 10 >= degrees(tobj.getAngle())))
              
           {
         
          
           for(int i = 0 ; i < PipeList.size(); i++)
    {
      if(tobj.getSymbolID() == PipeList.get(i).id)
      {
        PipeList.get(i).is_good = true;
        
    }
    
    }
          
           }
             }
             
             else
             {
               if((tobj.getSymbolID() == 4) || (tobj.getSymbolID() == 5) || (tobj.getSymbolID() == 6))
             {
                if(( ((((degrees(tobj2.Angle)+90)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 90)%360) + 10 >= degrees(tobj.getAngle()))) || ((((degrees(tobj2.Angle)+180)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 180)%360) + 10 >= degrees(tobj.getAngle()))) )) 
             
           {
      
           for(int i = 0 ; i < PipeList.size(); i++)
        {
      if(tobj.getSymbolID() == PipeList.get(i).id)
        {
        PipeList.get(i).is_good = true;
      
          }
        
    }
          
          
          
           }
             }
             
             else
             {
                 if((tobj.getSymbolID() == 7) || (tobj.getSymbolID() == 8) || (tobj.getSymbolID() == 9))
             {
               if(( ((((degrees(tobj2.Angle)+180)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 180)%360) + 10 >= degrees(tobj.getAngle()))) || ((((degrees(tobj2.Angle)+270)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 270)%360) + 10 >= degrees(tobj.getAngle()))) )) 
             
             
           {

    
 
           for(int i = 0 ; i < PipeList.size(); i++)
    {
      if(tobj.getSymbolID() == PipeList.get(i).id)
      {
        PipeList.get(i).is_good = true;
      
      }
    
    }
           }
             }
             }
             }
     
       }
       else
         { 
         if (   (tobj2.id == 4) || (tobj2.id == 5) || (tobj2.id == 6) )
           {
                if((tobj.getSymbolID() == 1) || (tobj.getSymbolID() == 2) || (tobj.getSymbolID() == 3))
             {
              if(( (((degrees(tobj2.Angle) - 10 <= degrees(tobj.getAngle())) && ((degrees(tobj2.Angle)) + 10 >= degrees(tobj.getAngle())))) || (  ((degrees(tobj.getAngle())-degrees(10) <= (degrees(tobj2.Angle +degrees(180))%360 ))) &&    ((degrees(tobj.getAngle())+degrees(10) >= (degrees(tobj2.Angle +degrees(180))%360 ))))       )) 
             //((degrees(tobj.getAngle()) >= 344) || (degrees(tobj.getAngle()) <= 16))  || ((degrees(tobj.getAngle()) >= 74) && (degrees(tobj.getAngle()) <= 106))
           {
         
           for(int i = 0 ; i < PipeList.size(); i++)
    {
      if(tobj.getSymbolID() == PipeList.get(i).id)
      {
        PipeList.get(i).is_good = true;
      
      }
    
    }
           }
             }
             
             else
             {
               if((tobj.getSymbolID() == 4) || (tobj.getSymbolID() == 5) || (tobj.getSymbolID() == 6))
             {
               if( (((degrees(tobj.getAngle())-degrees(10) <= (degrees(tobj2.Angle+degrees(90))%360 ))  && ((degrees(tobj.getAngle())+degrees(10) >= (degrees(tobj2.Angle+degrees(90))%360 )))) || ((((degrees(tobj2.Angle)+180)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 180)%360) + 10 >= degrees(tobj.getAngle()))) )) 
             
           {
        
           for(int i = 0 ; i < PipeList.size(); i++)
    {
      if(tobj.getSymbolID() == PipeList.get(i).id)
      {
        PipeList.get(i).is_good = true;
      
      }
    
    }
           }
             }
             
             else
             {
                 if((tobj.getSymbolID() == 7) || (tobj.getSymbolID() == 8) || (tobj.getSymbolID() == 9))
             {
               if(( ((((degrees(tobj2.Angle)+90)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 90)%360) + 10 >= degrees(tobj.getAngle()))) || ((degrees(tobj.getAngle())-degrees(10) <= (degrees(tobj2.Angle +degrees(180))%360 ))))) 
             
           {
        
           for(int i = 0 ; i < PipeList.size(); i++)
    {
      if(tobj.getSymbolID() == PipeList.get(i).id)
      {
        PipeList.get(i).is_good = true;
      
      }
    
    }
           }
             }
             }
             }
     
           }
   
       else
       {
        if (   (tobj2.id == 7) || (tobj2.id == 8) || (tobj2.id == 9) )
       {
         if((tobj.getSymbolID() == 1) || (tobj.getSymbolID() == 2) || (tobj.getSymbolID() == 3))
             {
 if( ((((degrees(tobj2.Angle) - 10 <= degrees(tobj.getAngle())) && ((degrees(tobj2.Angle)) + 10 >= degrees(tobj.getAngle())))) || ((((degrees(tobj2.Angle)+180)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 180)%360) + 10 >= degrees(tobj.getAngle())))       )) 
             //((degrees(tobj.getAngle()) >= 344) || (degrees(tobj.getAngle()) <= 16))  || ((degrees(tobj.getAngle()) >= 74) && (degrees(tobj.getAngle()) <= 106))
           {
         
           for(int i = 0 ; i < PipeList.size(); i++)
    {
      if(tobj.getSymbolID() == PipeList.get(i).id)
      {
        PipeList.get(i).is_good = true;
      
      }
    
    }
           }
             }
             
             else
             {
               if((tobj.getSymbolID() == 4) || (tobj.getSymbolID() == 5) || (tobj.getSymbolID() == 6))
             {
               if(( ((((degrees(tobj2.Angle)+90)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 90)%360) + 10 >= degrees(tobj.getAngle()))) || ((degrees(tobj.getAngle())-degrees(10) <= (degrees(tobj2.Angle +degrees(180))%360 ))))) 
             
           {
       
           for(int i = 0 ; i < PipeList.size(); i++)
    {
      if(tobj.getSymbolID() == PipeList.get(i).id)
      {
        PipeList.get(i).is_good = true;
      
      }
    
    }
           }
             }
             
             else
             {
                 if((tobj.getSymbolID() == 7) || (tobj.getSymbolID() == 8) || (tobj.getSymbolID() == 9))
             {
                if(( ((((degrees(tobj2.Angle)+180)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 180)%360) + 10 >= degrees(tobj.getAngle()))) || ((((degrees(tobj2.Angle)+270)%360) - 10 <= degrees(tobj.getAngle())) && (((degrees(tobj2.Angle) + 270)%360) + 10 >= degrees(tobj.getAngle()))) )) 
             
           {
         
           for(int i = 0 ; i < PipeList.size(); i++)
    {
      if(tobj.getSymbolID() == PipeList.get(i).id)
      {
        PipeList.get(i).is_good = true;
      
      }
    
    }
           }
             }
             }
             }
     
       }
       
       }
       
       }
    
    
   for(int z = 0 ; z < HazardList.size() ; z++)
    {
      if((tobj.getScreenX(width)+ obj_size >= HazardList.get(z).width) && (tobj.getScreenY(height) + obj_size >= HazardList.get(z).height))
      {
             for(int i = 0 ; i < PipeList.size(); i++)
    {
      if(tobj.getSymbolID() == PipeList.get(i).id)
      {
        PipeList.get(i).is_good = false;
      
      }
    
    }
        
      }
    
    
    } 
        
   
        
        
     


    }
    
    
    
    
    
  
    
 
      
    }
    
  
    
    }
    
    if(tobj.getSymbolID() == 10 && degrees(tobj.getAngle()) >= 90)
    {
      if(level == 1){
        
    if((tobj.getScreenX(width)+ 200 >= 550) && (tobj.getScreenY(height) < 300))
        {
         
      for(int i = 0 ; i < PipeList.size() ; i++)
        {
          int costTotal = 0; 
          int countWrong = 0;
          int countId10 = 0;
          if(!PipeList.get(i).is_good)
          {
             countWrong = countWrong + 1; 
          }
          if(countWrong == 0)
          {
            for(int y = 0 ; y < PipeList.size() ; y++)
            {
             costTotal = costTotal + PipeList.get(y).cost ;
              
            
            }
               pushMatrix();
              fill(0);
              text(tuioObjectList.size() ,200,400);
              text(costTotal,250,150);
              text("Please remove valve from board",300,150);
              popMatrix();
              for(int y = 0 ; y < tuioObjectList.size() ; y++)
              {
                
                {
                  if(tuioObjectList.get(y).getSymbolID() == 10)
                  {
                    countId10 = countId10 + 1;
                    
                  }
                  
                }
               
              
              
              
              }
              if(countId10 == 0)
              {
               level = level + 1;
              }
          
          }  
      }
        }
      }
      if(level == 2)
      {
      if((tobj.getScreenX(width)+ 200 >= 550) && (tobj.getScreenY(height) > 300))
        {
         
        for(int i = 0 ; i < PipeList.size() ; i++)
        {
          int costTotal = 0; 
          int countWrong = 0;
          int countId10 = 0;
          if(!PipeList.get(i).is_good)
          {
             countWrong = countWrong + 1; 
          }
          if(countWrong == 0)
          {
            for(int y = 0 ; y < PipeList.size() ; y++)
            {
             costTotal = costTotal + PipeList.get(y).cost ;
              
            
            }
               pushMatrix();
              fill(0);
              text(tuioObjectList.size() ,200,400);
              text(costTotal,250,150);
              text("Please remove valve from board",300,150);
              popMatrix();
              for(int y = 0 ; y < tuioObjectList.size() ; y++)
              {
                
                {
                  if(tuioObjectList.get(y).getSymbolID() == 10)
                  {
                    countId10 = countId10 + 1;
                    
                  }
                  
                }
               
              
              
              
              }
              if(countId10 == 0)
              {
               level = level + 1;
              }
          
          }  
      }
        }
      
      
      
      }
      
   }
    
  
   for (int i = 0 ; i < PipeList.size() ; i++)
     {
        if(PipeList.get(i).is_good)
        {
             fill(50,255,100);
         pushMatrix(); 
         translate(PipeList.get(i).Xpos ,PipeList.get(i).Ypos);
         
         if(PipeList.get(i).type == 1)
         {
            rotate(PipeList.get(i).Angle);
           rect(0, 0, 50,100, 5, 5, 5, 5);
          
         
         }
         if(PipeList.get(i).type == 2)
         {
            rotate(PipeList.get(i).Angle);
           rect(0, 0, 50,100, 5, 5, 5, 5);
           rect(25, -25,100,50,5,5,5,5);
            
         }
         
         if(PipeList.get(i).type ==3)
         {
            rotate(PipeList.get(i).Angle);
            rect(0, 0, 50,100, 5, 5, 5, 5);
           rect(-25, -25,100,50,5,5,5,5);
            
         }
       //  rect(0, 0, obj_size,obj_size, 5, 5, 5, 5);
         fill(255);
    
         float id = degrees((PipeList.get(i).Angle));
   
          text(id, 0, -0.15*textAscent());
               popMatrix(); 
        
        
          println("Good Pipe " + PipeList.get(i).id);
        //  println("index size-2" + PipeList.get(PipeList.size()-2));
          println("index size-1 " + PipeList.get(PipeList.size()-1).id);
          println("index 0" + PipeList.get(0).id);
          if(tuioObjectList.size() > 1)
          {
             println("index2 0" + tuioObjectList.get(tuioObjectList.size()-2).getSymbolID());
          }
        }
        
        
        else
        {
            fill(255,100,100);
         pushMatrix(); 
         translate(PipeList.get(i).Xpos ,PipeList.get(i).Ypos);
         
         if(PipeList.get(i).type == 1)
         {
            rotate(PipeList.get(i).Angle);
           rect(0, 0, 50,100, 5, 5, 5, 5);
           
         
         }
         if(PipeList.get(i).type == 2)
         {
            rotate(PipeList.get(i).Angle);
         
           rect(0, 0, 50,100, 5, 5, 5, 5);
           rect(25, -25,100,50,5,5,5,5);
          
          
         }
         
         if(PipeList.get(i).type ==3)
         {
          
            rotate(PipeList.get(i).Angle);
           rect(0, 0, 50,100, 5, 5, 5, 5);
           rect(-25, -25,100,50,5,5,5,5);
         }
       //  rect(0, 0, obj_size,obj_size, 5, 5, 5, 5);
         fill(255);
    
         float id = degrees((PipeList.get(i).Angle));
   
          text(id, 0, -0.15*textAscent());
            
         popMatrix(); 
       
       //   println("index size-2 " + PipeList.get(PipeList.size()-2).id);
       //   println("index size-1 " + PipeList.get(PipeList.size()-1).id);
       //   println("index 0 " + PipeList.get(0).id);
       //   println("index2 0" + tuioObjectList.get(0).getSymbolID());
          
        }
     }
      
     println("PipeList size : " + PipeList.size());

     
  pushMatrix();
  fill(0);
  text(tuioObjectList.size() ,200,400);
  text(level,250,50);
  
  if(tuioObjectList.size() > 0)
  {
  textSize(12);
  text(tuioObjectList.get(tuioObjectList.size() - 1).getSymbolID(),200,400);
   text(degrees(tuioObjectList.get(tuioObjectList.size() - 1).getAngle()),200,450);
  }
  if(tuioObjectList.size() > 1)
  {
    textSize(12);
  text(tuioObjectList.get(tuioObjectList.size() - 2).getSymbolID(),300,400);
  text(degrees(tuioObjectList.get(tuioObjectList.size() - 2).getAngle()),300,450);
  }
  popMatrix();


     if(tobj.getSymbolID() == 10 )
    {
      fill(100,100,100);
      pushMatrix();
      translate(tobj.getScreenX(width),tobj.getScreenY(height));
      ellipse(0,0,obj_size * 1.5,obj_size * 1.5);
      fill(0);
      text(" To check turn valve",0,0);
      popMatrix();
      
    }


}  

    

  }

}



Comparator<TuioObject> comp = new Comparator<TuioObject>() {
  // Comparator object to compare two TuioObjects on the basis of their x position
  // Returns -1 if o1 left of o2; 0 if they have same x pos; 1 if o1 right of o2
  
  // allows us to sort objects left-to-right.
  public int compare(TuioObject o1, TuioObject o2) {
    if (o1.getX()<o2.getX()) { return -1;}  
    else if (o1.getX()>o2.getX()) { return 1; }  
    else { return 0; }
  }
};

Comparator<TuioObject> compY = new Comparator<TuioObject>(){

  public int compare(TuioObject o1, TuioObject o2)
{  if(o1.getY()<o2.getY()) { return -1;}
else if (o1.getY()>o2.getY()) {return 1;}
else {return 0;}

}
};



// these callback methods are called whenever a TUIO event occurs

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
}