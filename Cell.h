//
//  Cell.h
//  Task1103
//
//  Created by Omnipresent on 11/03/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell{
    UILabel *lblCName;
    UILabel *lblCAddress;
    UILabel *lblCPhone;
    UILabel *lblCNameUser;
    UILabel *lblCAddressUser;
    UILabel *lblCPhoneUser;
}

@property (strong, nonatomic) IBOutlet UILabel *lblCName;
@property (strong, nonatomic) IBOutlet UILabel *lblCAddress;
@property (strong, nonatomic) IBOutlet UILabel *lblCPhone;
@property (strong, nonatomic) IBOutlet UILabel *lblCNameUser;
@property (strong, nonatomic) IBOutlet UILabel *lblCAddressUser;
@property (strong, nonatomic) IBOutlet UILabel *lblCPhoneUser;

@end
