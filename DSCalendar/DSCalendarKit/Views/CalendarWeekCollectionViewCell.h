//
//  CalendarWeekCollectionViewCell.h
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarWeekCollectionViewCell : UICollectionViewCell <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *CalendarWeekCollectionView;
@property (nonatomic) NSInteger currentWeek;

@end
