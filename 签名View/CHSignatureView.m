//
//  CHSignatureView.m
//  签名View
//
//  Created by 楊利嘉 on 2016/9/22.
//  Copyright © 2016年 楊利嘉. All rights reserved.
//

#import "CHSignatureView.h"

#define kDefaultWidth 5

#define kDefaultColor [UIColor blackColor]


@implementation CHSignatureView


-(void)clear
{
    [self.points removeAllObjects];
    self.drawed = NO;
    [self setNeedsDisplay];
}

-(void)back
{
    [self.points removeAllObjects];
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.drawed = YES;
    
//    UIScrollView *scrollView = (UIScrollView *)self.superview;
//    scrollView.scrollEnabled = NO;
    
    UITouch *touch = [touches anyObject];
    CGPoint  startPoint = [touch locationInView:touch.view];

    UIBezierPath *path = [UIBezierPath bezierPath];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path moveToPoint:startPoint];
    
    [self.points addObject:path];
    
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:touch.view];
    
    UIBezierPath *currentPath = self.points.lastObject;
    
    [currentPath addLineToPoint:currentPoint];
    
    [self setNeedsDisplay];
}



-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
    
//    UIScrollView *scrollView = (UIScrollView *)self.superview;
//    scrollView.scrollEnabled = YES;
}

-(void)drawRect:(CGRect)rect
{
    [self.color set];
    
    for (UIBezierPath *path in self.points) {
        path.lineWidth = self.lineWidth;
        
        [path stroke];
    }
}


-(NSMutableArray *)points
{
    if (!_points) {
        _points = [[NSMutableArray alloc]init];
        
    }
    return _points;
}

-(CGFloat)lineWidth
{
    if (!_lineWidth) {
        _lineWidth = kDefaultWidth;
    }
    
    return _lineWidth;
}

-(UIColor *)color
{
    if (!_color) {
        _color = kDefaultColor;
    }
    return _color;
}



@end
