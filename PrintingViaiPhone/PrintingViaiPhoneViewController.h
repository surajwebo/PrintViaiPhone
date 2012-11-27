//
//  PrintingViaiPhoneViewController.h
//  PrintingViaiPhone
//
//  Created by Neeraj kapoor on 27/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrintingViaiPhoneViewController : UIViewController <UIPrintInteractionControllerDelegate, UITextViewDelegate> {
    UIButton *printText;
    UITextView *txtViewForData;
}
@property (nonatomic, retain) IBOutlet UIButton *printText;
@property (nonatomic, retain) IBOutlet UITextView *txtViewForData;

- (IBAction)printTextViaiPhone:(id)sender;

@end
