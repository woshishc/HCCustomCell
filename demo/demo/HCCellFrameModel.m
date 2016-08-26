//
//  HCCellFrame.m
//  demo
//
//  Created by suhc on 16/3/10.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import "HCCellFrameModel.h"

@implementation HCCellFrameModel

- (void)setDataModel:(HCCellDataModel *)dataModel{
    _dataModel = dataModel;
    
    //计算label的frame
    CGFloat labelX = 12;
    CGFloat labelY = 12;
   
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 14;
    
    NSString *str = _dataModel.content;
    NSMutableDictionary *attrDic = [NSMutableDictionary dictionary];
    attrDic[NSParagraphStyleAttributeName] = paragraphStyle;
    attrDic[NSFontAttributeName] = [UIFont systemFontOfSize:13.f];
    
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - labelX * 2;
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil];
    
    CGFloat height = rect.size.height;
    CGFloat width = maxWidth;
    
    if (rect.size.width >= maxWidth) {
        //多行
        self.oneLine = NO;
    }else{
        //一行
        paragraphStyle.lineSpacing = 0;
        rect = [str boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil];
        height = rect.size.height;
        width = rect.size.width;
        self.oneLine = YES;
    }
    _labelFrame = CGRectMake(labelX, labelY, width, height);
    
    //图片的frame
    CGFloat imageX = labelX;
    CGFloat imageY = CGRectGetMaxY(_labelFrame) + 24;
    CGFloat imageWidth = 90;
    CGFloat imageHeight = imageWidth;
    _imageFrame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
    
    //cell的高度
    _cellHeight = CGRectGetMaxY(_imageFrame) + 12;
}

@end
