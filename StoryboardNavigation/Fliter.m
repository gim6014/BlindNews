//
//  Fliter.m
//  StoryboardNavigation
//
//  Created by 김사랑 on 2014. 1. 24..
//  Copyright (c) 2014년 김사랑. All rights reserved.
//

#import "Fliter.h"
#import "HanjatoHangle.h"

@implementation Fliter


- (NSMutableString *) settext:(NSMutableString *)s1 {
    
    hanjatohangle= [[HanjatoHangle alloc]init];
   
    for(int i = 0; i < [s1 length]; i++) {
        
        teg = [s1 rangeOfString:@"<[^<]*>" options:NSRegularExpressionSearch];
        misteg= [s1 rangeOfString:@"<!--"];
        equalchar=[s1 rangeOfString:@"= "];
        wavesymbol=[s1 rangeOfString:@"∼"];
        wavesymbol2=[s1 rangeOfString:@"~"];
        centerdot=[s1 rangeOfString:@"·"];
        corporationmark=[s1 rangeOfString:@"(주)"];
        hanja=[s1 rangeOfString:@"[\u4E00-\u9FBF]" options:NSRegularExpressionSearch];
        dday=[s1 rangeOfString:@"D-"];
        it=[s1 rangeOfString:@"IT"];
        led=[s1 rangeOfString:@"LED"];
        strangetag=[s1 rangeOfString:@"document.write('');"];
        ampdel=[s1 rangeOfString:@"amp;"];
        
        if(teg.location != NSNotFound) {
            [s1 deleteCharactersInRange:teg];
        }else if(misteg.location != NSNotFound) {
            [s1 deleteCharactersInRange:misteg];
        }else if(equalchar.location!=NSNotFound) {
            [s1 replaceCharactersInRange:equalchar withString:@"는 "];
        }else if(wavesymbol.location!=NSNotFound) {
            [s1 replaceCharactersInRange:wavesymbol withString:@"에서 "];
        }else if(wavesymbol2.location!=NSNotFound) {
            [s1 replaceCharactersInRange:wavesymbol2 withString:@"에서 "];
        }else if(centerdot.location!=NSNotFound) {
            [s1 replaceCharactersInRange:centerdot withString:@" "];
        }else if(corporationmark.location!=NSNotFound) {
            [s1 replaceCharactersInRange:corporationmark withString:@"㈜"];
        }else if(hanja.location!= NSNotFound) {
            
            int hanjachar=[s1 characterAtIndex:hanja.location];
            NSString * replace=[NSString stringWithFormat:@"%C", [hanjatohangle gethanja:hanjachar]];
            [s1 replaceCharactersInRange:hanja withString:replace];
            
        }else if(dday.location!=NSNotFound) {
            [s1 replaceCharactersInRange:dday withString:@"디 데이"];
        }else if(it.location!=NSNotFound) {
            [s1 replaceCharactersInRange:it withString:@"아이티"];
        }else if(led.location!=NSNotFound) {
            [s1 replaceCharactersInRange:led withString:@"엘이디"]; 
        }else if(strangetag.location != NSNotFound) {
            [s1 deleteCharactersInRange:strangetag];
        }else if (ampdel.location !=NSNotFound) {
            [s1 deleteCharactersInRange:ampdel];
        }else {
           
            break;
        }
    
    }
    
    return s1;

}

@end
