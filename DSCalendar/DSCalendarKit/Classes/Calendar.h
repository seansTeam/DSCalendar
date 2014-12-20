//
//  Calendar.h
//  DSCalendar
//
//  Created by sean on 2014/12/20.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calendar : NSObject

@property (strong, nonatomic) NSCalendar *calendar;
@property (strong, nonatomic) NSDate *date;

-(NSInteger)getYear:(NSDate*)date;
- (NSDate *)firstDayOfCurrentMonth:(NSDate*)date;
- (NSUInteger)numberOfDaysInCurrentMonth:(NSDate*)date;
- (NSUInteger)numberOfWeeksInCurrentMonth:(NSDate*)date;

@end