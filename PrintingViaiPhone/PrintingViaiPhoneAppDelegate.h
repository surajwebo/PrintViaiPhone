//
//  PrintingViaiPhoneAppDelegate.h
//  PrintingViaiPhone
//
//  Created by Neeraj kapoor on 27/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PrintingViaiPhoneViewController;

@interface PrintingViaiPhoneAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PrintingViaiPhoneViewController *viewController;

@end
