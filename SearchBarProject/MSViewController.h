//
//  MSViewController.h
//  SearchBarProject
//
//  Created by Mateusz Soliwoda on 01.04.2014.
//  Copyright (c) 2014 Mateusz Soliwoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic) IBOutlet UITableView *aTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end
