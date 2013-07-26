//
//  calc.m
//  calc5
//
//  Created by ankit on 7/26/13.
//  Copyright (c) 2013 xperttech. All rights reserved.
//

#import "Calc1.h"

@interface Calc1()

@property (nonatomic) NSUInteger cvalue1;
@property (nonatomic) NSUInteger cvalue2;

@end

@implementation Calc1

-(NSString *) calculateValue:(NSUInteger)value1
                            :(NSUInteger)value2
                            :(NSString *) operator {
    self.cvalue1 = value1;
    self.cvalue2 = value2;
    
    NSUInteger value = 0;
    
    if ([operator isEqualToString:@"Add"]) {
        value = value1 + value2;
        
    }
    
    if ([operator isEqualToString:@"Subtract"]) {
        value = value1 - value2;
        
    }
    
    if ([operator isEqualToString:@"Multiply"]) {
        value = value1 * value2;
        
    }
    
    if ([operator isEqualToString:@"Divide"]) {
        value = value1 / value2;
        
    }
    NSString *answer = [NSString stringWithFormat:@"%d",value];
    
    return answer;
    
}

-(void)fetchAnswer:(NSUInteger) value1 :(NSUInteger) value2 :(NSString *) operator
{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *answer = [self calculateValue:value1 :value2 :operator];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate val1:value1 val2:value2 ans:answer];
        });
    });
}

@end
