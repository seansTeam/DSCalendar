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

@end

@interface DSCalendarView : UIView

@property (weak) id<DSCalendarViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *HeaderCalendarView;
@property (weak, nonatomic) IBOutlet UIView *dateCalendarView;

- (void)setCalendarType:(NSString *)type;

@end
