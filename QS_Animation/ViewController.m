//
//  ViewController.m
//  QS_Animation
//
//  Created by jingshuihuang on 16/6/29.
//  Copyright © 2016年 QS. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PocketSVG.h"
@interface ViewController ()
@property (nonatomic , strong) UILabel * flyLabel;;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flyLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [self.view addSubview:self.flyLabel];
    self.flyLabel.backgroundColor = [UIColor redColor];
    self.flyLabel.layer.cornerRadius = 10;
    self.flyLabel.clipsToBounds = YES;
    
    [self addFlyAnimation];
    
  
    // Do any additional setup after loading the view, typically from a nib.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}
- (void)addFlyAnimation
{
    CGPathRef path = [PocketSVG pathFromSVGFileNamed:@"BezierCurve1"];
    CAShapeLayer *myShapeLayer = [CAShapeLayer layer];
    myShapeLayer.path = path;
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    bezierPath.CGPath = path;
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.path = bezierPath.CGPath;
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    keyFrameAnimation.duration = 6;
    
    [self.flyLabel.layer addAnimation:keyFrameAnimation forKey:@"positionOnPath"];

    [UIView animateWithDuration:5 animations:^{
        self.flyLabel.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.flyLabel removeFromSuperview];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
