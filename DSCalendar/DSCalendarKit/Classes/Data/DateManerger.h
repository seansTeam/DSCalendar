//
//  DateManerger.h
//  DSCalendar
//
//  Created by sean on 2014/12/21.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DateManergerDelegate <NSObject>

@optional
- (void)didSeletedDate;

@end

@interface DateManerger : NSObject

@property (strong, nonatomic) NSDate *seletedDate;

@property (weak) id<DateManergerDelegate> delegate;

+ (id)sharedDateManerger;
- (void)dateDidseleted:(NSDate *)givenDate;

@end
