//
//  ViewController.m
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "ViewController.h"
#import "DSCalendarKit/DSCalendarView.h"

@interface ViewController () <DSCalendarViewDelegate>

@property (strong, nonatomic) DSCalendarView *calendarView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.calendarView = [[DSCalendarView alloc] init];
    [self.DScalendarView addSubview:self.calendarView];
}

- (void)viewWillAppear:(BOOL)animated {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    NSString *strDate2 = @"20150124084520";
    
    NSDate *date = [ViewController stringToDateDay:strDate];
    NSDate *date2 = [ViewController stringToDateDay:strDate2];
    [data setObject:date forKey:date];
    [data setObject:date2 forKey:date2];
    NSLog(@"%@",date);
    
    self.calendarView.delegate = self;
    [self.calendarView setCalendarType:@"month"];
    
    [self.calendarView setCalendarDataWithDictionary:data];
    [self.calendarView reloadUI];
}


- (void)viewWillDisappear:(BOOL)animated {
    self.calendarView.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSeletedDate:(NSDate *)date {
    [self performSegueWithIdentifier:@"weekSegue" sender:self];
}

- (void)didMonthCahange:(NSDate *)date {
    
}

// 20141219081259 - > 2014/12/29 00:00:00
+ (NSDate *)stringToDateDay:(NSString *)string {
    NSString * year = [string substringWithRange:NSMakeRange(0, 4)];
    NSString * month = [string substringWithRange:NSMakeRange(4, 2)];
    NSString * day = [string substringWithRange:NSMakeRange(6, 2)];
    
    NSDate *date = [[NSDate alloc] init];
    
    NSString *str = [NSString stringWithFormat:@"%@-%@-%@ 00:00:00",year ,month ,day];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    date = [formatter dateFromString:str];
    return date;
}

@end
