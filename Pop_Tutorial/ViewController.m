//
//  ViewController.m
//  Pop_Tutorial
//
//  Created by Sam Keene on 5/18/14.
//  Copyright (c) 2014 Sam Keene. All rights reserved.
//

#import "ViewController.h"
#import <POP/POP.h>

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *circle;
@property (nonatomic, assign) BOOL animatingOut;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.animatingOut = YES;
}

- (IBAction)btnAction:(id)sender
{
    [self.circle pop_removeAllAnimations];
    
    CGRect largeRect = CGRectMake(2.5,2.5, 0, 0);
    CGRect smallRect = CGRectMake(1.,1., 0, 0);
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    animation.springBounciness = 8;
    animation.springSpeed = 1.5;
    
    if (self.animatingOut) {
        animation.toValue = [NSValue valueWithCGRect:largeRect];
        self.animatingOut = NO;
    }
    else {
        animation.toValue = [NSValue valueWithCGRect:smallRect];
        self.animatingOut = YES;
        
    }
    
    [self.circle pop_addAnimation:animation forKey:@"size"];
}

@end
