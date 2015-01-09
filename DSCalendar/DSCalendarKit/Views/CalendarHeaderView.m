//
//  CalendarHeaderView.m
//  DSCalendar
//
//  Created by Sean Yang on 2015/1/8.
//  Copyright (c) 2015年 Sean Yang. All rights reserved.
//

#import "CalendarHeaderView.h"
#import "DateManerger.h"
#import "Calendar.h"

@implementation CalendarHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CalendarHeaderView" owner:nil options:nil];
        CalendarHeaderView *calendarHeaderView = [views lastObject];
        self = calendarHeaderView;
        [self setCalendarHeader];
        return self;
    }
    return self;
}

- (IBAction)onTouchLastMonthButton:(UIButton *)sender {
    Calendar *calendar = [Calendar sharedCalendar];
    NSDate *date = [calendar getFirstDayOfTheCalendarFromDate:[[DateManerger sharedDateManerger] seletedDate]];
    NSDate *newDate = [calendar getLastDateFromDate:date];
    DateManerger *dateManerger = [DateManerger sharedDateManerger];
    dateManerger.seletedDate = [calendar getFirstDayOfTheMonthFromDate:newDate];
    [self.delegate changeMonth:dateManerger.seletedDate];
}

- (IBAction)onTouchNextMonthButton:(UIButton *)sender {
    Calendar *calendar = [Calendar sharedCalendar];
    NSDate *date = [calendar getFirstDayOfTheMonthFromDate:[[DateManerger sharedDateManerger] seletedDate]];
    NSInteger number = [calendar numberOfDaysInCurrentMonth:date];
    for (int i = 1; i <= number; i++) {
        date = [calendar getNextDateFromDate:date];
    }
    DateManerger *dateManerger = [DateManerger sharedDateManerger];
    dateManerger.seletedDate = [calendar getFirstDayOfTheMonthFromDate:date];
    [self.delegate changeMonth:dateManerger.seletedDate];
}

- (void)setCalendarHeader {
    NSDate *date = [[DateManerger sharedDateManerger] seletedDate];
    NSCalendar *calendar = [[Calendar sharedCalendar] calendar];
    NSCalendarUnit flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponents = [calendar components:flags fromDate:date];
    NSString *monthString = [[NSString alloc] init];
    switch (dateComponents.month) {
        case 1:
            monthString = @"January";
            break;
        case 2:
            monthString = @"February";
            break;
        case 3:
            monthString = @"March";
            break;
        case 4:
            monthString = @"April";
            break;
        case 5:
            monthString = @"May";
            break;
        case 6:
            monthString = @"June";
            break;
        case 7:
            monthString = @"July";
            break;
        case 8:
            monthString = @"August";
            break;
        case 9:
            monthString = @"September";
            break;
        case 10:
            monthString = @"October";
            break;
        case 11:
            monthString = @"November";
            break;
        case 12:
            monthString = @"December";
            break;
        default:
            break;
    }
    [self.thisMonthTitleLabel setText:[NSString stringWithFormat:@"%@ %ld",monthString ,dateComponents.year]];
}

@end
