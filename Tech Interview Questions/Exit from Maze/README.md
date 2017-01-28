# Exit from Maze

## Problem Definition
There is a maze made up by 2d array. It contains one of two integer values 0 which means can pass throughable, and 1 which mean can not work through.  
The distance between one point to neighbor point is always 1.  

Let's assume that start point is always 0, 0 and with given exit point, find out shortest path to that exit point.  
Here is an example;  

```
Maze: let sampleMaze: [[Int]] = [  
  [0, 0, 0, 0],  
  [1, 0, 1, 0],  
  [1, 0, 1, 0],  
  [1, 0, 0, 0]  
]  

Start Point: 0, 0
Exit Point: 1, 3
Expected Result: 4
```

## How it works
Shortest path problem is one of the most famous topic in tech interview. In this case, I chose to use the manner of BFS with boolean arrays which contains visited value. Since distance between two array positions is always one, whenever I find the exit point at the first time in BFS, that is the shortest path.  

For convenience, I made a struct named IndexPath which stores row, column position and distance from starting point. And I also used a general data structure, Queue to store that IndexPath.  


## Behind Story
This algorithm problem comes from on-line coding test by e-commerce company, A.  There are two algorithm problems needed to be solved for 75 minite.  
