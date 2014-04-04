//
//  AppDelegate.m
//  Task1103
//
//  Created by Omnipresent on 11/03/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@implementation AppDelegate
@synthesize viewObj;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    NSString *pathsToReources = [[NSBundle mainBundle] resourcePath];
//    NSString *yourOriginalDatabasePath = [pathsToReources stringByAppendingPathComponent:@"Task1103.sqlite"];
//    
//    NSArray *pathsToDocuments = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    NSString *documentsDirectory = [pathsToDocuments objectAtIndex: 0];
//    
//    
//    NSString *dbPath = [documentsDirectory stringByAppendingPathComponent:@"Task1103.sqlite"];
//    
//   
//    if (![[NSFileManager defaultManager] isReadableFileAtPath: dbPath]) {
//        
//        if ([[NSFileManager defaultManager] copyItemAtPath: yourOriginalDatabasePath toPath: dbPath error: NULL] != YES)
//            
//            NSAssert2(0, @"Fail to copy database from %@ to %@", yourOriginalDatabasePath, dbPath);
//        
//    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewObj = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewObj;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [Parse setApplicationId:@"em99Mmp02T9NRyfbAgWQd2YvQob9uNcC9ykKYo7A"
                  clientKey:@"sPullVnmae1IyhURaVYOilui1nf4vNoTdFiCLjvr"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
//    
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
