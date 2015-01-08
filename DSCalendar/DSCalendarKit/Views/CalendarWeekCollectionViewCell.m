//
//  CalendarWeekCollectionViewCell.m
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "CalendarWeekCollectionViewCell.h"
#import "DateCollectionViewCell.h"
#import "DateManerger.h"

@interface CalendarWeekCollectionViewCell ()

@property (strong, nonatomic) NSDate *firstDateOfWeek;

@end

@implementation CalendarWeekCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Init collectionCell.xib
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CalendarWeekCollectionViewCell" owner:self options:nil];
        
        // If is not exist，return nil
        if (arrayOfViews.count < 1) {
            return nil;
        }
        // If xib view is not UICollectionViewCell class，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        // load nib
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    
    self.CalendarWeekCollectionView.delegate = self;
    self.CalendarWeekCollectionView.dataSource = self;
    [self.CalendarWeekCollectionView registerClass:[DateCollectionViewCell class] forCellWithReuseIdentifier:@"DateCollectionViewCell"];
    self.CalendarWeekCollectionView.bounces = NO;
}

- (void)reloadUI {
    [self.CalendarWeekCollectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.firstDateOfWeek = [self.calendar getFirstDayOfTheWeekFromWeek:self.currentWeek :[[DateManerger sharedDateManerger] seletedDate]];
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DateCollectionViewCell *cell = (DateCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DateCollectionViewCell" forIndexPath:indexPath];
    NSDate *date = self.firstDateOfWeek;
    for (int i = 0; i < indexPath.item; i++) {
        date = [self.calendar getNextDateFromDate:date];
    }
    cell.date = date;
    if ([Calendar isToday:date]) {
        cell.todayImageView.hidden = NO;
    }
    else {
        cell.todayImageView.hidden = YES;
    }
    
    cell.selectedDayImageView.hidden = YES;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd"];
    NSString *nowDateString = [dateFormat stringFromDate:date];
    [cell.dateButton setTitle:nowDateString forState:UIControlStateNormal];
    
    [dateFormat setDateFormat:@"MMdd"];
    nowDateString = [dateFormat stringFromDate:date];
    NSString *selectedDayString = [dateFormat stringFromDate:[[DateManerger sharedDateManerger] seletedDate]];
    if ([nowDateString isEqualToString:selectedDayString]) {
        cell.selectedDayImageView.hidden = NO;
    }
    else {
        cell.selectedDayImageView.hidden = YES;
    }
    
    [dateFormat setDateFormat:@"MM"];
    NSString *monthString = [dateFormat stringFromDate:date];
    NSString *selectedMonthString = [dateFormat stringFromDate:[[DateManerger sharedDateManerger] seletedDate]];
    if ([monthString isEqualToString:selectedMonthString]) {
        UIColor *color = [UIColor
                          colorWithRed:102.0 / 255.0f
                          green:102.0 / 255.0f
                          blue:102.0 / 255.0f
                          alpha:1];
        [cell.dateButton setTitleColor:color forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"ic_d_video.png"];
        cell.flagImageView.image = image;
    }
    else {
        UIColor *color = [UIColor
                          colorWithRed:230.0 / 255.0f
                          green:230.0 / 255.0f
                          blue:230.0 / 255.0f
                          alpha:1];
        [cell.dateButton setTitleColor:color forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"ic_d_video_lastmonth.png"];
        cell.flagImageView.image = image;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    return CGSizeMake(screenWidth/(double)7, 100);
}

@end
