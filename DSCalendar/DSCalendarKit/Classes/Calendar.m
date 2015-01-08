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

static Calendar *_calendar;

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.calendar = [NSCalendar currentCalendar];
    return self;
}

+ (id)sharedCalendar {
    @synchronized(self) {
        if (_calendar == nil) {
            _calendar = [[Calendar alloc] init];
        }
    }
    return _calendar;
}

-(NSInteger)getYear:(NSDate*)date {
    NSDateComponents*dateCom=[calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:date];
    NSInteger yearint=[dateCom year];
    return yearint;
}

// Finds the date for the first day of the calendar
- (NSDate *)getFirstDayOfTheCalendarFromDate:(NSDate *)givenDate {
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:givenDate];
    [components setDay:1];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:components];
    return [self getFirstDayOfTheWeekFromDate:date];
}

// Finds the date for the first day of the week
- (NSDate *)getFirstDayOfTheWeekFromDate:(NSDate *)givenDate {
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:givenDate];
    // Find Sunday for the given date
    components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:givenDate];
    [components setWeekday:1]; // 1 == Sunday, 7 == Saturday
    [components setWeek:[components week]];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)getFirstDayOfTheWeekFromWeek:(NSInteger)givenWeek :(NSDate *)givenDate {
    NSDate *firstDate = [self getFirstDayOfTheCalendarFromDate:givenDate];
    NSDate *newDate = [[NSDate alloc]initWithTimeIntervalSinceReferenceDate:([firstDate timeIntervalSinceReferenceDate]+24*3600*7*(givenWeek - 1))];
    return newDate;
}

- (NSDate *)getNextDateFromDate:(NSDate *)givenDate {
    NSDate *newDate = [[NSDate alloc]initWithTimeIntervalSinceReferenceDate:([givenDate timeIntervalSinceReferenceDate]+24*3600)];
    return newDate;
}

+ (BOOL)isToday:(NSDate *)givenDate {
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"d"];
    NSString *todayString = [dateFormat stringFromDate:today];
    NSString *givenDateString = [dateFormat stringFromDate:givenDate];
    if ([givenDateString isEqualToString:todayString]) {
        return YES;
    }
    return NO;
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
