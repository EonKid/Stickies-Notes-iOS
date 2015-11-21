//
//  Sticky.h
//  Stickies
//
//  Created by Dhruv on 21/11/15.
//  Copyright (c) 2015 whynoceros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface Sticky : UIView {

    IBOutlet UIImageView    *bgView;
    
}

@property (nonatomic, strong) IBOutlet UIImageView  *bgView;

- (IBAction)mute;
@end
