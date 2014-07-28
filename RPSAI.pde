final int Normal =  0, 
Hover = 1, 
MouseHold = 2, 
Click = 3, 
MouseRelease = 4;


class Control
{
  float x, y, w, h;
  color fg, bg;
  int state;
  Control()
  {
  }
  Control(int x_pos, int y_pos, int Width, int Height, color foreground, color background)
  {
    state = Normal;
    x = x_pos;
    y = y_pos;
    w = Width;
    h = Height;
    fg = foreground;
    bg = background;
  }
  void draw()
  {
    noStroke();
    fill(bg, 192);
    rect(x, y, w, h);
  }
  int hitTest()
  {
    if (mouseX>=x&&mouseX-x<=w)
    {
      if (mouseY>=y&&mouseY-y<=h)
      {
        // Mouse in area
        if (mousePressed)
        {
          if (state != MouseHold)
          {
            state = MouseHold;
            return Click;
          }
          return MouseHold;
        }
        if (state == MouseHold)
        {
          state = Hover;
          return MouseRelease;
        }
        state = Hover;
        return Hover;
      }
    }
    state = Normal;
    return Normal;
  }
}



class Button extends Control
{
  public String title;
  Button()
  {
  }
  Button(String text, int x_pos, int y_pos, int Width, int Height, color textColor, color background)
  {
    title = text;
    x = x_pos;
    y = y_pos;
    w = Width;
    h = Height;
    fg = textColor;
    bg = background;
  }
  void draw()
  {
    noStroke();
    switch(state)
    {
    case Normal:
      fill(bg, 153);
      break;
    case Hover:
      fill(bg, 255);
      break;
    case MouseHold:
      fill(bg, 192);
      break;
    }
    rect(x, y, w, h, 7, 7, 7, 7);
    fill(fg);
    textSize(h/1.5);
    textAlign(CENTER, CENTER);
    text(title, x, y, w, h);
  }
}

class StateButton extends Button
{
  public boolean selected;
  StateButton(boolean Selected, String text, int x_pos, int y_pos, int Width, int Height, color textColor, color background)
  {
    selected = Selected;
    title = text;
    x = x_pos;
    y = y_pos;
    w = Width;
    h = Height;
    fg = textColor;
    bg = background;
  }
  void draw()
  {
    noStroke();
    switch(state)
    {
    case Normal:
      if (selected)
      {
        fill(bg, 255);
      } else
      {
        fill(bg, 153);
      }
      break;
    case Hover:
      fill(bg, 255);
      break;
    case MouseHold:
      fill(bg, 192);
      break;
    }
    rect(x, y, w, h, 7, 7, 7, 7);
    fill(fg);
    textSize(h/1.5);
    textAlign(CENTER, CENTER);
    text(title, x, y, w, h);
  }
  int hitTest()
  {
    int test_result = super.hitTest();
    if (test_result == Click)
    {
      selected = true;
    }
    return test_result;
  }
}



Button rock_b = new Button("Rock", 100, 50, 90, 30, #000000, #66ccff);
Button paper_b = new Button("Paper", 100, 100, 90, 30, #000000, #ABECE2);
Button scissors_b = new Button("Scissors", 100, 150, 90, 30, #000000, #A2F218);


int randnum = 5;
int user = 5;

void setup() {
  size(300, 500);
  
}

void draw() {
  

  background(#ffffff);

  text("Choose your move!", 150, 20);
  text("AI chooses:", 150, 260);
  text("Result:", 150, 400);

  rock_b.draw();
  paper_b.draw();
  scissors_b.draw();

  if (rock_b.hitTest() == Click) {
    user = 0;
    randnum = (int)random(0, 3);
    
  }

  if (paper_b.hitTest() == Click) {
    text("YOU CHOSE PAPER", 150 , 200);
    user = 1;
    randnum = (int)random(0, 3);
  }

  if (scissors_b.hitTest() == Click) {
    text("YOU CHOSE SCISSORS", 150, 200);
    user = 2;
    randnum = (int)random(0, 3);
  }
  
  if (randnum == 0) {
    text("Rock", 150, 300);
    
    switch(user){
      case 0:
        text("You drawed with a computer!", 150, 450);
        break;
      case 1:
        text("You won! Congrats!", 150, 450);
        break;
      case 2:
        text("Sorry! You lost.", 150, 450);
        break;
    }
      
  } 
  
  else if (randnum == 1) {
    text("Paper", 150, 300);
     switch(user){
      case 1:
        text("You drawed with a computer!", 150, 450);
        break;
      case 2:
        text("You won! Congrats!",150, 450);
        break;
      case 0:
        text("Sorry! You lost.", 150, 450);
      break;
    }
  } 
  
  else if (randnum == 2) {
    text("Scissors", 150, 300);
     switch(user){
      case 2:
        text("You drawed with a computer!", 150, 450);
        break;
      case 0:
        text("You won! Congrats!", 150, 450);
        break;
      case 1:
        text("Sorry! You lost.", 150, 450);
      break;
    }
  }

switch(user){
  case 0:
     text("YOU CHOSE ROCK", 150, 210);
     break;
  case 1:
    text("YOU CHOSE PAPER", 150, 210);
    break;
  case 2:
    text("YOU CHOSE SCISSORS", 150, 210);
    break;
}
    


}

