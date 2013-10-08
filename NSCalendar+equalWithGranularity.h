//
//  NSCalendar+equalWithGranularity.h
//  SportMate
//
//  Created by Oliver Foggin on 08/10/2013.
//  Copyright (c) 2013 Clicksco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (equalWithGranularity)

- (BOOL)ojf_isDate:(NSDate *)date1 equalToDate:(NSDate *)date2 withGranularity:(NSCalendarUnit)granularity;

@end
