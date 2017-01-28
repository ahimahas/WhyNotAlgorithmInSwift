# DisplaySubViews

## Problem Definition
With given UIView object, print out all its subviews.  
Subview has a empty tap area then its parent view.  

Ex)If input view has a label and a button as a subview, and the label has another view, the expected output will be;  
* inputView
  * label
    * view
  * button

## How it works
I used hash map for caching tap string value and basic format of Pibonacci process which recursively run a method to find out solution. It is sort of Depth First Search problem I guess.  


## Behind Story
It was the first tech interview question by G. It's simple enough question that interviewee has a knowledge about recusion manner and dynamic programming. The proper time to solve this problem should be under 10 minite I guess (Interviewee has only 50 minite to cover more than 3 questions.)  
