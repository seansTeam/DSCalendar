//
//  CalendarHeaderView.m
//  DSCalendar
//
//  Created by Sean Yang on 2015/1/8.
//  Copyright (c) 2015年 Sean Yang. All rights reserved.
//

#import "CalendarHeaderView.h"
#import "DateManarger.h"
#import "Calendar.h"
#import "WeekTitleUICollectionViewCell.h"

@interface CalendarHeaderView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *weekStrings;
@property (weak, nonatomic) IBOutlet UICollectionView *weekTitleCollectionView;


@end

@implementation CalendarHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CalendarHeaderView" owner:nil options:nil];
        CalendarHeaderView *calendarHeaderView = [views lastObject];
        calendarHeaderView.weekStrings = [[NSMutableArray alloc] init];
        
        [calendarHeaderView.weekStrings addObject:NSLocalizedString(@"Sun", nil)];
        [calendarHeaderView.weekStrings addObject:NSLocalizedString(@"Mon", nil)];
        [calendarHeaderView.weekStrings addObject:NSLocalizedString(@"Tue", nil)];
        [calendarHeaderView.weekStrings addObject:NSLocalizedString(@"Wed", nil)];
        [calendarHeaderView.weekStrings addObject:NSLocalizedString(@"Thu", nil)];
        [calendarHeaderView.weekStrings addObject:NSLocalizedString(@"Fri", nil)];
        [calendarHeaderView.weekStrings addObject:NSLocalizedString(@"Sat", nil)];
        
        calendarHeaderView.weekTitleCollectionView.delegate = calendarHeaderView;
        calendarHeaderView.weekTitleCollectionView.dataSource = calendarHeaderView;
        [calendarHeaderView.weekTitleCollectionView registerClass:[WeekTitleUICollectionViewCell class] forCellWithReuseIdentifier:@"WeekTitleUICollectionViewCell"];
        self = calendarHeaderView;
        [self setCalendarHeader];
        return self;
    }
    return self;
}

- (IBAction)onTouchLastMonthButton:(UIButton *)sender {
    Calendar *calendar = [Calendar sharedCalendar];
    NSDate *date = [calendar getFirstDayOfTheCalendarFromDate:[[DateManarger sharedDateManarger] seletedDate]];
    NSDate *newDate = [calendar getLastDateFromDate:date];
    DateManarger *dateManarger = [DateManarger sharedDateManarger];
    dateManarger.seletedDate = [calendar getFirstDayOfTheMonthFromDate:newDate];
    [self.delegate changeMonth:dateManarger.seletedDate];
}

- (IBAction)onTouchNextMonthButton:(UIButton *)sender {
    Calendar *calendar = [Calendar sharedCalendar];
    NSDate *date = [calendar getFirstDayOfTheMonthFromDate:[[DateManarger sharedDateManarger] seletedDate]];
    NSInteger number = [calendar numberOfDaysInCurrentMonth:date];
    for (int i = 1; i <= number; i++) {
        date = [calendar getNextDateFromDate:date];
    }
    DateManarger *dateManarger = [DateManarger sharedDateManarger];
    dateManarger.seletedDate = [calendar getFirstDayOfTheMonthFromDate:date];
    [self.delegate changeMonth:dateManarger.seletedDate];
}

- (void)setCalendarHeader {
    NSDate *date = [[DateManarger sharedDateManarger] seletedDate];
    NSCalendar *calendar = [[Calendar sharedCalendar] calendar];
    NSCalendarUnit flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponents = [calendar components:flags fromDate:date];
    NSString *monthString = [[NSString alloc] init];
    switch (dateComponents.month) {
        case 1:
            monthString = NSLocalizedString(@"January", nil);
            break;
        case 2:
            monthString = NSLocalizedString(@"February", nil);
            break;
        case 3:
            monthString = NSLocalizedString(@"March", nil);
            break;
        case 4:
            monthString = NSLocalizedString(@"April", nil);
            break;
        case 5:
            monthString = NSLocalizedString(@"May", nil);
            break;
        case 6:
            monthString = NSLocalizedString(@"June", nil);
            break;
        case 7:
            monthString = NSLocalizedString(@"July", nil);
            break;
        case 8:
            monthString = NSLocalizedString(@"August", nil);
            break;
        case 9:
            monthString = NSLocalizedString(@"September", nil);
            break;
        case 10:
            monthString = NSLocalizedString(@"October", nil);
            break;
        case 11:
            monthString = NSLocalizedString(@"November", nil);
            break;
        case 12:
            monthString = NSLocalizedString(@"December", nil);
            break;
        default:
            break;
    }
    [self.thisMonthTitleLabel setText:[NSString stringWithFormat:@"%@ %zd",monthString ,dateComponents.year]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WeekTitleUICollectionViewCell *cell = (WeekTitleUICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"WeekTitleUICollectionViewCell" forIndexPath:indexPath];
    [cell.weekTitleLabel setText:self.weekStrings[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return CGSizeMake(screenRect.size.width / 7.0f, self.weekTitleCollectionView.bounds.size.height);
}

@end
