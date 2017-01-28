import Foundation

//! Set sample variables
let sampleMaze: [[Int]] = [
    [0, 0, 0, 0],
    [1, 0, 1, 0],
    [1, 0, 1, 0],
    [1, 0, 0, 0]
]

let startPointRow: Int = 0
let startPointCol: Int = 0

let exitPointRow: Int = 1
let exitPointCol: Int = 3
let expectedShortestPath: Int = 4


//! Implement solution
struct IndexPath: Equatable {
    var row: Int
    var col: Int
    var distance: Int
    
    init(withRow aRow: Int, col aCol: Int) {
        self.init(withRow: aRow, col: aCol, distance: 0)
    }
    
    init(withRow aRow: Int, col aCol: Int, distance aDistance: Int) {
        row = aRow
        col = aCol
        distance = aDistance
    }
    
    static func ==(lhs: IndexPath, rhs: IndexPath) -> Bool {
        return lhs.row == rhs.row && lhs.col == rhs.col
    }
}

func findOutShortestPath(inMaze maze: [[Int]], startPointRow: Int, startPointCol: Int, exitPointRow: Int, exitPointCol: Int) -> Int {
    var rtnDistance: Int = 0
    let queue: Queue<IndexPath> = Queue<IndexPath>()
    
    let mazeRowSize: Int = sampleMaze.count
    let mazeColSize: Int = sampleMaze.first!.count
    
    var isVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: mazeColSize), count: mazeRowSize)
    
    let startIndexPath: IndexPath = IndexPath(withRow: startPointRow, col: startPointCol)
    let existIndexPath: IndexPath = IndexPath(withRow: exitPointRow, col: exitPointCol)
    
    queue.enqueue(value: startIndexPath)
    
    while let indexPath = queue.dequeue() {
        //! boundary check
        if indexPath.row < 0 || indexPath.row >= mazeRowSize || indexPath.col < 0 || indexPath.col >= mazeColSize {
            continue
        }
        
        //! if indexPath is already visited, continue
        if isVisited[indexPath.row][indexPath.col] {
            continue
        }
        
        //! exit from maze
        if indexPath == existIndexPath {
            print("Exit! row: \(indexPath.row), col: \(indexPath.col), distance: \(indexPath.distance)")
            rtnDistance = indexPath.distance
            break
        }
        
        isVisited[indexPath.row][indexPath.col] = true
        
        //! check right
        if indexPath.row + 1 < mazeRowSize && maze[indexPath.row + 1][indexPath.col] != 1 {
            queue.enqueue(value: IndexPath(withRow: indexPath.row + 1, col: indexPath.col, distance: indexPath.distance + 1))
        }
        
        //! check left
        if indexPath.row - 1 >= 0 && maze[indexPath.row - 1][indexPath.col] != 1 {
            queue.enqueue(value: IndexPath(withRow: indexPath.row - 1, col: indexPath.col, distance: indexPath.distance + 1))
        }
        
        //! check down
        if indexPath.col + 1 < mazeColSize && maze[indexPath.row][indexPath.col + 1] != 1 {
            queue.enqueue(value: IndexPath(withRow: indexPath.row, col: indexPath.col + 1, distance: indexPath.distance + 1))
        }
        
        //! check up
        if indexPath.col - 1 >= 0 && maze[indexPath.row][indexPath.col - 1] != 1 {
            queue.enqueue(value: IndexPath(withRow: indexPath.row, col: indexPath.col - 1, distance: indexPath.distance + 1))
        }
    }
    
    return rtnDistance
}


//! Main process starts from here!
let lengthOfPath: Int = findOutShortestPath(inMaze: sampleMaze, startPointRow: startPointRow, startPointCol: startPointCol, exitPointRow: exitPointRow, exitPointCol: exitPointCol)
assert(lengthOfPath == expectedShortestPath)








