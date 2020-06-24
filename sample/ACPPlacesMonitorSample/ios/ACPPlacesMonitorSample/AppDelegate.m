/*
Copyright 2020 Adobe
All Rights Reserved.
  NOTICE: Adobe permits you to use, modify, and distribute this file in
accordance with the terms of the Adobe license agreement accompanying
it. If you have received this file from a source other than Adobe,
then your use, modification, or distribution of it requires the prior
written permission of Adobe. (See LICENSE-MIT for details)
  */

#import "AppDelegate.h"

#import <React/RCTBridge.h>
  #import <React/RCTBundleURLProvider.h>
  #import <React/RCTRootView.h>
  #import <RCTACPCore/ACPCore.h>
  #import <RCTACPCore/ACPLifecycle.h>
  #import <RCTACPCore/ACPIdentity.h>
  #import <RCTACPCore/ACPSignal.h>
  #import <RCTACPPlaces/ACPPlaces.h>
  #import <RCTACPPlacesMonitor/ACPPlacesMonitor.h>


@implementation AppDelegate

  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
  moduleName:@"ACPPlacesMonitorSample"
  initialProperties:nil];

rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
UIViewController *rootViewController = [UIViewController new];
rootViewController.view = rootView;
self.window.rootViewController = rootViewController;
[self.window makeKeyAndVisible];

[ACPCore setLogLevel:ACPMobileLogLevelVerbose];
[ACPCore configureWithAppId:@"launch-EN81be7cedb7f14132968641a6ec683adf"];
[ACPCore setWrapperType:ACPMobileWrapperTypeReactNative];
[ACPIdentity registerExtension];
[ACPLifecycle registerExtension];
[ACPSignal registerExtension];
[ACPPlaces registerExtension];
[ACPPlacesMonitor registerExtension];


[ACPCore start:^{
       [ACPCore lifecycleStart:nil];
       
       [ACPPlacesMonitor start];
   }];

return YES;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
  {
    #if DEBUG
      return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
