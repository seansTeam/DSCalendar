//
//  CalendarDateView.m
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "CalendarDateView.h"
#import "CalendarWeekCollectionViewCell.h"
#import "Calendar.h"
#import "DateManerger.h"

@interface CalendarDateView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) Calendar *calendar;
@property (strong, nonatomic) NSDate *date;

@end

@implementation CalendarDateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CalendarDateView" owner:nil options:nil];
        CalendarDateView *calendarDateView = [views lastObject];
        self = calendarDateView;
        return self;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    
    self.calendarCollectionView.delegate = self;
    self.calendarCollectionView.dataSource = self;
    [self.calendarCollectionView registerClass:[CalendarWeekCollectionViewCell class] forCellWithReuseIdentifier:@"CalendarWeekCollectionViewCell"];
    self.calendarCollectionView.bounces = NO;
    self.calendar = [Calendar sharedCalendar];
    self.date = [NSDate date];

}

- (void)reloadUI {
    self.date = [[DateManerger sharedDateManerger] seletedDate];
    [self.calendarCollectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    DateManerger *dateManerger = [DateManerger sharedDateManerger];
    if (dateManerger.status == DSCALENDAR_STYLE_WEEK) {
        return 1;
    }
    return [self.calendar numberOfWeeksInCurrentMonth:self.date];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalendarWeekCollectionViewCell *cell = (CalendarWeekCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarWeekCollectionViewCell" forIndexPath:indexPath];
    DateManerger *dateManerger = [DateManerger sharedDateManerger];
    if (dateManerger.status == DSCALENDAR_STYLE_WEEK) {
        cell.currentWeek = [self.calendar week:[[DateManerger sharedDateManerger] seletedDate]];
    }
    else {
        cell.currentWeek = indexPath.item + 1;
    }
    [cell reloadUI];
    cell.calendar = self.calendar;
    cell.calendar.calendar = self.calendar.calendar;
    return cell;
}

@end
