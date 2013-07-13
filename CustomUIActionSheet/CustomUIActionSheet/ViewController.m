//
//  ViewController.m
//  CustomUIActionSheet
//
//  Created by Mumen Shabaro on 7/14/13.
//  Copyright (c) 2013 Mumen Shabaro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *actionSheetTitle = @"Select a font"; //Action Sheet Title
    NSString *cancelTitle = @"Cancel Button";
    actionSheet = [[UIActionSheet alloc]
                   initWithTitle:actionSheetTitle
                   delegate:self
                   cancelButtonTitle:nil
                   destructiveButtonTitle:nil
                   otherButtonTitles:@"1", @"2", @"3", @"4", @"5",nil];
    
    UITableView *view = [[UITableView alloc] initWithFrame:CGRectMake(20,44, 280, 260) style:UITableViewStylePlain];
    [view setDelegate:self];
    [view setDataSource:self];
    
    CALayer *layer = view.layer;
    layer.borderWidth = 3;
    layer.borderColor = [[UIColor blackColor] CGColor];
    layer.cornerRadius = 10;
    layer.masksToBounds = YES;
    
    fontNames = [[NSMutableArray alloc] init];
    
    // get font family
    NSArray *fontFamilyNames = [UIFont familyNames];
    
    // loop
    for (NSString *familyName in fontFamilyNames)
    {
        NSLog(@"Font Family Name = %@", familyName);
        
        // font names under family
        NSArray *names = [UIFont fontNamesForFamilyName:familyName];
        
        // add to array
        [fontNames addObjectsFromArray:names];
    }
    NSLog(@"OUT OF LOOP Font Names = %@, count = %d", fontNames, [fontNames count]);
    
    [actionSheet addSubview:view];
    [actionSheet addButtonWithTitle:cancelTitle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    [actionSheet showInView:self.view];
    [actionSheet setBounds:CGRectMake(0,0,320,380)];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CountryCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [fontNames objectAtIndex:indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [fontNames count];
}

@end
