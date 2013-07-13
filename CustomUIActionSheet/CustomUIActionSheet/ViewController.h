//
//  ViewController.h
//  CustomUIActionSheet
//
//  Created by Mumen Shabaro on 7/14/13.
//  Copyright (c) 2013 Mumen Shabaro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController  <UIActionSheetDelegate, UITableViewDataSource, UITableViewDelegate> {
    UIActionSheet *actionSheet;
    NSMutableArray *fontNames;
}

- (IBAction)buttonClicked:(id)sender;

@end
