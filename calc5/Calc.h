//
//  calc.h
//  calc5
//
//  Created by ankit on 7/26/13.
//  Copyright (c) 2013 xperttech. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CalcDelegate <NSObject>

-(void)val1:(NSUInteger)value1 val2:(NSUInteger)value2 ans:(NSString *)answer;

@end

@interface calc : NSObject
@property (nonatomic, weak) id <CalcDelegate> delegate;

@end
