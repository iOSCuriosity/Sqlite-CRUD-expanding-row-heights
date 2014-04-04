//
//  DBConnection.h
//  TestMasterPrep
//
//  Created by batch 1 on 24/09/13.
//  Copyright (c) 2013 batch 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "DataClass.h"

@interface DBConnection : NSObject
{

}
+(DBConnection*)getshared;
-(void)connectdb;
-(BOOL)InsertData: (NSString *) strName : (NSString *) strAddress : (NSString *) strPhone;
- (NSMutableArray *)findByName: (NSString *) strName;
- (NSMutableArray *)SelectAllData;
-(BOOL)UpdateData: (NSString *) strName : (NSString *) strAddress : (NSString *) strPhone;
-(BOOL)delData : (NSString *) strName : (NSString *) strAddress : (NSString *) strPhone;

@end
