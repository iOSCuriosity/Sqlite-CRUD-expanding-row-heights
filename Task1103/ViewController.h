//
//  ViewController.h
//  Task1103
//
//  Created by Omnipresent on 11/03/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "DataClass.h"


@interface ViewController : UIViewController{
    
    UITableView *tblViewObj;
    UILabel *lblName;
    UILabel *lblAddress;
    UILabel *lblPhone;
    UILabel *lblNotif;
    UITextField *txtName;
    UITextField *txtAddress;
    UITextField *txtPhone;
    sqlite3 *dbConnect;
    sqlite3_stmt *Statement;
    NSString *strDbpath;
    NSArray *arrDbpath;
    
    NSMutableArray *arrData;
    NSMutableArray *arrNameData;
    NSArray *arrSearchData;
    
    
    
    
}

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblAddress;
@property (strong, nonatomic) IBOutlet UILabel *lblPhone;
@property (strong, nonatomic) IBOutlet UILabel *lblNotif;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtAddress;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITableView *tblViewObj;

-(IBAction)btnClickSave:(id)sender;
-(IBAction)btnClickUpdate:(id)sender;
-(IBAction)btnClickDelete:(id)sender;
-(IBAction)btnClickSelectAll:(id)sender;
-(IBAction)btnClickFind:(id)sender;

@end
