//
//  HCLabel.m
//  demo
//
//  Created by suhc on 16/3/10.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import "HCLabel.h"

@implementation HCLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.numberOfLines = 0;
    }
    return self;
}

- (void)setText:(NSString *)text{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = _linePadding;
    
    NSMutableDictionary *attrDic = [NSMutableDictionary dictionary];
    attrDic[NSParagraphStyleAttributeName] = paragraphStyle;
    attrDic[NSFontAttributeName] = self.font;
    
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:text attributes:attrDic];

    [super setAttributedText:attrStrM];
}

@end
