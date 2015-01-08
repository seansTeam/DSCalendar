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
#import "DateManerger.h"

@interface DSCalendarView () <DateManergerDelegate, CalendarHeaderViewDelegate>

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
        return self;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    self.headerView = [[CalendarHeaderView alloc] init];
    [self.calendarHeaderView addSubview:self.headerView];
    [self.headerView setDelegate:(id)self];
    
    self.dateView = [[CalendarDateView alloc] init];
    [self.calendarDateView addSubview:self.dateView];
    [[DateManerger sharedDateManerger] setDelegate:(id)self];
    
}

- (void)reloadUI {
    [self.dateView reloadUI];
    [[DateManerger sharedDateManerger] setDelegate:(id)self];
}

- (void)didSeletedDate {

    [self.dateView reloadUI];
    [self.headerView setCalendarHeader];
    NSDate *seletedDate = [[DateManerger sharedDateManerger] seletedDate];
    [self.delegate didSeletedDate];
    
}

- (void)setCalendarType:(NSString *)type {
    DateManerger *dateManerger = [DateManerger sharedDateManerger];
    if ([type isEqualToString:@"week"]) {
        dateManerger.status = DSCALENDAR_STYLE_WEEK;
        self.headerView.lastMonthButton.hidden = YES;
        self.headerView.nextMonthButton.hidden = YES;
    }
    else {
        dateManerger.status = DSCALENDAR_STYLE_MONTH;
        self.headerView.lastMonthButton.hidden = NO;
        self.headerView.nextMonthButton.hidden = NO;
    }
}

- (void)changeMonth {
    [self.dateView reloadUI];
    [self.headerView setCalendarHeader];
}

@end
