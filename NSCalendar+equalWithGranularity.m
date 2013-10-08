//
//  NSCalendar+equalWithGranularity.m
//  SportMate
//
//  Created by Oliver Foggin on 08/10/2013.
//  Copyright (c) 2013 Clicksco. All rights reserved.
//

#import "NSCalendar+equalWithGranularity.h"

@implementation NSCalendar (equalWithGranularity)

- (BOOL)isDate:(NSDate *)date1 equalToDate:(NSDate *)date2 withGranularity:(NSCalendarUnit)granularity
{
    if ([date1 isEqualToDate:date2]) {
        return YES;
    }
    
    int componentFlags = [self componentFlagsWithGranularity:granularity];
    
    date1 = [self dateFromDate:date1 withComponentFlags:componentFlags];
    date2 = [self dateFromDate:date2 withComponentFlags:componentFlags];
    
    return [date1 isEqualToDate:date2];
}

- (int)componentFlagsWithGranularity:(NSCalendarUnit)granularity
{
    int componentFlags = 0;
    
    for (int i = 1<<1 ; i <= granularity ; i = i<<1) {
        componentFlags = componentFlags | i;
    }
    
    return componentFlags;
}

- (NSDate *)dateFromDate:(NSDate *)date
      withComponentFlags:(int)componentFlags
{
    NSDateComponents *components = [self components:componentFlags fromDate:date];
    
    return [self dateFromComponents:components];
}

@end
