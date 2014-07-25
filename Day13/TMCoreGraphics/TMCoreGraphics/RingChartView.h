//
//  ViewDotNutChart.h
//  TMCoreGraphics
//
//  Created by techmaster on 2/8/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "QuartzView.h"
#import <QuartzCore/QuartzCore.h>
@interface RingChartView : QuartzView
@property (nonatomic, strong) UIColor * fillColor;
@property (nonatomic, strong) UIColor * lineColor;
@property (nonatomic, assign) float outerRadius;
@property (nonatomic, assign) float ringWidth;
@property (nonatomic, assign) float lineWidth;
@property (nonatomic, assign) float maxValue;
@property (nonatomic, assign) float value;
@property (nonatomic, assign) CGPoint center;
@end


@interface RingLayer : CALayer
@property (nonatomic, strong) UIColor * fillColor;
@property (nonatomic, strong) UIColor * lineColor;
@property (nonatomic, assign) float outerRadius;
@property (nonatomic, assign) float ringWidth;
@property (nonatomic, assign) float lineWidth;
@property (nonatomic, assign) float value;
@property (nonatomic, assign) float maxValue;
@property (nonatomic, assign) CGPoint center;
@end
