//
//  ViewController.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/13/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "MainScreenController.h"
#import "DetailViewController.h"
#import "QuartzView.h"
#define ITEMS_KEY @"items"
#define TITLE_KEY @"title"
#define ROW_KEY @"row"
#define CLASS_KEY @"viewclass"
@interface MainScreenController ()
{
    NSArray *_tableData;
    DetailViewController *_detailViewController;
}
@end

@implementation MainScreenController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Quartz2D@TechMaster";
    }
    return self;
}

- (void) loadView
{
    [super loadView];
    [self setupTableData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    UIBarButtonItem *_backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = _backButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (void) setupTableData
{
    if (!_tableData)
    {
        // Path to the plist (in the application bundle)
        NSString *path = [[NSBundle mainBundle] pathForResource:
                          @"data" ofType:@"plist"];
        _tableData = [[NSArray alloc] initWithContentsOfFile:path];        
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [_tableData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic = _tableData[section];
    NSArray *items = [dic valueForKey: ITEMS_KEY];
    return [items count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dic = _tableData[section];
    return [dic valueForKey:TITLE_KEY];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *dicSection = _tableData[indexPath.section];
    NSArray *items = [dicSection valueForKey: ITEMS_KEY];
    NSDictionary *dicRow = items[indexPath.row];
    cell.textLabel.text = [dicRow valueForKey:ROW_KEY];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dicSection = _tableData[indexPath.section];
    NSArray *items = [dicSection valueForKey: ITEMS_KEY];
    NSDictionary *dicRow = items[indexPath.row];
    NSString *viewClassName = [dicRow valueForKey:CLASS_KEY];
    if (!_detailViewController){
        _detailViewController = [DetailViewController new];
    }
    //Tạo ra một view ở MasterViewController
    
    QuartzView* quartzView = [[NSClassFromString(viewClassName) alloc] init];
   
    //Sau đó truyền vào DetailViewControll.view không dùng phương pháp cũ là khởi tạo từ XIB và code
    
    _detailViewController.view = quartzView;
    quartzView.frame = self.view.bounds;
    _detailViewController.title = [dicRow valueForKey:ROW_KEY];
    
    if ([quartzView respondsToSelector:@selector(customizeViewController:)]){
        [quartzView customizeViewController:_detailViewController];
    }
    
       
    
    [self.navigationController pushViewController:_detailViewController animated:YES];
    
    
    
    
}

@end
