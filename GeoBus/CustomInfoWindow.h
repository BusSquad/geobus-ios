//
//  CustomInfoWindow.h
//  GeoBus
//
//  Created by Ivan Alvarado on 12/27/15.
//  Copyright © 2015 Bus Squad UCSC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomInfoWindow : UIView

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIImageView *photo;

@end