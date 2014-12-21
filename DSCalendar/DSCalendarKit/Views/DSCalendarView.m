//
//  DSCalendarView.m
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "DSCalendarView.h"
#import "CalendarDateView.h"
#import "DateManerger.h"

@interface DSCalendarView () <DateManergerDelegate>

@property (strong, nonatomic) CalendarDateView *calendarDateView;

@end

@implementation DSCalendarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"DSCalendarView" owner:nil options:nil];
        DSCalendarView *dSCalendarView = [views lastObject];
        self = dSCalendarView;
        return self;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    CalendarDateView *calendarDateView = [[CalendarDateView alloc] init];
    [self.dateCalendarView addSubview:calendarDateView];
    [[DateManerger sharedDateManerger] setDelegate:self];
    [self setCalendarType:@"month"];
}

- (void)didSeletedDate {

    // Remove view.
    for (UIView *view in self.dateCalendarView.subviews) {
        [view removeFromSuperview];
    }
    
    CalendarDateView *calendarDateView = [[CalendarDateView alloc] init];
    [self.dateCalendarView addSubview:calendarDateView];

    NSDate *seletedDate = [[DateManerger sharedDateManerger] seletedDate];
    [self.delegate didSeletedDate];
    
}

- (void)setCalendarType:(NSString *)type {
    DateManerger *dateManerger = [DateManerger sharedDateManerger];
    if ([type isEqualToString:@"week"]) {
        dateManerger.status = DSCALENDAR_STYLE_WEEK;
    }
    else {
        dateManerger.status = DSCALENDAR_STYLE_MONTH;
    }
}

@end
