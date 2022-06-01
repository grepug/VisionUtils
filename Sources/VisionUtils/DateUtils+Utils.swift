//
//  File.swift
//  
//
//  Created by Kai on 2022/5/31.
//

import Foundation

extension Date {
    var weekday: Int {
        Calendar.current.component(.weekday, from: self)
    }
    
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
    
    var startOfWeek: Date {
        var date = self
        let firstWeekday = 2
        
        while date.weekday != firstWeekday {
            date = date.yesterday
        }
        
        return date.startOfDay
    }
    
    var endOfWeek: Date {
        var date = self
        let lastWeekday = 1
        
        while date.weekday != lastWeekday {
            date = date.tomorrow
        }
        
        return date.endOfDay
    }
    
    var startOfMonth: Date {
        var date = self
        
        while date.day != 1 {
            date = date.yesterday
        }
        
        return date.startOfDay
    }
    
    var endOfMonth: Date {
        var date = self
        
        if day == 1 {
            date = date.tomorrow
        }
        
        while date.day != 1 {
            date = date.tomorrow
        }
        
        return date.yesterday.endOfDay
    }
}
