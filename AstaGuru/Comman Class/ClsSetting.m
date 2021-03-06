//
//  ClsSetting.m
//  My Ghar Seva
//
//  Created by sumit mashalkar on 30/01/16.
//  Copyright © 2016 winjit. All rights reserved.
//

#import "ClsSetting.h"
#import <QuartzCore/QuartzCore.h>
#import "SWRevealViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "BforeLoginViewController.h"
#import "AfterLoginViewController.h"
#import "SearchViewController.h"
@implementation ClsSetting
{
   }
+(CGFloat)CalculateHeightOfTextview:(UITextView *)TxtVw
{
    NSString *strDescrption=TxtVw.text;
    
    if ([strDescrption isEqualToString:@""] || [strDescrption isEqualToString:@"null"]|| [strDescrption isEqualToString:@"<null>"])
    {
        return 20.0;
    }
    else
    {
        
        CGFloat fixedWidth = TxtVw.frame.size.width;
        CGSize newSize = [TxtVw sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
        CGRect newFrame = TxtVw.frame;
        newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
        TxtVw.frame = newFrame;
        if (TxtVw.frame.size.height<30.0)
        {
            return 50.0;
        }
        //return expectedLabelSize.height+40;
        return TxtVw.frame.size.height;
    }
    
}

+(void)Downloadimage
{
    NSString *strimgpath;
    NSString *strimg=[[NSUserDefaults standardUserDefaults] valueForKey:@"DefaultLogo"];
    if([strimg class]!=[NSNull class])
    {
        
        NSArray *arrmstr=[strimg componentsSeparatedByString:@"~"];
        if (arrmstr.count>1)
        {
            strimgpath=[NSString stringWithFormat:@"http://staging/tagit/%@",[arrmstr objectAtIndex:1]];
            
        }
        
    }
    
    
    
    NSURL *url = [NSURL URLWithString:strimgpath];
    NSLog(@"%@",url);
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    NSData *pngData = UIImagePNGRepresentation(image);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"DefaultLogo.png"]; //Add the file name
    [pngData writeToFile:filePath atomically:YES];
    //
}

+(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
+(NSString*)TrimWhiteSpaceAndNewLine:(NSString*)strString
{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString = [strString stringByTrimmingCharactersInSet:whitespace];
    return trimmedString;
}


+(void)underline:(UIView*)textField
{
    
    
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1.6;
    border.borderColor = [UIColor colorWithRed:196.0/255.0 green:196.0/255.0 blue:196.0/255.0 alpha:1.0].CGColor;
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, textField.frame.size.height);
    border.borderWidth = borderWidth;
    [textField.layer addSublayer:border];
    textField.layer.masksToBounds = YES;
    textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
    
}
-(NSString *)Url
{
return @"http://54.169.222.181/api/v2/guru/_table/";
}
+(NSString *)ImageURL
{
return @"http://arttrust.southeastasia.cloudapp.azure.com/";
}
+(void)SetBorder:(UIView *)viw cornerRadius:(CGFloat)CornerRadius borderWidth:(CGFloat)borderWidth 
{
    UIColor *lightgray= [UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1.0];
    //[[viw layer] setBorderWidth:1.0f];
    [[viw layer] setBorderColor:lightgray.CGColor];
    viw.layer.cornerRadius=CornerRadius;
    viw.layer.masksToBounds=YES;
    //viw.layer.borderColor=(__bridge CGColorRef _Nullable)(BorderColor);
    viw.layer.borderWidth= borderWidth;
    if ([viw isKindOfClass:[UITextField class]])
    {
        viw.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
    }
}
+(NSMutableArray *)getMenu
{
    NSMutableArray *arrmenu=[[NSMutableArray alloc]init];
    [arrmenu addObject:@"FeedWhiteWithTitle180"];
    [arrmenu addObject:@"mylist180"];
    [arrmenu addObject:@"footer_alert_gray_text180"];
    [arrmenu addObject:@"G_white180"];
    [arrmenu addObject:@"likeNo180"];
    [arrmenu addObject:@"mylist180"];
    [arrmenu addObject:@"MsgWhiteWithTitle180"];
    return arrmenu;
}
+(NSMutableArray *)getMenuHome
{
    NSMutableArray *arrmenu=[[NSMutableArray alloc]init];
    [arrmenu addObject:@"FeedRedWithTitile180"];
    [arrmenu addObject:@"mylist180"];
    [arrmenu addObject:@"footer_alert_gray_text180"];
    [arrmenu addObject:@"Footer_G_white180"];
    [arrmenu addObject:@"likeNo180"];
    [arrmenu addObject:@"mylist180"];
    [arrmenu addObject:@"MsgWhiteWithTitle180"];
    return arrmenu;
}
+(NSMutableArray *)getMenuSaved
{
    NSMutableArray *arrmenu=[[NSMutableArray alloc]init];
    [arrmenu addObject:@"FeedWhiteWithTitle180"];
    [arrmenu addObject:@"mylist180"];
    [arrmenu addObject:@"footer_alert_gray_text180"];
    [arrmenu addObject:@"Footer_G_white180"];
    [arrmenu addObject:@"like180"];
    [arrmenu addObject:@"mylist180"];
    [arrmenu addObject:@"MsgWhiteWithTitle180"];
    return arrmenu;
}

+(NSMutableArray *)getMenuMyList
{
    NSMutableArray *arrmenu=[[NSMutableArray alloc]init];
    [arrmenu addObject:@"FeedWhiteWithTitle180"];
    [arrmenu addObject:@"MyList_Red180"];
    [arrmenu addObject:@"footer_alert_gray_text180"];
    [arrmenu addObject:@"Footer_G_white180"];
    [arrmenu addObject:@"likeNo180"];
    [arrmenu addObject:@"mylist180"];
    [arrmenu addObject:@"MsgWhiteWithTitle180"];
    return arrmenu;
}

+(NSString*)getAddress:(CLLocation*)newLocation
{
    CLLocation *currentLocation = newLocation;
    CLGeocoder* geocoder = [CLGeocoder new];
    __block CLPlacemark* placemark;
    
   __block NSString *strAddress=@"";
    
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         //NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
         if (error == nil && [placemarks count] > 0)
         {
             placemark = [placemarks lastObject];
             
             // strAdd -> take bydefault value nil
             NSString *strAdd = @"";
             
             if ([placemark.subThoroughfare length] != 0)
                 strAdd = placemark.subThoroughfare;
             
             if ([placemark.thoroughfare length] != 0)
             {
                 // strAdd -> store value of current location
                 if ([strAdd length] != 0)
                     strAdd = [NSString stringWithFormat:@"%@, %@",strAdd,[placemark thoroughfare]];
                 else
                 {
                     // strAdd -> store only this value,which is not null
                     strAdd = placemark.thoroughfare;
                 }
             }
             
             if ([placemark.postalCode length] != 0)
             {
                 if ([strAdd length] != 0)
                     strAdd = [NSString stringWithFormat:@"%@, %@",strAdd,[placemark postalCode]];
                 else
                     strAdd = placemark.postalCode;
             }
             
             if ([placemark.locality length] != 0)
             {
                 if ([strAdd length] != 0)
                     strAdd = [NSString stringWithFormat:@"%@, %@",strAdd,[placemark locality]];
                 else
                     strAdd = placemark.locality;
             }
             
             if ([placemark.administrativeArea length] != 0)
             {
                 if ([strAdd length] != 0)
                     strAdd = [NSString stringWithFormat:@"%@, %@",strAdd,[placemark administrativeArea]];
                 else
                     strAdd = placemark.administrativeArea;
             }
             
             if ([placemark.country length] != 0)
             {
                 if ([strAdd length] != 0)
                     strAdd = [NSString stringWithFormat:@"%@, %@",strAdd,[placemark country]];
                 else
                     strAdd = placemark.country;
             }
            
                    strAddress=strAdd;
             
             
         }
         
     }];
    NSLog(@"%@",strAddress);
   return strAddress;
}
+(void)internetConnectionPromt
{
    [[[[iToast makeText:@"Please check internet connection"] setGravity:iToastGravityCenter] setDuration:iToastDurationNormal]show];
}
+(void)ValidationPromt:(NSString*)strValidationText
{
    [[[[iToast makeText:strValidationText] setGravity:iToastGravityCenter] setDuration:iToastDurationNormal]show];
}
-(void)CallWeb:(NSMutableDictionary*)dict url:(NSString*)strURL view:(UIView*)Callingview Post:(BOOL)isPost
{
    @try {
        
        
        MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:Callingview animated:YES];
        HUD.labelText = @"loading";

        
        NSMutableDictionary *Discparam=[[NSMutableDictionary alloc]init];
        Discparam=dict;
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];  //AFHTTPResponseSerializer serializer
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
       
        NSString  *strQuery=[NSString stringWithFormat:@"%@%@",[self Url],strURL];
        NSString *url = strQuery;
        NSLog(@"%@",url);
        
        
        
        NSString *encoded = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [manager GET:encoded parameters:Discparam success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             //  NSError *error=nil;
             NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             
             NSError *error;
             NSMutableArray *dict1 = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
             NSLog(@"%@",responseStr);
             NSLog(@"%@",dict1);
             [MBProgressHUD hideHUDForView:Callingview animated:YES];
             [_PassReseposeDatadelegate passReseposeData:responseObject];
            
           
             
             
         }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  NSLog(@"Error: %@", error);
                  
                  [MBProgressHUD hideHUDForView:Callingview animated:YES];
              }];
        
        
    }
    @catch (NSException *exception)
    {
        
    }
    @finally
    {
    }
}


-(void)calllPostWeb:(NSDictionary*)dict url:(NSString*)strURL view:(UIView*)Callingview
{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:Callingview animated:YES];
    HUD.labelText = @"loading";

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSLog(@"Dict %@",dict);
    
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer = serializer;
    
    [manager POST:strURL parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
          NSError *error=nil;
        //NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
       // NSError *error;
      //  NSMutableDictionary *dict1 = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
       // NSLog(@"%@",responseStr);
        
        [_PassReseposeDatadelegate passReseposeData1:responseObject];
        [MBProgressHUD hideHUDForView:Callingview animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [MBProgressHUD hideHUDForView:Callingview animated:YES];
        
    }];
    
    
}
-(void)calllPostWeb2:(NSDictionary*)dict url:(NSString*)strURL view:(UIView*)Callingview
{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:Callingview animated:YES];
    HUD.labelText = @"loading";
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSLog(@"Dict %@",dict);
    
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer = serializer;
    
    [manager POST:@"http://54.169.222.181/api/v2/guru/_table/users?api_key=c6935db431c0609280823dc52e092388a9a35c5f8793412ff89519e967fd27ed" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSError *error=nil;
        //NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        // NSError *error;
        //  NSMutableDictionary *dict1 = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        // NSLog(@"%@",responseStr);
        
        [_PassReseposeDatadelegate passReseposeData1:responseObject];
        [MBProgressHUD hideHUDForView:Callingview animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [MBProgressHUD hideHUDForView:Callingview animated:YES];
        
    }];
    
    
}



/*-(void)calllPostWeb:(NSDictionary*)dict url:(NSString*)strURL view:(UIView*)Callingview
{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:Callingview animated:YES];
    HUD.labelText = @"loading";
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSLog(@"Dict %@",dict);
    
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer = serializer;
    
    [manager POST:strURL parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSError *error=nil;
        //NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        // NSError *error;
        //  NSMutableDictionary *dict1 = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        // NSLog(@"%@",responseStr);
        
        [_PassReseposeDatadelegate passReseposeData1:responseObject];
        [MBProgressHUD hideHUDForView:Callingview animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [MBProgressHUD hideHUDForView:Callingview animated:YES];
        
    }];
    
    
}
*/

-(void)calllPutWeb:(NSDictionary*)dict url:(NSString*)strURL view:(UIView*)Callingview
{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:Callingview animated:YES];
    HUD.labelText = @"loading";
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSLog(@"Dict %@",dict);
    
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer = serializer;
    
    [manager PUT:@"http://54.169.222.181/api/v2/guru/_table/users?api_key=c6935db431c0609280823dc52e092388a9a35c5f8793412ff89519e967fd27ed" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSError *error=nil;
        //NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        // NSError *error;
        //  NSMutableDictionary *dict1 = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        // NSLog(@"%@",responseStr);
        
        [_PassReseposeDatadelegate passReseposeData1:responseObject];
        [MBProgressHUD hideHUDForView:Callingview animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [MBProgressHUD hideHUDForView:Callingview animated:YES];
        
    }];
    
    
}




-(void)SendSMSOTP:(NSDictionary*)dict url:(NSString*)strURL view:(UIView*)Callingview
{
    @try {
        
        
       // MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:Callingview animated:YES];
        //HUD.labelText = @"loading";
        
        
        NSDictionary *Discparam=[[NSDictionary alloc]init];
        Discparam=dict;
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];  //AFHTTPResponseSerializer serializer
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
        NSString  *strQuery=[NSString stringWithFormat:@"%@",strURL];
        NSString *url = strQuery;
        NSLog(@"%@",url);
        
        
        
        NSString *encoded = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [manager GET:encoded parameters:Discparam success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             //  NSError *error=nil;
             NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             
             NSError *error;
             NSMutableArray *dict1 = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
             NSLog(@"%@",responseStr);
             NSLog(@"%@",dict1);
             
             [_PassReseposeDatadelegate passReseposeData1:responseObject];
             
            // [MBProgressHUD hideHUDForView:Callingview animated:YES];
             
             
         }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Error: %@", error);
                 
                // [MBProgressHUD hideHUDForView:Callingview animated:YES];
             }];
        
        
    }
    @catch (NSException *exception)
    {
        
    }
    @finally
    {
    }
}

+(NSMutableDictionary*)RemoveNull:(NSMutableDictionary*)dict
{
    NSArray*arrkeys=[dict allKeys];
    dict=[dict mutableCopy];
    for (int i=0; i<arrkeys.count;i++ )
    {
        if (([dict valueForKey:[arrkeys objectAtIndex:i]]== nil)||([dict valueForKey:[arrkeys objectAtIndex:i]]== [NSNull null]))
        {
           [dict setValue:@"" forKey:[arrkeys objectAtIndex:i]];
        }
        
        NSString *str=[dict valueForKey:[arrkeys objectAtIndex:i]];
        NSLog(@"%@",[dict valueForKey:[arrkeys objectAtIndex:i]]);
        if ([str intValue]==0)
        {
           str=[str stringByReplacingOccurrencesOfString: @"<br>" withString: @"\n"];
             [dict setValue:str forKey:[arrkeys objectAtIndex:i]];
        }
        
        
       
    }
    return dict;
}
+(NSMutableDictionary*)RemoveNullOnly:(NSMutableDictionary*)dict
{
    NSArray*arrkeys=[dict allKeys];
    dict=[dict mutableCopy];
    for (int i=0; i<arrkeys.count;i++ )
    {
        if (([dict valueForKey:[arrkeys objectAtIndex:i]]== nil)||([dict valueForKey:[arrkeys objectAtIndex:i]]== [NSNull null]))
        {
            [dict setValue:@"" forKey:[arrkeys objectAtIndex:i]];
        }
        
       
       
        
        
        
    }
    return dict;
}
+(void)myAstaGuru:(UINavigationController*)NavigationController
{
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:USER_id] intValue]>0)
    {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SignIn" bundle:nil];
        AfterLoginViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"AfterLoginViewController"];
        [NavigationController pushViewController:rootViewController animated:YES];
    }
    else
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SignIn" bundle:nil];
        BforeLoginViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"BforeLoginViewController"];
        [NavigationController pushViewController:rootViewController animated:YES];
    }
}
+(void)Searchpage:(UINavigationController*)NavigationController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SearchViewController *VCLikesControll = [storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [NavigationController pushViewController:VCLikesControll animated:YES];
}
+(NSString*)getAttributedStringFormHtmlString:(NSString*)str
{
    NSRange r;
    while ((r = [str rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location     != NSNotFound)
    {
        str = [str stringByReplacingCharactersInRange:r withString:@""];
    }
    return str;
}
-(NSString *)stringByStrippingHTML:(NSString*)str
{
    NSRange r;
    while ((r = [str rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location     != NSNotFound)
    {
        str = [str stringByReplacingCharactersInRange:r withString:@""];
    }
    return str;
}

@end
