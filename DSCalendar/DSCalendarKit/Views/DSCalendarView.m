//
//  DSCalendarView.m
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "DSCalendarView.h"
#import "CalendarDateView.h"

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
    
}

@end
