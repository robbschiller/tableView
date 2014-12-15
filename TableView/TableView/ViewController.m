//
//  ViewController.m
//  TableView
//
//  Created by Robb Schiller on 12/2/14.
//  Copyright (c) 2014 robb. All rights reserved.
//

#import "ViewController.h"

// Class Extension (private stuff)
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

// Actual implementation
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Make the table view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    // Make ourselves the datasource (and delegate)
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // Let the tableview know how to make cells
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"cell"];
    
    // Add the tableview to the screen
    [self.view addSubview:self.tableView];
	
		// Register class for cell?
		[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
	
		// Make titles...
		self.titles = [NSArray arrayWithObjects:@"Bananas", @"Avocados", @"Argentine Blueberries", nil];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Table View

// This gets called once when the table view loads to let it know
// how many rows it's going to need.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
		return [self.titles count];
}

// This method just returns a cell for the table view to use.
// It's called right before a cell is about to come on the screen.
// That means this can get called many times for the same row if the row
// goes offscreen then comes back on.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRow was called");
    
    // Ask the table view for a reusable cell
		static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Setup the cell, use post titles
    cell.textLabel.text = [self.titles objectAtIndex:indexPath.row];
    
    return cell;
}

@end