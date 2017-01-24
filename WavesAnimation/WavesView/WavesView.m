//
//  WavesView.m
//  WavesAnimation
//
//  Created by Kenvin on 17/1/25.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//


#import "WavesView.h"

@interface WavesView ()

@property (nonatomic,strong) CADisplayLink *waveDisplayLink;

@property (nonatomic,strong) CAShapeLayer *waveLayer;


@end

@implementation WavesView


- (instancetype)initWithwaveAmplitude:(CGFloat)waveAmplitude
                           waterCycle:(CGFloat)waterCycle
                              offsetX:(CGFloat)offsetX
                    currentWaveHeight:(CGFloat)currentWaveHeight
                           wavesSpeed:(CGFloat)wavesSpeed
                           wavesWidth:(CGFloat)wavesWidth
                            waveColor:(UIColor *)waveColor
                                frame:(CGRect)frame
                           wavesState:(WavesState)wavesState{
    
    self = [self initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = YES;
        
        self.waveAmplitude = waveAmplitude;
        self.waterCycle    = waterCycle;
        self.offsetX       = offsetX;
        self.wavesSpeed    = wavesSpeed;
        self.wavesWidth    = wavesWidth;
        self.wavesState    = wavesState;
        self.waveColor     = waveColor;
        self.currentWaveHeight  = currentWaveHeight;
        [self setUpWaves];
    }
    return self;
}

- (void)setUpWaves{

    //初始化layer
    if (self.waveLayer == nil) {
        
        //初始化
        self.waveLayer = [CAShapeLayer layer];
        //设置闭环的颜色
        self.waveLayer.fillColor = self.waveColor.CGColor;
        //设置边缘线的颜色
        //_firstWaveLayer.strokeColor = [UIColor blueColor].CGColor;
        //设置边缘线的宽度
        //self.firstWavesLayer.lineWidth = 1.0;
        //        self.firstWavesLayer.strokeStart = 0.0;
        //        self.firstWavesLayer.strokeEnd = 0.8;
        
        [self.layer addSublayer:self.waveLayer];
    }
    
    //启动定时器
    self.waveDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
    
    [self.waveDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)getCurrentWave:(CADisplayLink *)displayLink{
    
    //实时的位移
    //实时的位移
    self.offsetX += self.wavesSpeed;
    
    [self setCurrentFirstWaveLayerPath];
}

-(void)setCurrentFirstWaveLayerPath{
    
    //创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat y = self.currentWaveHeight;
    //将点移动到 x=0,y=currentWaveHeight的位置
    CGPathMoveToPoint(path, nil, 0, y);
    
    for (NSInteger i =0.0f; i<=self.wavesWidth; i++) {
        //正弦函数波浪公式
        switch (self.wavesState) {
            case wavesStateSin:{
                y = self.waveAmplitude * sin(self.waterCycle * i+ self.offsetX)+self.currentWaveHeight;

            }
                break;
                
            case wavesStateCos:{
                 y = self.waveAmplitude * cos(self.waterCycle*i + self.offsetX)+self.currentWaveHeight;
            }
            default:
                break;
        }
        
        //将点连成线
        CGPathAddLineToPoint(path, nil, i, y);
    }
    
    CGPathAddLineToPoint(path, nil, self.wavesWidth, 0);
    CGPathAddLineToPoint(path, nil, 0, 0);
    
    CGPathCloseSubpath(path);
    self.waveLayer.path = path;
    
    //使用layer 而没用CurrentContext
    CGPathRelease(path);
    
}

-(void)dealloc{
    [self.waveDisplayLink invalidate];
}


@end
