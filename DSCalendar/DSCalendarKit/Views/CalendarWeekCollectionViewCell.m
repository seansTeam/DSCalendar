//
//  CalendarWeekCollectionViewCell.m
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "CalendarWeekCollectionViewCell.h"
#import "DateCollectionViewCell.h"

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

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 7;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    DateCollectionViewCell *cell = (DateCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DateCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    return CGSizeMake(screenWidth/(double)7, 100);
}

@end