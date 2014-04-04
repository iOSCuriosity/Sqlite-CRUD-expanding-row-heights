//
//  DataClass.h
//  Task1103
//
//  Created by Omnipresent on 11/03/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataClass : NSObject{
    NSString *strDCName;
    NSString *strDCAddress;
    NSString *strDCPhone;
    
}

@property (strong, nonatomic) NSString *strDCName;
@property (strong, nonatomic) NSString *strDCAddress;
@property (strong, nonatomic) NSString *strDCPhone;


@end
