//
//  calc.m
//  calc5
//
//  Created by ankit on 7/26/13.
//  Copyright (c) 2013 xperttech. All rights reserved.
//

#import "calc.h"

@interface calc()

@property (nonatomic) NSUInteger value1;
@property (nonatomic) NSUInteger value2;

@end

@implementation calc

-(NSString *) calculateValue:(NSUInteger)value1
                     :(NSUInteger)value2
                     :(NSString *) operator {
    self.value1 = value1;
    self.value2 = value2;
    
    NSUInteger value = 0;
    
    if ([operator isEqualToString:@"Add"]) {
        value = value1 + value2;
        
    }
    
    if ([operator isEqualToString:@"Sub"]) {
        value = value1 - value2;
        
    }
    
    if ([operator isEqualToString:@"Mult"]) {
        value = value1 * value2;
        
    }
    
    if ([operator isEqualToString:@"Div"]) {
        value = value1 + value2;
        
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
