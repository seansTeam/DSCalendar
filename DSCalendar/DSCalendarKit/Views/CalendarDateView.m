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

@interface CalendarDateView () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *calendarCollectionView;
@property (strong, nonatomic) Calendar *calendar;

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
    self.calendar = [[Calendar alloc] init];
    self.calendar.calendar = [NSCalendar currentCalendar];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSDate *date=[NSDate date];
    return [self.calendar numberOfWeeksInCurrentMonth:date];;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalendarWeekCollectionViewCell *cell = (CalendarWeekCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarWeekCollectionViewCell" forIndexPath:indexPath];
    cell.currentWeek = indexPath.item + 1;
    return cell;
}

@end
