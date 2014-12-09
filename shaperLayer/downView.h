//
//  downView.h
//  shaperLayer
//
//  Created by aeieli on 14/12/8.
//  Copyright (c) 2014年 com.aeli.layershaper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface downView : UIView

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSArray *rectangleHieghtArray;

@property (nonatomic) float maright;//矩形与屏幕边距
@property (nonatomic) float hieght; //矩形总高度（百分之百显示高度）

//@property (nonatomic) int Max_Number_Rectangle;

+(CGPathRef)newContentPathBorder:(CGRect)rect;
@end
