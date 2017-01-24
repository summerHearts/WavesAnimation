//
//  ViewController.m
//  WavesAnimation
//
//  Created by Kenvin on 17/1/25.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "ViewController.h"
#import "WavesView.h"
@interface ViewController ()

@property (nonatomic,strong) WavesView *wavesView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
    
}

- (void)initViews{
    [self initWavesView];
}

- (void)initWavesView{

    self.wavesView = [[WavesView alloc]initWithwaveAmplitude:12.0f
                                                  waterCycle:0.5/30.0
                                                     offsetX:0.0f
                                           currentWaveHeight:110
                                                  wavesSpeed:0.02
                                                  wavesWidth:[UIScreen mainScreen].bounds.size.width
                                                   waveColor:[UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1]
                                                       frame:CGRectMake(0, 100, self.view.frame.size.width, 220)
                                                  wavesState:wavesStateSin];
    self.wavesView.alpha=0.6;
    [self.view addSubview:self.wavesView];
}
@end
