//
//  DataClass.m
//  Task1103
//
//  Created by Omnipresent on 11/03/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import "DataClass.h"

@implementation DataClass
@synthesize strDCAddress, strDCName, strDCPhone;
-(id)init{
    DataClass *dcObj;
    dcObj = [super init];
    return dcObj;
}
@end
