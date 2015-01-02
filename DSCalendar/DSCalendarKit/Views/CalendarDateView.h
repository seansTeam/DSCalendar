//
//  CalendarDateView.h
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarDateView : UIView

@property (weak, nonatomic) IBOutlet UICollectionView *calendarCollectionView;

- (void)reloadUI;

@end
