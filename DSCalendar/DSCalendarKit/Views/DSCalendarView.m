//
//  DSCalendarView.m
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "DSCalendarView.h"
#import "CalendarDateView.h"
#import "CalendarHeaderView.h"
#import "DateManarger.h"

@interface DSCalendarView () <DateManargarDelegate, CalendarHeaderViewDelegate>

@property (strong, nonatomic) CalendarDateView *dateView;
@property (strong, nonatomic) CalendarHeaderView *headerView;

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
        self.dateManarger = [DateManarger sharedDateManarger];
        self.frame = frame;
        return self;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    self.headerView = [[CalendarHeaderView alloc] initWithFrame:self.calendarHeaderView.bounds];
    [self.calendarHeaderView addSubview:self.headerView];
    [self.headerView setDelegate:(id)self];
    
    self.dateView = [[CalendarDateView alloc] initWithFrame:self.calendarDateView.bounds];
    [self.calendarDateView addSubview:self.dateView];
    [[DateManarger sharedDateManarger] setDelegate:(id)self];
    
}

- (void)reloadUI {
    self.headerView.frame = self.calendarHeaderView.bounds;
    [self.dateView reloadUI];
    [[DateManarger sharedDateManarger] setDelegate:(id)self];
}

- (void)didSeletedDate:(NSDate *)date {
    [self.delegate didDateSeleted:date];
    [self.dateView reloadUI];
    [self.headerView setCalendarHeader];
}

- (void)setCalendarType:(CALENDAR_TYP)type {
    DateManarger *dateManarger = [DateManarger sharedDateManarger];
    self.type = type;
    if (self.type == CALENDAR_TYP_WEEK) {
        dateManarger.status = DSCALENDAR_STYLE_WEEK;
        self.headerView.lastMonthButton.hidden = YES;
        self.headerView.nextMonthButton.hidden = YES;
    }
    else {
        dateManarger.status = DSCALENDAR_STYLE_MONTH;
        self.headerView.lastMonthButton.hidden = NO;
        self.headerView.nextMonthButton.hidden = NO;
    }
}

- (void)changeMonth:(NSDate *)date {
    [self.dateManarger setDate:date];
    [self.delegate didMonthChange:date];
    [self.dateView reloadUI];
    [self.headerView setCalendarHeader];
}

- (void)setCalendarDataWithDictionary:(NSMutableDictionary *)data {
    [[DateManarger sharedDateManarger] setCalendarData:data];
}

@end
