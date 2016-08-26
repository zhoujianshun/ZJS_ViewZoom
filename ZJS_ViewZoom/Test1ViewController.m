//
//  Test1ViewController.m
//  ZJS_ViewZoom
//
//  Created by 周建顺 on 15/12/24.
//  Copyright © 2015年 周建顺. All rights reserved.
//

#import "Test1ViewController.h"
#import "ZJSZoomView.h"

@interface Test1ViewController ()

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    ZJSZoomView *zoomV = [[ZJSZoomView alloc] init];
    zoomV.backgroundColor  = [UIColor yellowColor];
    zoomV.frame = CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    [self.view addSubview:zoomV];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
