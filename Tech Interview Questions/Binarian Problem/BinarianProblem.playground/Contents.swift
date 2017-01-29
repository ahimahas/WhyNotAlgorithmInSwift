import Foundation

//! added space complexity: N
var cacheMap: [Int: Int] = [:]

func getBinarianValue(withInput input: Int) -> Int{
    if let cachedValue = cacheMap[input] {
        return cachedValue
    }
    
    if input == 0 {
        return 1
    }
    
    let binarianValue: Int = getBinarianValue(withInput: input - 1) * 2
    cacheMap[input] = binarianValue
    
    return binarianValue
}

func findShortestBinarianListNumber(withInputs inputs: [Int]) -> Int {
    var totalValues: Int = 0

    //! added time complexity: N
    for input in inputs {
        totalValues += getBinarianValue(withInput: input)
    }

    //! added time complexity: logN
    var shortestBinarianListNumber: Int = 0
    while true {
        shortestBinarianListNumber += 1
        
        //! find index
        var index: Int = 0
        while true {
            if getBinarianValue(withInput: index + 1) > totalValues {
                break
            }
            index += 1
        }
        
        //! subtract value
        totalValues -= getBinarianValue(withInput: index)
        
        //! check exit condition
        if totalValues == 0 {
            break
        }
    }
    
    return shortestBinarianListNumber
}


//! Main process starts from here!
var inputs: [Int] = [1, 0, 2, 0, 0, 2]
var expectedOutput: Int = 3

assert(findShortestBinarianListNumber(withInputs: inputs) == expectedOutput)


inputs = [0]
expectedOutput = 1

assert(findShortestBinarianListNumber(withInputs: inputs) == expectedOutput)


inputs = [0]
expectedOutput = 1

assert(findShortestBinarianListNumber(withInputs: inputs) == expectedOutput)


inputs = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
expectedOutput = 11

assert(findShortestBinarianListNumber(withInputs: inputs) == expectedOutput)


inputs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10]
expectedOutput = 3

assert(findShortestBinarianListNumber(withInputs: inputs) == expectedOutput)





