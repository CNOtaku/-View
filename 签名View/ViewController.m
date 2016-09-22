//
//  ViewController.m
//  签名View
//
//  Created by 楊利嘉 on 2016/9/22.
//  Copyright © 2016年 楊利嘉. All rights reserved.
//

#import "ViewController.h"
#import "CHSignatureView.h"

#import "SecondViewController.h"
@interface ViewController ()
@property(nonatomic, strong)UIImage *saveImage;
@property(nonatomic, strong)CHSignatureView *sView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.view addSubview:self.sView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    button.frame = CGRectMake(30, 100, 50, 50);
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}
-(void)buttonClicked
{
    
    
    UIGraphicsBeginImageContext(self.sView.bounds.size);
    
    [self.sView.layer renderInContext:UIGraphicsGetCurrentContext()];
    _saveImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    UIGraphicsEndImageContext();
    
    SecondViewController *vc = [[SecondViewController alloc]init];
    
    vc.image = _saveImage;
    [self presentViewController:vc animated:YES completion:nil];
    
    
    
}


-(CHSignatureView *)sView
{
    if (!_sView) {
        _sView = [[CHSignatureView alloc]initWithFrame:self.view.bounds];
        _sView.backgroundColor = [UIColor whiteColor];
        
    }
    return _sView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
