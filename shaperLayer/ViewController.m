//
//  ViewController.m
//  shaperLayer
//
//  Created by aeieli on 14/12/8.
//  Copyright (c) 2014年 com.aeli.layershaper. All rights reserved.
//

#import "ViewController.h"
#import "downView.h"
#import "upView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    upView *up = [[upView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height* 2 /3)];
    up.rectangleHieghtArray = @[@0,@10,@45,@90];
    up.maright = 30;
    up.hieght = 300;
    [self.view addSubview:up];
    [up setNeedsDisplay];

    
    downView *down = [[downView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/3, self.view.frame.size.width, self.view.frame.size.height* 2 /3 )];
    
    down.rectangleHieghtArray = @[@0,@10,@45,@90];
    down.maright = 30;
    down.hieght = 300;
//    down.backgroundColor = [UIColor clearColor];
    down.image = [UIImage imageNamed:@"fancyBackground1"];

    [self.view addSubview:down];
    
    [down setNeedsDisplay];
    
   
    // Do any additional setup after loading the view, typically from a nib.


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
