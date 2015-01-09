//
//  DSCalendarView.h
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateManerger.h"

@protocol DSCalendarViewDelegate <NSObject>

@optional
- (void)didSeletedDate:(NSDate *)date;
- (void)didMonthCahange:(NSDate *)date;

@end

@interface DSCalendarView : UIView

@property (strong, nonatomic) DateManerger *dateManerger;
@property (strong, nonatomic) NSDate *lastVisibleDate;
@property (strong, nonatomic) NSDate *firstVisibleDate;
@property (strong, nonatomic) NSDate *seletedDate;

@property (weak) id<DSCalendarViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *calendarHeaderView;
@property (weak, nonatomic) IBOutlet UIView *calendarDateView;

- (void)setCalendarType:(NSString *)type;
- (void)setCalendarDataWithDictionary:(NSMutableDictionary *)data;
- (void)reloadUI;

@end
