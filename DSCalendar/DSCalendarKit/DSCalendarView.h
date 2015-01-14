//
//  DSCalendarView.h
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateManarger.h"

typedef NS_ENUM(NSInteger, CALENDAR_TYP) {
    CALENDAR_TYP_WEEK,
    CALENDAR_TYP_MONTH
};

@protocol DSCalendarViewDelegate <NSObject>

@optional
- (void)didDateSeleted:(NSDate *)date;
- (void)didMonthChange:(NSDate *)date;

@end

@interface DSCalendarView : UIView

@property (nonatomic, assign) CALENDAR_TYP type;
@property (strong, nonatomic) DateManarger *dateManarger;

@property (weak) id<DSCalendarViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *calendarHeaderView;
@property (weak, nonatomic) IBOutlet UIView *calendarDateView;

- (void)setCalendarType:(CALENDAR_TYP)type;
- (void)setCalendarDataWithDictionary:(NSMutableDictionary *)data;
- (void)reloadUI;

@end
