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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.firstDateOfWeek = [self.calendar getFirstDayOfTheWeekFromWeek:self.currentWeek :[NSDate date]];
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
    [dateFormat setDateFormat:@"d"];
    NSString *nowDateString = [dateFormat stringFromDate:date];
    [cell.dateButton setTitle:nowDateString forState:UIControlStateNormal];
    
    [dateFormat setDateFormat:@"Md"];
    nowDateString = [dateFormat stringFromDate:date];
    NSString *selectedDayString = [dateFormat stringFromDate:[[DateManerger sharedDateManerger] seletedDate]];
    if ([nowDateString isEqualToString:selectedDayString]) {
        cell.selectedDayImageView.hidden = NO;
    }
    else {
        cell.selectedDayImageView.hidden = YES;
    }
    
    [dateFormat setDateFormat:@"M"];
    NSString *monthString = [dateFormat stringFromDate:date];
    NSString *selectedMonthString = [dateFormat stringFromDate:[[DateManerger sharedDateManerger] seletedDate]];
    if ([monthString isEqualToString:selectedMonthString]) {
        cell.dateButton.enabled = YES;
    }
    else {
        cell.dateButton.enabled = NO;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    return CGSizeMake(screenWidth/(double)7, 100);
}

@end
