//
//  NSCalendarEqualWithGranularityTestsTests.m
//  NSCalendarEqualWithGranularityTestsTests
//
//  Created by Hector Zarate on 10/14/13.
//  Copyright (c) 2013 Hector Zarate. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSCalendar+equalWithGranularity.h"


@interface NSCalendarEqualWithGranularityTestsTests : XCTestCase

@end

@implementation NSCalendarEqualWithGranularityTestsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCompleteResolution
{
    // 08 Jan 1947 12:12:12 GMT
    
    NSDate *testDateOne = [NSDate dateWithTimeIntervalSince1970:-725197668];
    
    // 21 Dec 2012 11:59:59 GMT
    
    NSDate *testDateTwo = [NSDate dateWithTimeIntervalSince1970:1356134399];
    
    BOOL equalityResult = [[NSCalendar currentCalendar] ojf_isDate:testDateOne
                                                       equalToDate:testDateTwo
                                                   withGranularity:NSCalendarUnitSecond];
    
    XCTAssertFalse(equalityResult, @"Failed to compare two different dates (granularity:seconds)");
    
    equalityResult = [[NSCalendar currentCalendar] ojf_isDate:testDateOne
                                                  equalToDate:testDateOne
                                              withGranularity:NSCalendarUnitSecond];
    
    XCTAssertTrue(equalityResult, @"Failed to compare two equal dates (granularity:seconds)");
}

- (void)testTimeResolution
{
    // 08 Jan 1947 12:12:12 GMT
    
    NSDate *testDateOne = [NSDate dateWithTimeIntervalSince1970:-725197668];
    
    // 08 Jan 1947 23:58:21 GMT
    
    NSDate *testDateOneDifferentTime = [NSDate dateWithTimeIntervalSince1970:-725155299];
    
    // 21 Dec 2012 11:59:59 GMT
    
    NSDate *testDateTwo = [NSDate dateWithTimeIntervalSince1970:1356134399];
    
    BOOL equalityResult = [[NSCalendar currentCalendar] ojf_isDate:testDateOne
                                                       equalToDate:testDateTwo
                                                   withGranularity:NSCalendarUnitDay];
    
    XCTAssertFalse(equalityResult, @"Failed to compare two different dates (granularity:days)");
    
    equalityResult = [[NSCalendar currentCalendar] ojf_isDate:testDateOne
                                                  equalToDate:testDateOneDifferentTime
                                              withGranularity:NSCalendarUnitDay];
    
    XCTAssertTrue(equalityResult, @"Failed to compare dates with different time");
}

@end
