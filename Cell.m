//
//  Cell.m
//  Task1103
//
//  Created by Omnipresent on 11/03/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize lblCAddress,lblCName,lblCPhone,lblCNameUser,lblCAddressUser,lblCPhoneUser;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
