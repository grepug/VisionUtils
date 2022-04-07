//
//  DateUtils.swift
//  
//
//  Created by Kai on 2022/4/6.
//

import Foundation

public extension Date {
    func formatted(in type: DateFormatter.Style, timeStyle: DateFormatter.Style = .none) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = type
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }
    
    func toISOString() -> String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: self)
    }
    
    static func monthFromNow(months: Int) -> Self {
        Calendar.current.date(byAdding: .month, value: months, to: .init()) ?? .init()
    }
    
    var startOfDay: Self {
        Calendar.current.startOfDay(for: self)
    }
    
    func days(to date: Date, includingLastDay: Bool = true) -> Int {
        let days = Calendar.current.dateComponents([.day], from: startOfDay, to: date.tomorrow.startOfDay).day ?? 0
        
        if !includingLastDay {
            return days - 1
        }
        
        return days
    }
    
    var tomorrow: Self {
        Calendar.current.date(byAdding: .day, value: 1, to: self) ?? .init()
    }
    
    var yesterday: Self {
        Calendar.current.date(byAdding: .day, value: -1, to: self) ?? .init()
    }
    
    func isBefore(_ date: Date) -> Bool {
        startOfDay < date.startOfDay
    }
    
    func isAfter(_ date: Date) -> Bool {
        startOfDay > date.startOfDay
    }
}

public extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.calendar = .current
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}
