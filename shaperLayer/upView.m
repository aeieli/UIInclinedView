//
//  upView.m
//  shaperLayer
//
//  Created by aeieli on 14/12/8.
//  Copyright (c) 2014年 com.aeli.layershaper. All rights reserved.
//

#import "upView.h"

@implementation upView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    for (int i = 0 ; i < [_rectangleHieghtArray count]; i ++ ) {
        float scale = [[_rectangleHieghtArray objectAtIndex:i] floatValue];
        if (scale > 100) scale = 100;
        if (scale < 0) scale = 0;
        scale = 100 -scale;
        CGRect rectangleRect = [self newRectanglePathWithNumber:i HeightScale:scale];
        CGContextBeginPath(context);
        CGContextAddRect(context, rectangleRect);
        CGContextFillPath (context);
        
        UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(rectangleRect.origin.x + 5, rectangleRect.origin.y + 15, rectangleRect.size.width - 10, 20)];
        [titleLable setText:[NSString stringWithFormat:@"%d%%",(int)scale ]];
        [titleLable setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:titleLable];
    }

}


-(CGRect)newRectanglePathWithNumber:(int)numInt HeightScale:(float)scale{
    float rectangle_weight = (self.frame.size.width - _maright )/[_rectangleHieghtArray count] - _maright;//矩形宽度
    float rectangle_x1 =_maright + numInt * (_maright + rectangle_weight);//矩形左边点
    float rectangle_y0 = (self.frame.size.height * 0.5 ) * rectangle_x1 / self.frame.size.width ;//左边交点与屏幕左交点高度差
    float rectangle_y1 = (self.frame.size.height * 0.5 ) *  (rectangle_x1 + rectangle_weight) / self.frame.size.width ;//三角右顶点与斜切线交点与屏幕左交点的高度差
    CGRect pathRec;
    pathRec.origin.x = rectangle_x1;
    pathRec.origin.y = self.frame.size.height - rectangle_y1 -(_hieght * scale / 100 );
    pathRec.size.width = rectangle_weight;
    pathRec.size.height = self.frame.size.height - rectangle_y0 - pathRec.origin.y;
    
    
    return pathRec;
}


@end
