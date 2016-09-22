//
//  DateCollectionViewCell.m
//  DSCalendar
//
//  Created by Sean Yang on 2014/12/19.
//  Copyright (c) 2014年 Sean Yang. All rights reserved.
//

#import "DateCollectionViewCell.h"
#import "DateManarger.h"

@implementation DateCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Init collectionCell.xib
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"DateCollectionViewCell" owner:self options:nil];
        
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

- (IBAction)onTouchDateButton:(UIButton *)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[DateManarger sharedDateManarger] dateDidseleted:self.date];
    });
}

@end
