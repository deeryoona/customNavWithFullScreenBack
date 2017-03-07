//
//  YWNavViewController.m
//  手势侧滑返回
//
//  Created by jhyw12 on 16/6/30.
//  Copyright © 2016年 jhyw12. All rights reserved.
//

#import "YWNavViewController.h"

@interface YWNavViewController () <UIGestureRecognizerDelegate>

@end

@implementation YWNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setUpEdgeBack];
    
    
}


// 自定义边缘侧滑返回
- (void)setUpEdgeBack {
    UIScreenEdgePanGestureRecognizer *pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    pan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
}

// 自定义全屏侧滑返
- (void)setUpFullScreenBack {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count != 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:0 target:self action:@selector(backBtn)];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)backBtn {
    [self popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count >= 2;
}
@end
