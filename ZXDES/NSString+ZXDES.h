//
//  NSString+ZXDES.h
//  ZXTools
//
//  Created by 张玺 on 12-8-18.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZXDES)
- (NSString *) DESEncryptByKey:(NSString *)key;
- (NSString *) DESDecryptByKey:(NSString *)key;
@end
