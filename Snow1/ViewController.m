//
//  ViewController.m
//  Snow1
//
//  Created by Mac on 15-3-16.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
//    背景颜色在DidLoad中修改  提高运行效率
    self.view.backgroundColor = [UIColor blackColor];

//    1. 雪花不停的下落
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:(0.05) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    
    [timer fire];

}




- (void)onTimer
{
    
//    2.创建雪花图片视图的对象，位置是随机的
//    不停的创建对象
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"flake"];
    
//    取余 （要考试）  雪花图片有宽度 （321 - 50）
    int i = arc4random()%(321-30);
   imageView.frame = CGRectMake(i, -20, 30, 30);
//    在视图控制器中创建并显示
    [self.view addSubview:imageView];
    
    
    
//    3. UIView动画
//    animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
//    context  上下文
    [UIView beginAnimations:@"a" context:(__bridge void *)(imageView)];
    [UIView setAnimationDuration:2];
  
//    定义结束坐标
    int j = arc4random()%(321-50);
    imageView.frame =CGRectMake(j, 480-30, 30, 30);
    
//    设置透明度使雪花消失
//    imageView.alpha = 0;

    
    
    
//   4. 移除   动画后选择的方法
//    Delegate  代理   设置代理后才可以调用动画结束后的方法
//    self 自身调用的方法
    [UIView setAnimationDelegate:self];
//   动画结束后会选择的一个方法
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
//  5.  在结尾添加 commitAnimations 提交动画
    [UIView commitAnimations];

}



//动画结束后调用的方法

//  alt键 进入后 复制该方法
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
//    NSLog(@" 动画结束了");
    
//    [imageView removeFromSuperview];
    
//    强制类型转换
    UIImageView *imageView = (__bridge UIImageView *)context;
    [imageView removeFromSuperview];
//    设置透明度
//    imageView.alpha = 0;

}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
