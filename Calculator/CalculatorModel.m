//
//  CalculatorModel.m
//  Calculator
//
//  Created by Sturzenegger Joe on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorModel.h"

@interface CalculatorModel()

@property (nonatomic, strong) NSMutableArray *operandStack;
@end


@implementation CalculatorModel
@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack
{
    if (_operandStack == nil) 
    {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

-(void) setOperandStack:(NSMutableArray *)operandStack
{
    _operandStack = operandStack;
}

-(double) popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

- (void) pushOperand:(double)operand
{
    // wrap operand as an NSNumber because only objects can be added to the NSMutableArray
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}
-(double) performOperation:(NSString *)operation //amyjosturz@gmail.com St232*1ar&3
{
    double result = 0;
    
    if([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    }
    else if([operation isEqualToString:@"*"]){
        result = [self popOperand] * [self popOperand];
    }
    else if([operation isEqualToString:@"/"]){
        result = [self popOperand] / [self popOperand];
    }
    else if ([operation isEqualToString:@"-"]) {
        result = [self popOperand] - [self popOperand];
    }
    else if ([operation isEqualToString:@"sqrt"])
    {
        result = sqrt([self popOperand]);
    }
    else if ([operation isEqualToString:@"sin"]) {
        result = sin([self popOperand]);
    }
    else if ([operation isEqualToString:@"cos"]) {
        result = cos([self popOperand]);
    }
    [self pushOperand:result];
    
    return result;
}

@end
