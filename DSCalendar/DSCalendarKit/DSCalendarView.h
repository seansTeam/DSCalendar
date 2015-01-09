//
//  DSCalendarView.h
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DSCalendarViewDelegate <NSObject>

@optional
- (void)didSeletedDate;
- (void)didMonthCahange;

@end

@interface DSCalendarView : UIView

@property (weak) id<DSCalendarViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *calendarHeaderView;
@property (weak, nonatomic) IBOutlet UIView *calendarDateView;

- (void)setCalendarType:(NSString *)type;
- (void)setCalendarDataWithDictionary:(NSMutableDictionary *)data;
- (void)reloadUI;

@end
