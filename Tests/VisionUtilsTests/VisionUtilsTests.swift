import XCTest
@testable import VisionUtils

final class VisionUtilsTests: XCTestCase {
    func test_days_to_is_correct() throws {
        let date1 = "2022-01-01 12:00:00".toDate()!
        let date2 = "2022-01-02 12:00:00".toDate()!
        
        XCTAssertEqual(date1.days(to: date2), 2)
    }
    
    func test_days_to_is_correct_2() throws {
        let date1 = "2022-03-28 12:00:00".toDate()!
        let date2 = "2022-04-26 12:00:00".toDate()!
        
        XCTAssertEqual(date1.days(to: date2), 30)
    }
    
    func test_date_is_before() throws {
        let date1 = "2022-03-28 12:00:00".toDate()!
        let date2 = "2022-03-28 12:00:00".toDate()!
        
        let date3 = "2022-03-28 12:00:00".toDate()!
        let date4 = "2022-03-29 12:00:00".toDate()!
        
        let date5 = "2022-03-30 12:00:00".toDate()!
        let date6 = "2022-03-28 12:00:00".toDate()!
        
        let date7 = "2022-03-28 00:00:00".toDate()!
        let date8 = "2022-03-28 00:00:00".toDate()!
        
        XCTAssertEqual(date1.isBefore(date2), false)
        XCTAssertEqual(date3.isBefore(date4), true)
        XCTAssertEqual(date5.isBefore(date6), false)
        XCTAssertEqual(date7.isBefore(date8), false)
    }
    
    func test_date_is_after() throws {
        let date1 = "2022-03-28 12:00:00".toDate()!
        let date2 = "2022-03-28 12:00:00".toDate()!
        
        let date3 = "2022-03-28 12:00:00".toDate()!
        let date4 = "2022-03-29 12:00:00".toDate()!
        
        let date5 = "2022-03-30 12:00:00".toDate()!
        let date6 = "2022-03-28 12:00:00".toDate()!
        
        let date7 = "2022-03-28 00:00:00".toDate()!
        let date8 = "2022-03-28 00:00:00".toDate()!
        
        XCTAssertEqual(date1.isAfter(date2), false)
        XCTAssertEqual(date3.isAfter(date4), false)
        XCTAssertEqual(date5.isAfter(date6), true)
        XCTAssertEqual(date7.isAfter(date8), false)
    }
    
    func test_state() throws {
        let date3 = "2022-03-28 12:00:00".toDate()!
        let date4 = "2022-03-29 12:00:00".toDate()!
        
        XCTAssertEqual(date3.days(to: date4), 2)
    }
    
  
}

final class DateUtilsTests: XCTestCase {
    func test_start_of_week_is_correct() throws {
        let date = "2022-05-31 08:00:00".toDate()!
        let startOfWeek = "2022-05-30 08:00:00".toDate()!.startOfDay
        
        let date2 = "2022-05-29 08:00:00".toDate()!
        let startOfWeek2 = "2022-05-23 08:00:00".toDate()!.startOfDay
        
        let date3 = "2022-05-23 01:00:00".toDate()!
        let startOfWeek3 = date3.startOfDay
        
        XCTAssertEqual(date.startOfWeek, startOfWeek)
        XCTAssertEqual(date2.startOfWeek, startOfWeek2)
        XCTAssertEqual(date3.startOfWeek, startOfWeek3)
    }
    
    func test_end_of_day() throws {
        let date = "2022-05-31 08:00:00".toDate()!
        let date2 = "2022-05-31 23:59:59".toDate()!
        
        XCTAssertEqual(date.endOfDay, date2)
    }
    
    func test_end_of_week_is_correct() throws {
        let date = "2022-05-31 08:00:00".toDate()!
        let endOfWeek = "2022-06-05 08:00:00".toDate()!.endOfDay
        
        let date2 = "2022-05-29 08:00:00".toDate()!
        let endOfWeek2 = "2022-05-29 08:00:00".toDate()!.endOfDay
        
        let date3 = "2022-05-23 01:00:00".toDate()!
        let endOfWeek3 = "2022-05-29 01:00:00".toDate()!.endOfDay
        
        print("!!!", endOfWeek)
        
        XCTAssertEqual(date.endOfWeek, endOfWeek)
        XCTAssertEqual(date2.endOfWeek, endOfWeek2)
        XCTAssertEqual(date3.endOfWeek, endOfWeek3)
    }
    
    func test_start_of_month() throws {
        let date = "2022-05-31 08:00:00".toDate()!
        let date2 = "2022-05-01 00:00:00".toDate()!
        
        XCTAssertEqual(date.startOfMonth, date2)
    }
    
    func test_end_of_month() throws {
        let date = "2022-05-01 08:00:00".toDate()!
        let date2 = "2022-05-31 00:00:00".toDate()!.endOfDay
        
        let date3 = "2022-02-28 00:00:00".toDate()!
        let date4 = "2022-02-28 00:00:00".toDate()!.endOfDay
        
        XCTAssertEqual(date.endOfMonth, date2)
        XCTAssertEqual(date3.endOfMonth, date4)
    }
}
