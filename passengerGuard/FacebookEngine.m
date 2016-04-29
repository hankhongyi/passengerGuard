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

NSString *facebookAPIKey = @"854551464673624";
NSString *facebookAccountKey = @"FacebookAccount";


+(id)sharedInstance {
    static FacebookEngine *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+(id)sharedManager {
    static FacebookEngine *sharedEngineManager = nil;
    @synchronized(self) {
        if (sharedEngineManager == nil)
            sharedEngineManager = [[self alloc] init];
    }
    return sharedEngineManager;
}

- (id)init {
    if (self = [super init]) {
        _accountStore = [[ACAccountStore alloc] init];
    }
    return self;
}

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

-(void)facebookLogin {
    ACAccountType *facebookTypeAccount = [_accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    
    [_accountStore requestAccessToAccountsWithType:facebookTypeAccount
            options:@{ACFacebookAppIdKey: facebookAPIKey, ACFacebookPermissionsKey: @[@"email", @"user_posts"]}
            completion:^(BOOL granted, NSError *error) {
            if(granted){
                NSArray *accounts = [_accountStore accountsWithAccountType:facebookTypeAccount];
                _facebookAccount = [accounts lastObject];
                [[NSUserDefaults standardUserDefaults]setObject:_facebookAccount forKey:facebookAccountKey];
                [[NSUserDefaults standardUserDefaults] synchronize];
                NSLog(@"Login success");
            }else{
                NSLog(@"Login fail");
                NSLog(@"Error message: %@", error);
            }
    }];
}

-(BOOL)isFacebookUserLoggedIn {
    ACAccount *savedAccount = [[NSUserDefaults standardUserDefaults] objectForKey:facebookAccountKey];
    if (savedAccount != nil) {
        return YES;
    }
    return NO;
}

@end