//
//  DateManerger.m
//  DSCalendar
//
//  Created by sean on 2014/12/21.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "DateManerger.h"

@implementation DateManerger

static DateManerger *dateManerger;

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.seletedDate = [NSDate date];
    return self;
}

+ (id)sharedDateManerger {
    @synchronized(self) {
        if (dateManerger == nil) {
            dateManerger = [[DateManerger alloc] init];
        }
    }
    return dateManerger;
}

- (void)dateDidseleted:(NSDate *)givenDate {
    self.seletedDate = givenDate;
    [self.delegate didSeletedDate];
}

@end
