//
//  File.swift
//  
//
//  Created by Kai on 2022/3/24.
//

import Foundation

public protocol WeightCalculatorForKeyResult {
    var weightIndicator: WeightIndicator { get set }
    
    var initValue: Double { get }
    var targetValue: Double { get }
    func currentValueBefore(_ date: Date?) -> Double
}

public extension WeightCalculatorForKeyResult {
    var direction: KeyResultValueDirection {
        if initValue > targetValue {
            return .down
        }
        
        return .up
    }
    
    var displayCurrentValue: String {
        currentValue.toString(fixedAndDroppingZeros: 1)
    }
    
    var displayTargetValue: String {
        targetValue.toString(fixedAndDroppingZeros: 1)
    }
    
    /// 实际上是 progress at a date
    func progressBefore(_ date: Date?) -> Double {
        let currentValue = currentValueBefore(date)
        
        if targetValue == 0 || isZeroProgress {
            return 0
        }
        
        if isFinished {
            return 1
        }
        
        let initDiff = abs(initValue - targetValue)
        let diff: Double
        
        switch direction {
        case .down: diff = initValue - currentValue
        case .up: diff = currentValue - initValue
        }
        
        if initDiff == 0 {
            return 0
        }
        
        return diff / initDiff
    }
    
    var progress: Double {
        progressBefore(nil)
    }
}

extension WeightCalculatorForKeyResult {
    var currentValue: Double {
        currentValueBefore(nil)
    }
    
    var isFinished: Bool {
        direction.reached(targetValue, current: currentValue)
    }
    
    var isZeroProgress: Bool {
        switch direction {
        case .down where currentValue >= initValue: return true
        case .up where currentValue <= initValue: return true
        default: return false
        }
    }
}

public enum KeyResultValueDirection {
    case up, down
    
    func reached(_ target: Double, current: Double) -> Bool {
        switch self {
        case .up: return current >= target
        case .down: return current <= target
        }
    }
}
