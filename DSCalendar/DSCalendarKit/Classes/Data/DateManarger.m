//
//  DateManerger.m
//  DSCalendar
//
//  Created by sean on 2014/12/21.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "DateManarger.h"
#import "Calendar.h"

@interface DateManarger ()

@property (strong, nonatomic) Calendar *calendar;

@end

@implementation DateManarger

static DateManarger *dateManarger;

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.calendar = [Calendar sharedCalendar];
    self.seletedDate = [NSDate date];
    self.firstVisibleDate = [self.calendar getFirstDayOfTheCalendarFromDate:self.seletedDate];
    self.lastVisibleDate = [self.calendar getLasterDayOfTheCalendarFromDate:self.seletedDate];
    return self;
}

+ (id)sharedDateManarger {
    @synchronized(self) {
        if (dateManarger == nil) {
            dateManarger = [[DateManarger alloc] init];
        }
    }
    return dateManarger;
}

- (void)dateDidseleted:(NSDate *)givenDate {
    [self setDate:givenDate];
    [self.delegate didSeletedDate:givenDate];
}

- (void)setDate:(NSDate *)givenDate {
    self.firstVisibleDate = [self.calendar getFirstDayOfTheCalendarFromDate:givenDate];
    self.lastVisibleDate = [self.calendar getLasterDayOfTheCalendarFromDate:givenDate];
    self.seletedDate = givenDate;
}

@end
