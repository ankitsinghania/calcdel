//
//  ViewController.m
//  calc5
//
//  Created by ankit on 7/26/13.
//  Copyright (c) 2013 xperttech. All rights reserved.
//

#import "ViewController.h"
#import "Calc1.h"
@interface ViewController () <CalcDelegate>

@end

@implementation ViewController

@synthesize slider, sliderLabel;

- (void)viewDidLoad
{
    self.boxOne.delegate = self;
    self.boxTwo.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self displayAnswer];
}

- (IBAction)sliderChanged:(id)sender {
    
    if (slider.value == 1) {
        sliderLabel.text = @"Add";
    }
    if (slider.value > 1 && slider.value < 2) {
        sliderLabel.text = @"Subtract";
    }
    if (slider.value > 2 && slider.value < 3) {
        sliderLabel.text = @"Multiply";
    }
    if (slider.value == 3) {
        sliderLabel.text = @"Divide";
    }
    [self displayAnswer];
}

-(void) displayAnswer {
    [self.boxOne resignFirstResponder];
    Calc1 *calc1 = [[Calc1 alloc] init];
    [calc1 setDelegate:self];
    NSUInteger v1 = [self.boxOne.text integerValue];
    NSUInteger v2 = [self.boxTwo.text integerValue];
    NSString *op = self.sliderLabel.text;
    [calc1 fetchAnswer:v1 :v2 :op];
}



#pragma mark - caclDelegate
-(void)val1:(NSUInteger)value1 val2:(NSUInteger)value2 ans:(NSString *)answer
{
    self.answerLabel.text = answer;
}

@end
