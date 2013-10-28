//
//  NSCalendar+equalWithGranularity.m
//  SportMate
//
//  Created by Oliver Foggin on 08/10/2013.
//  Copyright (c) 2013 Clicksco. All rights reserved.
//

#import "NSCalendar+equalWithGranularity.h"

@implementation NSCalendar (equalWithGranularity)

- (BOOL)ojf_isDate:(NSDate *)date1 equalToDate:(NSDate *)date2 withGranularity:(NSCalendarUnit)granularity
{
    if ([date1 isEqualToDate:date2]) {
        return YES;
    }
    
    int componentFlags = granulatiry * 2 - 2;
    
    date1 = [self ojf_dateFromDate:date1 withComponentFlags:componentFlags];
    date2 = [self ojf_dateFromDate:date2 withComponentFlags:componentFlags];
    
    return [date1 isEqualToDate:date2];
}

- (NSComparisonResult)ojf_compareDate:(NSDate *)date1 toDate:(NSDate *)date2 withGranularity:(NSCalendarUnit)granularity
{
    int componentFlags = granulatiry * 2 - 2;
    
    date1 = [self ojf_dateFromDate:date1 withComponentFlags:componentFlags];
    date2 = [self ojf_dateFromDate:date2 withComponentFlags:componentFlags];
    
    return [date1 compare:date2];
}

- (NSDate *)ojf_dateFromDate:(NSDate *)date withComponentFlags:(int)componentFlags
{
    NSDateComponents *components = [self components:componentFlags fromDate:date];
    
    return [self dateFromComponents:components];
}

@end
