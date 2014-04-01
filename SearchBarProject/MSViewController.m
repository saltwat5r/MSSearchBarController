//
//  MSViewController.m
//  SearchBarProject
//
//  Created by Mateusz Soliwoda on 01.04.2014.
//  Copyright (c) 2014 Mateusz Soliwoda. All rights reserved.
//

#import "MSViewController.h"
#import "MSPerson.h"

@interface MSViewController (){
    NSMutableArray *aTableData;
    NSArray *searchedResults;
}

@end

@implementation MSViewController
@synthesize aTableView;
@synthesize searchBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *names = @[@"Alicia",
                      @"Andrew",
                      @"Brad",
                      @"Ben",
                      @"Celine"];
    aTableData = [[NSMutableArray alloc] init];
    
    
    [names enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *pers = obj;
        MSPerson *aPerson = [[MSPerson alloc] init];
        aPerson.name = pers;
        [aTableData addObject:aPerson];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchedResults count];
        
    } else {
        return [aTableData count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:cellIdentifier];
    }
    
    MSPerson *person = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        person = [searchedResults objectAtIndex:indexPath.row];
    } else {
        person = [aTableData objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = person.name;
    
    return cell;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchedText:searchString scope:nil];
    return YES;
}

- (void)filterContentForSearchedText:(NSString *)searchedText scope:(NSString *)scope {
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchedText];
    searchedResults = [aTableData filteredArrayUsingPredicate:aPredicate];
}

@end
