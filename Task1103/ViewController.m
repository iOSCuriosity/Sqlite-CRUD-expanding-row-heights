//
//  ViewController.m
//  Task1103
//
//  Created by Omnipresent on 11/03/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "DBConnection.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

static CGFloat expandedRowHeight = 100;
static CGFloat contractedRowHeight = 35;

@implementation ViewController
@synthesize lblAddress,lblName,lblPhone,txtAddress,txtName,txtPhone,tblViewObj, lblNotif;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    {
  // Do any additional setup after loading the view from its nib.
//    arrDbpath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    strDbpath=arrDbpath[0];
//    //strDbpath= [strDbpath stringByAppendingPathComponent:@"Task1103789.sqlite"];
//    strDbpath=[[NSString alloc] initWithString:[strDbpath stringByAppendingPathComponent:@"Task1103.sqlite"]];
//    NSFileManager *filemgr = [NSFileManager defaultManager];
//    if ([filemgr fileExistsAtPath: strDbpath ] == NO)
//    {
//    
//    }
    }
    arrData = [[NSMutableArray alloc]init];
    arrNameData = [[NSMutableArray alloc]init];
    arrSearchData = [[NSArray alloc]init];
    
    
}

#pragma mark - UIButton click events

-(IBAction)btnClickSave:(id)sender
{
    BOOL insertOrNot =[[DBConnection getshared] InsertData:self.txtName.text :self.txtAddress.text : self.txtPhone.text];
    if (insertOrNot) {
        self.lblNotif.text = @"Contact added";
    }
    else {
        self.lblNotif.text = @"Failed to add contact";
    }
    
    [self btnClickSelectAll:sender];
    {
//    const char *dbpath= [strDbpath UTF8String];
//    if (sqlite3_open(dbpath, &dbConnect)==SQLITE_OK)
//    {
//        NSString *query = [NSString stringWithFormat:@"INSERT INTO contactDetail (Name,Address,Phone) VALUES (\"%@\",\"%@\",\"%@\")",txtName.text,txtAddress.text,txtPhone.text];
////        sqlite3_stmt *Statement1;
////        sqlite3_prepare_v2(dbConnect,[query UTF8String],-1,&Statement, NULL);
////        if (sqlite3_step(Statement)==SQLITE_DONE)
////        {
////            NSLog(@"successfull");
////        }
////        else
////        {
////            NSLog(@"not");
////        }
//        if (sqlite3_exec(dbConnect,[query UTF8String],NULL,NULL, NULL)==SQLITE_OK)
//        {
//            NSLog(@"successfull");
//            lblNotif.text = @"successfull";
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Record Saved Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [alert show];
//        }
//        else{
//            NSLog(@"not");
//            lblNotif.text = @"Try Again";
//        }
//    
//        sqlite3_finalize(Statement);
//        sqlite3_close(dbConnect);
//    }
//    [tblViewObj reloadData];
//
    }
}

-(IBAction)btnClickUpdate:(id)sender
{
    BOOL updateOrNot =[[DBConnection getshared] UpdateData:self.txtName.text :self.txtAddress.text :self.txtPhone.text ];
    if (updateOrNot) {
        self.lblNotif.text = @"Record Updated";
    }
    else {
        self.lblNotif.text = @"Failed to update Record";
    }
    
    [self btnClickSelectAll:sender];
    {
//    const char *dbpath= [strDbpath UTF8String];
//    if (sqlite3_open(dbpath, &dbConnect)==SQLITE_OK)
//    {
//        NSString *query = [NSString stringWithFormat:@"UPDATE contactDetail SET Address = \"%@\", Phone = \"%@\" WHERE Name = \"%@\"", txtAddress.text, txtPhone.text, txtName.text];
//        
//                sqlite3_prepare_v2(dbConnect,[query UTF8String],-1,&Statement, NULL);
//                if (sqlite3_step(Statement)==SQLITE_DONE)
//                {
//                    NSLog(@"successfull");
//                    lblNotif.text = @"successfull";
//                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Record Updated Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                    [alert show];
//
//                }
//                else
//                {
//                    NSLog(@"not");
//                    lblNotif.text = @"Try Again";
//                }
//        if (sqlite3_exec(dbConnect,[query UTF8String],NULL,NULL, NULL)==SQLITE_OK)
//        {
//            NSLog(@"successfull");
//        }
//        else{
//            NSLog(@"not");
//        }
//        
//        sqlite3_finalize(Statement);
//        sqlite3_close(dbConnect);
//    }
//    [tblViewObj reloadData];
    }
}

-(IBAction)btnClickDelete:(id)sender
{
    BOOL delOrNot =[[DBConnection getshared] UpdateData:self.txtName.text :self.txtAddress.text :self.txtPhone.text ];
    if (delOrNot) {
        self.lblNotif.text = @"Record Deleted";
    }
    else {
        self.lblNotif.text = @"Failed to Delete Record";
    }
    

    [self btnClickSelectAll:sender];
    {
//    const char *dbpath= [strDbpath UTF8String];
//    if (sqlite3_open(dbpath, &dbConnect)==SQLITE_OK)
//    {
//        NSString *query = [NSString stringWithFormat:@"DELETE FROM contactDetail WHERE Name=\"%@\"",txtName.text];
//       
//                sqlite3_prepare_v2(dbConnect,[query UTF8String],-1,&Statement, NULL);
//                if (sqlite3_step(Statement)==SQLITE_DONE)
//                {
//                    NSLog(@"successfull");
//                    lblNotif.text = @"successfull";
//                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Record Deleted Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                    [alert show];
//                }
//                else
//                {
//                    NSLog(@"not");
//                    lblNotif.text = @"Try Again";
//                }
//      
//        
//        sqlite3_finalize(Statement);
//        sqlite3_close(dbConnect);
//    }
    }
    }

-(IBAction)btnClickSelectAll:(id)sender
{
    
    arrData = [[DBConnection getshared]SelectAllData];
    
    NSString *strLblNotif = [[NSString alloc]initWithFormat:@"Records found: %d",arrData.count];
    NSLog(@"%@",strLblNotif);
    
    //lblNotif.text =strLblNotif;
    
    if (arrData.count>0) {
        [tblViewObj reloadData];
    }
    {
   //
//    [arrData removeAllObjects];
//    const char *dbpath= [strDbpath UTF8String];
//    if (sqlite3_open(dbpath, &dbConnect)==SQLITE_OK)
//    {
//        NSString *query = [NSString stringWithFormat:@"SELECT * FROM contactDetail"];
//        
//        sqlite3_prepare_v2(dbConnect,[query UTF8String],-1,&Statement, NULL);
//        while(sqlite3_step(Statement)==SQLITE_ROW)
//        {
//            NSString *strFindName = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(Statement, 1)];
//            NSLog(@"%@",strFindName);
//            
//            
//            NSString *strFindAddress = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(Statement, 2)];
//            NSLog(@"%@",strFindAddress);
//            //txtAddress.text = strFindAddress;
//        
//            NSString *strFindPhone = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(Statement, 3)];
//            NSLog(@"%@",strFindPhone);
//            //txtPhone.text = strFindPhone;
//            
//            DataClass *dcObj1;
//            dcObj1 = [[DataClass alloc]init];
//            dcObj1.strDCName = strFindName;
//            dcObj1.strDCAddress = strFindAddress;
//            dcObj1.strDCPhone = strFindPhone;
//            
//            [arrData addObject:dcObj1];
//            [arrNameData addObject:strFindName];
//            lblNotif.text = @"successfull";
//            NSLog(@"Arraydata");
//            NSLog(@"%@",arrData);
//            
//        }
////        else{
////            lblNotif.text = @"Try Again";
////            txtAddress.text = @"";
////            txtPhone.text = @"";
////        }
//        
//        NSLog(@"%@",arrData);
//        
//        sqlite3_finalize(Statement);
//        sqlite3_close(dbConnect);
//    }
//    [tblViewObj reloadData];
    }
}

-(IBAction)btnClickFind:(id)sender
{
    //DataClass *dcObj1 = [[DataClass alloc]init];
    arrData = [[DBConnection getshared]findByName:txtName.text];
    
    NSString *strLblNotif = [[NSString alloc]initWithFormat:@"Matches found: %d",arrData.count];
    NSLog(@"%@",strLblNotif);
    
    lblNotif.text =strLblNotif;
    
    
    if (arrData.count>0) {
        DataClass *dcObj1 = [[DataClass alloc]init];
        dcObj1=[arrData objectAtIndex:0];
        txtName.text = dcObj1.strDCName;
        txtAddress.text =dcObj1.strDCAddress;
        txtPhone.text = dcObj1.strDCPhone;
        
        [tblViewObj reloadData];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"No Match found"
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        
                                      [alert show];
        lblNotif.text = @"No Match found";
        txtName.text = @"";
        txtAddress.text =@"";
        txtPhone.text = @"";

    }
    {
///////////////////////////////////////////
//    NSLog(@"DAta in arrdata: %@",dcObj1.strDCName);
//
//    if (arrData == nil) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
//                              @"Data not found" message:nil delegate:nil cancelButtonTitle:
//                              @"OK" otherButtonTitles:nil];
//        [alert show];
//        txtName.text = @"";
//        txtAddress.text =@"";
//        txtPhone.text = @"";
//            }
//    else{
//            dcObj1=[data objectAtIndex:0];
//        txtName.text = dcObj1.strDCName;
//        txtAddress.text =dcObj1.strDCAddress;
//        txtPhone.text = dcObj1.strDCPhone;
//            }
//    
    //////////////////////////////////////
//    [arrData removeAllObjects];
//    const char *dbpath= [strDbpath UTF8String];
//    if (sqlite3_open(dbpath, &dbConnect)==SQLITE_OK)
//    {
//        NSString *query = [NSString stringWithFormat:@"SELECT * FROM contactDetail WHERE Name = \"%@\"", txtName.text];
//        
//        sqlite3_prepare_v2(dbConnect,[query UTF8String],-1,&Statement, NULL);
//        while(sqlite3_step(Statement)==SQLITE_ROW)
//        {
//            NSString *strFindName = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(Statement, 1)];
//            NSLog(@"%@",strFindName);
//            
//            
//            NSString *strFindAddress = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(Statement, 2)];
//            NSLog(@"%@",strFindAddress);
//            txtAddress.text = strFindAddress;
//            
//            NSString *strFindPhone = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(Statement, 3)];
//            NSLog(@"%@",strFindPhone);
//            txtPhone.text = strFindPhone;
//            
//            DataClass *dcObj1;
//            dcObj1 = [[DataClass alloc]init];
//            dcObj1.strDCName = strFindName;
//            dcObj1.strDCAddress = strFindAddress;
//            dcObj1.strDCPhone = strFindPhone;
//            
//            [arrData addObject:dcObj1];
//    
//            lblNotif.text = @"successfull";
//            NSLog(@"Arraydata");
//            NSLog(@"%@",arrData);
//            
       // }
        //        else{
        //            lblNotif.text = @"Try Again";
        //            txtAddress.text = @"";
        //            txtPhone.text = @"";
        //        }
        
//        NSLog(@"%@",arrData);

//        sqlite3_finalize(Statement);
//        sqlite3_close(dbConnect);
    //}
//    [tblViewObj reloadData];
    }
}

#pragma mark - TextField

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [txtName resignFirstResponder];
    [txtPhone resignFirstResponder];
    [txtAddress resignFirstResponder];
    return YES;
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (arrSearchData.count>0) {
        return [arrSearchData count];
        
    } else {
        return [arrData count];
        
    }
    //return arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    {
//    UITableViewCell *tblViewCell =[tblViewObj dequeueReusableCellWithIdentifier:@"cell"];
//    
//    if (tblViewCell == nil) {
//        tblViewCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
//    }
//    DataClass *dcobj2= [arrData objectAtIndex:indexPath.row];
//    tblViewCell.textLabel.text = dcobj2.strDCName;
//    
//    tblViewCell.detailTextLabel.text = dcobj2.strDCAddress;
    }
    Cell *tblcell=[tblViewObj dequeueReusableCellWithIdentifier:@"MyCell"];
    DataClass *dcobj2= [arrData objectAtIndex:indexPath.row];
    if (tblcell == nil)
    {
        NSArray *arrNib=[[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        tblcell=[arrNib objectAtIndex:0];
        
    }
    if (arrSearchData.count>0)
    {
        tblcell.lblCNameUser.text = [arrSearchData objectAtIndex:indexPath.row];
    } else {
        tblcell.lblCNameUser.text =dcobj2.strDCName;
        tblcell.lblCAddressUser.text =dcobj2.strDCAddress;
        tblcell.lblCPhoneUser.text =dcobj2.strDCPhone;

    }
//    tblcell.lblCNameUser.text =dcobj2.strDCName;
//    tblcell.lblCAddressUser.text =dcobj2.strDCAddress;
//    tblcell.lblCPhoneUser.text =dcobj2.strDCPhone;
    return tblcell;
    [tblViewObj reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DataClass *dcobj2 = [[DataClass alloc]init];
    
    dcobj2 = [arrData objectAtIndex:indexPath.row];
    [arrData removeObjectAtIndex:indexPath.row];
    const char *dbpath= [strDbpath UTF8String];
    if (sqlite3_open(dbpath, &dbConnect)==SQLITE_OK)
    {
        NSString *query = [NSString stringWithFormat:@"DELETE FROM contactDetail WHERE Name=\"%@\"",dcobj2.strDCName];
        
        sqlite3_prepare_v2(dbConnect,[query UTF8String],-1,&Statement, NULL);
        if (sqlite3_step(Statement)==SQLITE_DONE)
        {
            NSLog(@"successfull");
            lblNotif.text = @"successfull";
        }
        else
        {
            NSLog(@"not");
            lblNotif.text = @"Try Again";
        }
        
        
        sqlite3_finalize(Statement);
        sqlite3_close(dbConnect);
    }

    [tblViewObj reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   // NSLog(@"%lu",(unsigned long)[tableView indexPathsForSelectedRows].count);
    
    if ([tableView indexPathsForSelectedRows].count) {
        
		if ([[tableView indexPathsForSelectedRows]indexOfObject:indexPath] != NSNotFound) {
			return expandedRowHeight;
            [tableView reloadData];
		}
        
        return contractedRowHeight;
        [tableView reloadData];
	}
    
    return contractedRowHeight;
    [tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DataClass *dcObj = [arrData objectAtIndex:indexPath.row];
    txtName.text = dcObj.strDCName;
    txtAddress.text = dcObj.strDCAddress;
    txtPhone.text = dcObj.strDCPhone;
    [tblViewObj reloadData];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tblViewObj reloadData];
}



#pragma mark - Search

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    arrSearchData = [arrNameData filteredArrayUsingPredicate:resultPredicate];
    [tblViewObj reloadData];
}
//UISearchBar *obj;
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
