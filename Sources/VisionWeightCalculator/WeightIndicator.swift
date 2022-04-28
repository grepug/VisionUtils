//
//  File.swift
//  
//
//  Created by Kai on 2022/3/18.
//

import SwiftUI

public enum WeightIndicator: Hashable, Codable {
    case l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, custom(Double)
    
    public static var allCases: [Self] {
        [.l1, .l2, .l3, .l4, .l5, .l6, .l7, .l8, .l9, .l10].reversed()
    }
    
    public var isNotCustom: Bool {
        Self.allCases.contains(self)
    }
    
    public var value: Double {
        switch self {
        case .l1: return 1
        case .l2: return 2
        case .l3: return 3
        case .l4: return 4
        case .l5: return 5
        case .l6: return 6
        case .l7: return 7
        case .l8: return 8
        case .l9: return 9
        case .l10: return 10
        case .custom(let double): return double
        }
    }
    
    public var color: Color {
        let lowerColorOpacity = 0.8
        
        switch self {
        case .l1: return .blue.opacity(lowerColorOpacity)
        case .l2: return .blue
        case .l3: return .green.opacity(lowerColorOpacity)
        case .l4: return .green
        case .l5: return .yellow.opacity(lowerColorOpacity)
        case .l6: return .yellow
        case .l7: return .orange.opacity(lowerColorOpacity)
        case .l8: return .orange
        case .l9: return .red.opacity(lowerColorOpacity)
        case .l10: return .red
        case .custom: return .accentColor
        }
    }
    
    @ViewBuilder
    public func buttonLabel(filled: Bool) -> some View {
        switch self {
        case .custom(let double): Text("\(double.toString(toFixed: 0))")
        default:
            Image(systemName: imageName(filled: filled))
                .font(.system(size: 18))
                .foregroundColor(color)
        }
    }
    
    public func imageName(filled: Bool = false) -> String {
        let fillString = filled ? ".fill" : ""
        
        return "\(value.toString(toFixed: 0)).square\(fillString)"
    }
    
    public init(double: Double) {
        for item in Self.allCases {
            if double == item.value {
                self = item
                
                return
            }
        }
        
        self = WeightIndicator.custom(double)
    }
}

extension Double {
    func toString(toFixed fixed: Int, dropingDotZero: Bool = false) -> String {
        let string = String(format: "%.\(fixed)f", self)
        let decimal = truncatingRemainder(dividingBy: 1)
        
        if dropingDotZero && decimal == 0 {
            return String(Int(self))
        }
        
        return string
    }
    
    func toString(fixedAndDroppingZeros fixed: Int) -> String {
        var string = toString(toFixed: fixed, dropingDotZero: true)
        
        if string.contains(".") {
            while string.last == "0" {
                string = String(string.dropLast())
            }
            
            if string.last == "." {
                string = String(string.dropLast())
            }
        }
        
        return string
    }
}
