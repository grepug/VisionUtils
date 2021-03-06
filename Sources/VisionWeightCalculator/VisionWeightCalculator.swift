//
//  VisionWeightCalculator.swift
//
//
//  Created by Kai on 2022/3/18.
//

import Foundation

public protocol WeightCalculatorForGoal {
    var usingWeights: Bool { get set }
    var weightIndicator: WeightIndicator { get set }
    
    // MARK: ⚠️ 需要优化数组
    func keyResultObjects() -> [WeightCalculatorForKeyResult]
}

public protocol WeightCalculatorForCycle {
    var usingWeights: Bool { get set }
    
    // MARK: ⚠️ 需要优化数组
    func goalObjects() -> [WeightCalculatorForGoal]
}

public extension WeightCalculatorForCycle {
    var progress: Double {
        progressBefore(nil)
    }
    
    func progressBefore(_ date: Date?) -> Double {
        goalObjects().reduce(into: 0) {
            $0 += $1.progress(in: self, before: date)
        }
    }
    
    fileprivate var totalWeightIndicatorOfGoals: Double {
        goalObjects().reduce(into: 0) {
            $0 += $1.weightIndicator.value
        }
    }
    
    func progressPercentString(signed: Bool = false) -> String {
        (progress * 100).toString(fixedAndDroppingZeros: 2) + (signed ? "%" : "")
    }
}

public extension WeightCalculatorForGoal {
    fileprivate var totalWeightIndicatorOfKRs: Double {
        keyResultObjects().reduce(into: 0.0) {
            $0 += $1.weightIndicator.value
        }
    }
    
    func progress(in cycle: WeightCalculatorForCycle, before date: Date? = nil) -> Double {
        let weightInCycle: Double
        
        if cycle.usingWeights {
            weightInCycle = weightIndicator.value / cycle.totalWeightIndicatorOfGoals
        } else {
            weightInCycle = 1 / Double(cycle.goalObjects().count)
        }
        
        return progressBefore(date) * weightInCycle
    }
    
    var progress: Double {
        progressBefore(nil)
    }
    
    func progressBefore(_ date: Date?) -> Double {
        let keyResults = keyResultObjects()
        
        return keyResults.reduce(into: 0) {
            $0 += $1.progress(in: self, before: date)
        }
    }
    
    func progressPercentString(signed: Bool = false) -> String {
        (progress * 100).toString(fixedAndDroppingZeros: 2) + (signed ? "%" : "")
    }
}

public extension WeightCalculatorForKeyResult {
    func progress(in goal: WeightCalculatorForGoal, before date: Date?) -> Double {
        let weightInGoal: Double
        
        if goal.usingWeights {
            weightInGoal = weightIndicator.value / goal.totalWeightIndicatorOfKRs
        } else {
            weightInGoal = 1 / Double(goal.keyResultObjects().count)
        }
        
        return weightInGoal * progressBefore(date)
    }
    
    func progressPercentString(signed: Bool = false) -> String {
        (progress * 100).toString(fixedAndDroppingZeros: 2) + (signed ? "%" : "")
    }
}
