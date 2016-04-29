//
//  FacebookEngine.h
//  passengerGuard
//
//  Created by Huang, Hong-Yi (Agoda) on 4/22/2559 BE.
//  Copyright © 2559 Huang, Hong-Yi (Agoda). All rights reserved.
//

#ifndef FacebookEngine_h
#define FacebookEngine_h


#endif /* FacebookEngine_h */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface FacebookEngine : NSObject

@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) ACAccount *facebookAccount;

// This uses dispatch_once method from Grand Central Dispatch (GCD).
// This is thread safe and handled entirely by the OS for you so that you don’t have to worry about it at all.
+(FacebookEngine *)sharedInstance;

// This uses normal way of initializing a singleton without GCD
+(FacebookEngine *)sharedManager;
-(void)addLoginButton:(UIView *)container;
-(BOOL)isUserLoggedIn;
-(void)facebookLogin;
-(BOOL)isFacebookUserLoggedIn;
@end