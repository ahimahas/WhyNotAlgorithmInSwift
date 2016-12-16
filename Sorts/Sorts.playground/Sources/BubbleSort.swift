//
//  BubbleSort.swift
//  HeadQuarter
//
//  Created by ahimahas on 2016. 12. 16..
//  Copyright © 2016년 MS. All rights reserved.
//

import Foundation

public class BubbleSort {
    public init() {}
    
    public func sort(withItems items: [Int]) -> [Int] {
        var copiedItems: [Int] = items
        
        for i in (0..<copiedItems.count).reversed() {
            for j in 0..<i {
                if copiedItems[j] > copiedItems[j + 1] {
                    swap(left: &copiedItems[j], right:&copiedItems[j + 1])
                }
            }
        }
        
        return copiedItems
    }
    
    // MARK: - Private Methods
    private func swap(left: inout Int, right: inout Int) {
        let temp = left
        left = right
        right = temp
    }
}
