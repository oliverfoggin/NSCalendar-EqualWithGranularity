//
//  NSDate+equaltWithGranularity.h
//  SportMate
//
//  Created by Oliver Foggin on 07/10/2013.
//  Copyright (c) 2013 Clicksco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (equaltWithGranularity)

- (BOOL)isEqualToDate:(NSDate *)otherDate withGranularity:(NSCalendarUnit)granularity;

@end
