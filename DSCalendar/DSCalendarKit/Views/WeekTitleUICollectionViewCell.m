//
//  WeekTitleUICollectionViewCell.m
//  BabyDiary
//
//  Created by Sean Yang on 2015/6/25.
//  Copyright (c) 2015年 sean.yang. All rights reserved.
//

#import "WeekTitleUICollectionViewCell.h"

@implementation WeekTitleUICollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Init collectionCell.xib
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"WeekTitleUICollectionViewCell" owner:self options:nil];
        
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
}

@end
