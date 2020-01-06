//
//  CountriesVC.m
//  HangmanObjC
//
//  Created by Macbook on 17/07/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "CountriesVC.h"

@interface CountriesVC () <UITextFieldDelegate>
{
    NSString * word;
    NSMutableString * hideWord;
    
    NSMutableArray * dataArray;
    
    int error;
    
    NSString * found;
}

@end

@implementation CountriesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationController.navigationBar.hidden = false;
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    [self setArray];
    
    word = [dataArray objectAtIndex: arc4random()%dataArray.count] ;
    
    word = word.uppercaseString;
    
    hideWord = @"";
    
    error = 0;
    found = @"0";
    
    _textFieldCharacter.delegate = self;
    
    
    [self setFirstTime];
    
    
    if ([_type isEqualToString:@"Countries"])
    {
        _bgImageView.image = [UIImage imageNamed:@"countries.png"];
    }
    else if ([_type isEqualToString:@"Animals"])
    {
        _bgImageView.image = [UIImage imageNamed:@"animals.png"];
    }
    else if ([_type isEqualToString:@"Fruits"])
    {
        _bgImageView.image = [UIImage imageNamed:@"fruits.png"];
    }
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_textFieldCharacter resignFirstResponder];
    
    return true;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _textFieldCharacter.text = @"";
    return true;
}

-(void) setFirstTime
{
    
    for (int i = 0; i < [word length]; i++)
    {
    
        if (i == 0)
        {
            
            int ascii = [word characterAtIndex:i];
            
            hideWord = [NSMutableString stringWithFormat:@"%c", ascii];
        }
        else
        {
            hideWord = [NSMutableString stringWithFormat:@"%@_", hideWord];
        }
        
    }
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc]
                                       initWithString:hideWord];
    
    [text addAttribute:NSKernAttributeName
                 value:@3.0
                 range:NSMakeRange(0, text.length)];
    
    
    [_labelWord setAttributedText:text];
    
    
//    _labelWord.text = hideWord;
}



-(void) setWord
{
    NSString * temp;
    temp = @"";
    
    NSString * letter = _textFieldCharacter.text.uppercaseString;
    
    
    
    for (int i = 0; i < [word length]; i++)
    {
    
            int ascii = [word characterAtIndex:i];
        if ([letter isEqualToString:[NSString stringWithFormat:@"%c", ascii]])
             {
                 
                 found = @"1";
                 temp = [NSString stringWithFormat:@"%@%@", temp,letter];
             }
            else
            {
                int ascii = [hideWord characterAtIndex:i];
                temp = [NSString stringWithFormat:@"%@%c", temp,ascii];
            }

    }
    
    
    if ([found isEqualToString:@"0"])
    {
        error = error+1;
    }
    
    
    
    [hideWord setString:temp];
    
    
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc]
                                       initWithString:temp];
    
    [text addAttribute:NSKernAttributeName
                 value:@3.0
                 range:NSMakeRange(0, text.length)];
    
    
    [_labelWord setAttributedText:text];
    
    
    
    if (error == 0)
    {
        _hangmanImageView.image = [UIImage imageNamed:@"1.png"];
    }
    else if (error == 1)
    {
        _hangmanImageView.image = [UIImage imageNamed:@"2.png"];
    }
    else if (error == 2)
    {
        _hangmanImageView.image = [UIImage imageNamed:@"3.png"];
    }
    else if (error == 3)
    {
        _hangmanImageView.image = [UIImage imageNamed:@"4.png"];
    }
    else if (error == 4)
    {
        _hangmanImageView.image = [UIImage imageNamed:@"5.png"];
    }
    else if (error == 5)
    {
        _hangmanImageView.image = [UIImage imageNamed:@"6.png"];
    }
    else if (error == 6)
    {
        _hangmanImageView.image = [UIImage imageNamed:@"7.png"];
        
        
        _labelWord.text = @"GAME OVER";
        
        _textFieldCharacter.enabled = false;
        
        _tryButton.enabled = false;
    }
    
    
    if ([_labelWord.text isEqualToString:word])
    {
        word = [dataArray objectAtIndex: arc4random()%dataArray.count];
        word = word.uppercaseString;
        
        DELAY(20);
        
        [self setFirstTime];
    }
    
    

    
   // _labelWord.text = temp;
}


- (IBAction)tryButtonTouched:(id)sender
{
    if (_textFieldCharacter.text.length > 0)
    {
        found = @"0";
        [_textFieldCharacter resignFirstResponder];
        [self setWord];
    }
}


-(void) setArray
{
    dataArray = [[NSMutableArray alloc] init];
    
    if ([_type isEqualToString:@"Countries"])
    {
        
        [dataArray addObject:@"PAKISTAN"];
        [dataArray addObject:@"USA"];
        [dataArray addObject:@"SAUDIARABIA"];
        [dataArray addObject:@"SRILANKA"];
        [dataArray addObject:@"AUSTRALIA"];
        [dataArray addObject:@"NEWZEALAND"];
        [dataArray addObject:@"BANGLADESH"];
        [dataArray addObject:@"AFGHANISTAN"];
        [dataArray addObject:@"ALBANIA"];
        [dataArray addObject:@"ALGERIA"];
        [dataArray addObject:@"ANDORRA"];
        [dataArray addObject:@"ANGOLA"];
        [dataArray addObject:@"ARGENTINA"];
        [dataArray addObject:@"ARMENIA"];
        [dataArray addObject:@"AZERBAIJAN"];
        [dataArray addObject:@"BAHRAIN"];
        [dataArray addObject:@"BELARUS"];
        [dataArray addObject:@"COLOMBIA"];
        [dataArray addObject:@"CHINA"];
        [dataArray addObject:@"CHILE"];
        [dataArray addObject:@"CROATIA"];
        [dataArray addObject:@"CYPRUS"];
        [dataArray addObject:@"DOMINICA"];
        [dataArray addObject:@"EGYPT"];
        [dataArray addObject:@"ESTONIA"];
        [dataArray addObject:@"ETHIOPIA"];
        [dataArray addObject:@"GRENADA"];
        [dataArray addObject:@"GREECE"];
        [dataArray addObject:@"MALAYSIA"];
        [dataArray addObject:@"MADAGASCAR"];
        [dataArray addObject:@"MALI"];
        [dataArray addObject:@"MONGOLIA"];
        [dataArray addObject:@"MYANMAR"];
        [dataArray addObject:@"NETHERLANDS"];
        [dataArray addObject:@"ROMANIA"];
        [dataArray addObject:@"RUSSIA"];
        [dataArray addObject:@"RWANDA"];
        [dataArray addObject:@"SENEGAL"];
        [dataArray addObject:@"SERBIA"];
        [dataArray addObject:@"SINGAPORE"];
    }
    else if ([_type isEqualToString:@"Animals"])
    {
        [dataArray addObject:@"Squirrel"];
        [dataArray addObject:@"Dog"];
        [dataArray addObject:@"Chimpanzee"];
        [dataArray addObject:@"Ox"];
        [dataArray addObject:@"Lion"];
        [dataArray addObject:@"Panda"];
        [dataArray addObject:@"Walrus"];
        [dataArray addObject:@"Otter"];
        [dataArray addObject:@"Mouse"];
        [dataArray addObject:@"Kangaroo"];
        [dataArray addObject:@"Goat"];
        [dataArray addObject:@"Monkey"];
        [dataArray addObject:@"Cow"];
        [dataArray addObject:@"Koala"];
        [dataArray addObject:@"Mole"];
        [dataArray addObject:@"Elephant"];
        [dataArray addObject:@"Leopard"];
        [dataArray addObject:@"Giraffe"];
        [dataArray addObject:@"Hedgehong"];
        [dataArray addObject:@"Sheep"];
        [dataArray addObject:@"Deer"];
    }
    else if ([_type isEqualToString:@"Fruits"])
    {
        [dataArray addObject:@"Apple"];
        [dataArray addObject:@"Watermelon"];
        [dataArray addObject:@"Orange"];
        [dataArray addObject:@"Pear"];
        [dataArray addObject:@"Cherry"];
        [dataArray addObject:@"Strawberry"];
        [dataArray addObject:@"Nectarine"];
        [dataArray addObject:@"Mango"];
        [dataArray addObject:@"Grape"];
        [dataArray addObject:@"Blueberry"];
        [dataArray addObject:@"Pomegranate"];
        [dataArray addObject:@"Banana"];
        [dataArray addObject:@"Raspberry"];
        [dataArray addObject:@"Mandarin"];
        [dataArray addObject:@"Jackfruit"];
        [dataArray addObject:@"Kiwi"];
        [dataArray addObject:@"Papaya"];
        [dataArray addObject:@"Lime"];
        [dataArray addObject:@"Pineapple"];
        [dataArray addObject:@"Coconut"];
        [dataArray addObject:@"Grapefruit"];
    }
}




@end
