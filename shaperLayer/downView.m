//
//  downView.m
//  shaperLayer
//
//  Created by aeieli on 14/12/8.
//  Copyright (c) 2014年 com.aeli.layershaper. All rights reserved.
//

#import "downView.h"

@implementation downView

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
    // Drawing code
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGRect pathRect;
    pathRect.size.width = w;
    pathRect.size.height = h;
    pathRect.origin.x = 0;
    pathRect.origin.y = 0;
    

    CGPathRef contentPath = [downView newContentPathBorder:pathRect];

    CGContextBeginPath (context);
    CGContextAddPath(context, contentPath);
    CGContextClosePath (context);
    CGContextClip(context);

    [self.image drawInRect:rect];
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    for (int i = 0 ; i < [_rectangleHieghtArray count]; i ++ ) {
        float scale = [[_rectangleHieghtArray objectAtIndex:i] floatValue];
        if (scale > 100) scale = 100;
        if (scale < 0) scale = 0;
        CGRect rectangleRect = [self newRectanglePathWithNumber:i HeightScale:scale];
        CGContextBeginPath(context);
        CGContextAddRect(context, rectangleRect);
        CGContextFillPath (context);
        
        UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(rectangleRect.origin.x + 5, rectangleRect.origin.y+ rectangleRect.size.height - 35, rectangleRect.size.width - 10, 20)];
        [titleLable setText:[NSString stringWithFormat:@"%d%%",(int)scale ]];
        [titleLable setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:titleLable];
    }
    
    //
    //    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    //    CGContextSaveGState(ctx);
    //
    //
    //    CGContextBeginPath (ctx);
    //    CGContextAddPath(ctx, contentPath);
    //    CGContextClosePath (ctx);
    //    CGContextFillPath(ctx);
    //    CGPathRelease(contentPath);
//    CGContextRestoreGState(ctx);
    

//    CGContextClip(ctx);
//    CGContextClearRect(ctx, CGContextGetClipBoundingBox(ctx));

//


//    CGContextClip(ctx);
//
//    CGContextBeginPath(ctx);
//    CGContextAddPath(ctx, contentPath);
//    CGContextSetRGBStrokeColor(ctx, 0.7, 0.7, 0.7, 1.0);
//    CGContextSetLineWidth(ctx, 1);
//    CGContextSetLineCap(ctx,kCGLineCapRound);
//    CGContextSetLineJoin(ctx, kCGLineJoinRound);
//    CGContextStrokePath(ctx);
}

+(CGPathRef)newContentPathBorder:(CGRect)rect {

    //drawing the border with arrow
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, rect.origin.x, rect.size.height/2);
    
    CGPathAddLineToPoint(path, NULL, rect.size.width, rect.origin.y);
    CGPathAddLineToPoint(path, NULL, rect.size.width, rect.size.height);
    CGPathAddLineToPoint(path, NULL, rect.origin.x, rect.size.height);
//    CGPathAddLineToPoint(path, NULL, rect.origin.x, ah);
    
    CGPathCloseSubpath(path);
    
    return path;
}

-(CGRect)newRectanglePathWithNumber:(int)numInt HeightScale:(float)scale{
    float rectangle_weight = (self.frame.size.width - _maright )/[_rectangleHieghtArray count] - _maright;//矩形宽度
    float rectangle_x1 =_maright + numInt * (_maright + rectangle_weight);//矩形左边点
    float rectangle_y0 = (self.frame.size.height * 0.5 ) * rectangle_x1 / self.frame.size.width ;//左边交点与屏幕左交点高度差
    float rectangle_y1 = (self.frame.size.height * 0.5 ) *  (rectangle_x1 + rectangle_weight) / self.frame.size.width ;//三角右顶点与斜切线交点与屏幕左交点的高度差
    CGRect pathRec;
    pathRec.origin.x = rectangle_x1;
    pathRec.origin.y = (self.frame.size.height * 0.5 ) - rectangle_y1;
    pathRec.size.width = rectangle_weight;
    pathRec.size.height = (rectangle_y1 - rectangle_y0) + (_hieght * scale / 100 );
    
    
    return pathRec;
}

@end
