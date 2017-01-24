```
/*
     正弦函数: y =Asin（ωx+φ）+C
     A 表示振幅，也就是使用这个变量来调整波浪的高度
     ω表示周期，也就是使用这个变量来调整在屏幕内显示的波浪的数量
     φ表示波浪横向的偏移，也就是使用这个变量来调整波浪的流动
     C表示波浪纵向的位置，也就是使用这个变量来调整波浪在屏幕中竖直的位置。
 */


typedef NS_ENUM(NSUInteger, WavesState) {
    wavesStateSin = 0,  //正弦函数
    wavesStateCos,
};


@interface WavesView : UIView
/**
 *   水纹振幅
 */
@property (nonatomic ,assign) CGFloat waveAmplitude;

/**
 *  位移
 */
@property (nonatomic ,assign) CGFloat offsetX;

/**
 *  水纹周期
 */
@property (nonatomic ,assign) CGFloat waterCycle;
/**
 *  当前波浪高度
 */
@property (nonatomic ,assign) CGFloat currentWaveHeight;
/**
 *  水纹速度
 */
@property (nonatomic ,assign) CGFloat wavesSpeed;
/**
 *  水纹宽度
 */
@property (nonatomic ,assign) CGFloat wavesWidth;
/**
 *  水纹颜色
 */
@property (nonatomic ,strong) UIColor *waveColor;

/**
 *  波纹类型  正弦函数  余弦函数
 */
@property (nonatomic) WavesState  wavesState;

/**
 *  波纹实例方法
 *
 *  @param waveAmplitude     水纹振幅
 *  @param waterCycle        水纹周期
 *  @param offsetX           位移
 *  @param currentWaveHeight 当前波浪高度Y
 *  @param wavesSpeed        水纹速度
 *  @param wavesWidth        水纹宽度
 *  @param waveColor         水纹颜色
 *  @param frame             视图布局
 *  @param wavesState        波纹类型
 *
 *  @return 波纹实例
 */

- (instancetype)initWithwaveAmplitude:(CGFloat)waveAmplitude
                           waterCycle:(CGFloat)waterCycle
                              offsetX:(CGFloat)offsetX
                    currentWaveHeight:(CGFloat)currentWaveHeight
                           wavesSpeed:(CGFloat)wavesSpeed
                           wavesWidth:(CGFloat)wavesWidth
                            waveColor:(UIColor *)waveColor
                                frame:(CGRect)frame
                           wavesState:(WavesState)wavesState;

@end

```
