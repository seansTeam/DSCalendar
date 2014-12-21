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
}

- (void)didSeletedDate {
    // Remove view.
    for (UIView *view in self.dateCalendarView.subviews) {
        [view removeFromSuperview];
    }
    CalendarDateView *calendarDateView = [[CalendarDateView alloc] init];
    [self.dateCalendarView addSubview:calendarDateView];
}

@end
