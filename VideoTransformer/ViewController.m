//
//  ViewController.m
//  VideoTransformer
//
//  Created by Jesse James II on 4/20/15.
//  Copyright (c) 2015 Jesse James II. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.playerView.delegate = self;
    NSDictionary *playerVars = @{
                                 @"playsinline" : @1,
                                 };
    [self.playerView loadWithVideoId:@"grmuFkCdz3s" playerVars:playerVars];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveWithPan:)];
    [self.view addGestureRecognizer:panGesture];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [self.view addGestureRecognizer:pinchGesture];
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationHandler:)];
    [self.view addGestureRecognizer:rotationGesture];
}

-(void)rotationHandler:(UIRotationGestureRecognizer*)rotationGesture
{
    self.gestureLayer.transform = CGAffineTransformRotate(self.gestureLayer.transform, rotationGesture.rotation);
    
    rotationGesture.rotation = 0.0;
}

-(void)handlePinch:(UIPinchGestureRecognizer*)pinchGesture
{
    self.gestureLayer.transform = CGAffineTransformScale(self.gestureLayer.transform, pinchGesture.scale, pinchGesture.scale);
    
    pinchGesture.scale = 1.0;
}

-(void)moveWithPan:(UIPanGestureRecognizer*)panGesture
{
    CGPoint touchLocation = [panGesture locationInView:self.view];
    
    self.gestureLayer.center = touchLocation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state
{
    switch (state) {
        case kYTPlayerStatePlaying:
            NSLog(@"Started Playing");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Player Paused");
            break;
        default:
            break;
    }
}


@end
