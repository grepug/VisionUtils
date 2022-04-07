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
