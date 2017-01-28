import Foundation

let legos: [Int] = [1, 3, 4, 6]
let totalHeight: Int = 10
var map: [[Int]] = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: totalHeight + 1), count: legos.count)

//! return number of ways to reach N height lego
func waysToReach(toTargetHeight targetHeight: Int) -> Int {
    for legoIndex in 0..<legos.count {
        let lego: Int = legos[legoIndex]
        for height in lego...targetHeight {
            let ways = waysToReach(toTargetHeight: height, withLegoIndex: legoIndex)
            if map[legoIndex][height] == 0 {
                map[legoIndex][height] = ways
            }
        }
    }
    
    return map[legos.count - 1][targetHeight]
}

//! recursively runnasble method
func waysToReach(toTargetHeight height: Int, withLegoIndex legoIndex: Int) -> Int {
    if legoIndex < 0 || height < 0 {
        return 0
    }
    
    if height == 0 {
        return 1
    }
    
    if map[legoIndex][height] != 0 {
        return map[legoIndex][height]
    }
    
    return waysToReach(toTargetHeight: height, withLegoIndex: legoIndex - 1) + waysToReach(toTargetHeight: height - legos[legoIndex], withLegoIndex: legoIndex)
}


print(waysToReach(toTargetHeight: totalHeight))

