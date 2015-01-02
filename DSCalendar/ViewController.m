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
    self.calendarView.delegate = self;
    [self.calendarView setCalendarType:@"month"];
    [self.calendarView reloadUI];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.calendarView.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSeletedDate {
    [self performSegueWithIdentifier:@"weekSegue" sender:self];
}

@end
