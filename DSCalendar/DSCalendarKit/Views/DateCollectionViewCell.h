//
//  DateCollectionViewCell.h
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) NSDate *date;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (weak, nonatomic) IBOutlet UILabel *rightLineLabel;
@property (weak, nonatomic) IBOutlet UILabel *baselineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UIImageView *todayImageView;
@property (weak, nonatomic) IBOutlet UIImageView *selectedDayImageView;

@end
