//
//  PrintingViaiPhoneViewController.m
//  PrintingViaiPhone
//
//  Created by Neeraj kapoor on 27/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PrintingViaiPhoneViewController.h"

@implementation PrintingViaiPhoneViewController
@synthesize printText;
@synthesize txtViewForData;

- (void)dealloc
{
    [printText release];
    [txtViewForData release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void)viewDidUnload
{
    [self setPrintText:nil];
    [self setTxtViewForData:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)printTextViaiPhone:(id)sender {
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    pic.delegate = self;
    
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    printInfo.outputType = UIPrintInfoOutputGeneral;
    printInfo.jobName = @"Print"; 
    pic.printInfo = printInfo;
    
    UISimpleTextPrintFormatter *textFormatter = [[UISimpleTextPrintFormatter alloc]
                                                 initWithText:txtViewForData.text]; 
    textFormatter.startPage = 0;
    textFormatter.contentInsets = UIEdgeInsetsMake(72.0, 72.0, 72.0, 72.0); // 1 inch margins from all sides
    textFormatter.maximumContentWidth = 6 * 72.0;
    pic.printFormatter = textFormatter;
    [textFormatter release];
    pic.showsPageRange = YES;
    
    void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
    ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
        if (!completed && error) {
            NSLog(@"Printing could not complete because of error: %@", error);
        }
    };
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        //[pic presentFromBarButtonItem:self.printButton animated:YES completionHandler:completionHandler];
        NSLog(@"iOS device detected is iPad");
    } else {
        [pic presentAnimated:YES completionHandler:completionHandler];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {        
        [txtViewForData resignFirstResponder];
        return NO;
    }
    return YES;
}
@end
