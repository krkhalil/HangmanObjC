//
//  CountriesVC.h
//  HangmanObjC
//
//  Created by Macbook on 17/07/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CountriesVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textFieldCharacter;
@property (weak, nonatomic) IBOutlet UILabel *labelWord;
@property (weak, nonatomic) IBOutlet UIImageView *hangmanImageView;
@property (weak, nonatomic) IBOutlet UIButton *tryButton;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;


@property NSString * type;


@end

NS_ASSUME_NONNULL_END
