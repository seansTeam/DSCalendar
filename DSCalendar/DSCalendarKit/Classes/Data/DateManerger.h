//
//  DateManerger.h
//  DSCalendar
//
//  Created by sean on 2014/12/21.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DSCALENDAR_STYLE) {
    DSCALENDAR_STYLE_MONTH,
    DSCALENDAR_STYLE_WEEK
};

@protocol DateManergerDelegate <NSObject>

@optional
- (void)didSeletedDate;

@end

@interface DateManerger : NSObject

@property (strong, nonatomic) NSDate *seletedDate;

@property (nonatomic, assign) DSCALENDAR_STYLE status;
@property (weak) id<DateManergerDelegate> delegate;

+ (id)sharedDateManerger;
- (void)dateDidseleted:(NSDate *)givenDate;

@end
