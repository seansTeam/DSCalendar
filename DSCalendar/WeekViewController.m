//
//  WeekViewController.m
//  DSCalendar
//
//  Created by sean on 2014/12/21.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "WeekViewController.h"
#import "DSCalendarKit/DSCalendarView.h"

@interface WeekViewController () <DSCalendarViewDelegate>

@property (strong, nonatomic) DSCalendarView *calendarView;

@end

@implementation WeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.calendarView = [[DSCalendarView alloc] init];
    
    [self.weekCalendarView addSubview:self.calendarView];
    [self.calendarView setCalendarType:CALENDAR_TYP_WEEK];
}

- (void)viewWillAppear:(BOOL)animated {
    self.calendarView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.calendarView.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSeletedDate:(NSDate *)date {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
