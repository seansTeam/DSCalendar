//
//  CalendarHeaderView.h
//  DSCalendar
//
//  Created by Sean Yang on 2015/1/8.
//  Copyright (c) 2015年 Sean Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CalendarHeaderViewDelegate <NSObject>

@optional
- (void)changeMonth;

@end

@interface CalendarHeaderView : UIView

@property (weak) id<CalendarHeaderViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *thisMonthTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *lastMonthButton;
@property (weak, nonatomic) IBOutlet UIButton *nextMonthButton;

- (void)setCalendarHeader;

@end
