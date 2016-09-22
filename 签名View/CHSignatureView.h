//
//  CHSignatureView.h
//  签名View
//
//  Created by 楊利嘉 on 2016/9/22.
//  Copyright © 2016年 楊利嘉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHSignatureView : UIView

@property(nonatomic, strong)NSMutableArray *points;

@property(nonatomic, assign)IBInspectable CGFloat lineWidth;

@property(nonatomic, strong)IBInspectable UIColor *color;

@property(nonatomic, assign, getter=isDraw)BOOL drawed;

-(void)back;
-(void)clear;



@end
