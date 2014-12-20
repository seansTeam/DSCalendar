//
//  Calendar.m
//  DSCalendar
//
//  Created by sean on 2014/12/20.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "Calendar.h"

@implementation Calendar
@synthesize calendar;

-(NSInteger)getYear:(NSDate*)date {
    NSDateComponents*dateCom=[calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:date];
    NSInteger yearint=[dateCom year];
    return yearint;
}

#pragma mark -  Get first date of this month.
- (NSDate *)firstDayOfCurrentMonth:(NSDate*)date {
    NSDate *startDate = nil;
    BOOL ok = [calendar rangeOfUnit:NSMonthCalendarUnit startDate:&startDate interval:NULL forDate:date];
    NSAssert1(ok, @"Failed to calculate the first day of the month based on %@", self);
    return startDate;
}

#pragma  mark - Check weekly ordinality of first day.
- (NSUInteger)weeklyOrdinality:(NSDate*)date {
    
    // Get first day.
    NSDate *date2=[self firstDayOfCurrentMonth:date];
    return [calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:date2];
}

#pragma  mark - Get number of this month.
- (NSUInteger)numberOfDaysInCurrentMonth:(NSDate*)date {
    return [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date].length;
}

#pragma  mark - Get number of week about this month.
- (NSUInteger)numberOfWeeksInCurrentMonth:(NSDate*)date {
    NSUInteger weekday = [self weeklyOrdinality:date];
    NSUInteger days = [self numberOfDaysInCurrentMonth:date];
    NSUInteger weeks = 0;
    if (weekday > 1) {
        weeks += 1;
        days -= (7 - weekday + 1);
    }
    weeks += days / 7;
    weeks += (days % 7 > 0) ? 1 : 0;
    return weeks;
}

#pragma mark - That day a few weeks this month.
- (NSInteger)week:(NSDate*)date {
    NSDateComponents *comps;
    comps =[calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit|NSWeekOfMonthCalendarUnit)   fromDate:date];
    //    NSInteger week = [comps weekdayOrdinal]; //   1 -7  ------2 - 14
    NSInteger week = [comps weekOfMonth]; // That day a few weeks this month.
    //    NSInteger weekday = [comps weekday]; // Of the week（Sun is “1” Mon is “2”）
    return week;
}

#pragma mark - Out put of time
- (NSString*)outputOfTime:(NSDate*)date {
    NSDateFormatter*format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *string=[format stringFromDate:date];
    return string;
}

#pragma mark - Nextweek
-(void)nextMonth:(UIButton*)sender {
    NSDateComponents*dateCom=[[NSDateComponents alloc]init];
    [dateCom setMonth:1];

}

@end
