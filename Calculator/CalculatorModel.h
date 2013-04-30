//
//  CalculatorModel.h
//  Calculator
//
//  Created by Sturzenegger Joe on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

- (void) pushOperand:(double)operand;
-(double) performOperation:(NSString *)operation;

@end
