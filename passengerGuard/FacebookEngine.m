//
//  FacebookEngine.m
//  passengerGuard
//
//  Created by Huang, Hong-Yi (Agoda) on 4/22/2559 BE.
//  Copyright © 2559 Huang, Hong-Yi (Agoda). All rights reserved.
//

#import "FacebookEngine.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@implementation FacebookEngine: NSObject

-(void)addLoginButton:(UIView *)container
{
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    //loginButton.center = container.center;
    loginButton.center = CGPointMake(container.frame.size.width  / 2, container.frame.size.height / 2);
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    [container addSubview:loginButton];
}

-(BOOL)isUserLoggedIn {
    FBSDKAccessToken *accessToken = [FBSDKAccessToken currentAccessToken];
    if (accessToken.tokenString) {
        return YES;
    } else {
        return NO;
    }
}

@end