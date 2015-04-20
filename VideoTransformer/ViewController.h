//
//  ViewController.h
//  VideoTransformer
//
//  Created by Jesse James II on 4/20/15.
//  Copyright (c) 2015 Jesse James II. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@interface ViewController : UIViewController <YTPlayerViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *gestureLayer;
@property (strong, nonatomic) IBOutlet YTPlayerView *playerView;


@end

