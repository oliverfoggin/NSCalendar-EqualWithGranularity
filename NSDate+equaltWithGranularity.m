//
//  NSDate+equaltWithGranularity.m
//  SportMate
//
//  Created by Oliver Foggin on 07/10/2013.
//  Copyright (c) 2013 Clicksco. All rights reserved.
//

#import "NSDate+equaltWithGranularity.h"

@implementation NSDate (equaltWithGranularity)

- (BOOL)isEqualToDate:(NSDate *)otherDate withGranularity:(NSCalendarUnit)granularity
{
    if ([self isEqualToDate:otherDate]) {
        return YES;
    }
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    int componentFlags = [self componentFlagsWithGranularity:granularity];
    
    NSDate *date1 = [self dateWithComponentFlages:componentFlags calendar:gregorian];
    NSDate *date2 = [otherDate dateWithComponentFlages:componentFlags calendar:gregorian];
    
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

- (NSDate *)dateWithComponentFlages:(int)componentFlags
                           calendar:(NSCalendar *)calendar
{
    NSDateComponents *components = [calendar components:componentFlags fromDate:self];
    
    return [calendar dateFromComponents:components];
}

@end
