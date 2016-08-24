//
//  Calculator.m
//  Sample
//
//  Created by user on 2016. 8. 23..
//  Copyright © 2016년 ldcc. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(void)clear
{
    self.accumulator = 0; //self는 (객체 자신) 인스턴스에 있는 속성에 넣는다 멤버 변수 역할
}
-(void)add:(double)value
{
    self.accumulator += value;
}
-(void)subtract:(double)value
{
    self.accumulator -= value;
}
-(void)multiply:(double)value
{
    self.accumulator *= value;
}
-(void)divide:(double)value
{
    self.accumulator /= value;
}
@end
