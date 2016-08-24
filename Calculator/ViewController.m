//
//  ViewController.m
//  Calculator
//
//  Created by user on 2016. 8. 24..
//  Copyright © 2016년 ldcc. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

//0,1,2,3
enum opr{none, plus, minus, divide, multiply};
//타입을 정의할때 사용
typedef enum opr Operator;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController
{
    //멤버변수는 여따가
    int currentValue;
    Operator currentOpr;
    Calculator *calc;
}
-(IBAction)buttonClicked:(id)sender{
    UIButton *btn = (UIButton *)sender;
    int value = (int)btn.tag;
    
    currentValue = currentValue * 10 + value;

//    if(currentOpr == none){
//        currentValue = currentValue * 10 + value;
//    }
//    else{
//        currentValue = value;
//       
//    }
    
    self.myLabel.text = [NSString stringWithFormat:@"%d",currentValue];
    

}
- (IBAction)clickOpr:(id)sender {
    UIButton *btn = (UIButton *)sender;
    int tagNum = (int)btn.tag;
    currentOpr = tagNum;
    
//    switch(tagNum){
//        case 1:
//             currentOpr = plus;
//            break;
//        case 2:
//            currentOpr = minus;
//            break;
//        case 3:
//            currentOpr = divide;
//            break;
//        case 4:
//            currentOpr = multiply;
//            break;
//        default:
//            break;
//    }
   
    [calc setAccumulator:currentValue];
    currentValue=0;
    
}
- (IBAction)clickEqual:(id)sender {
    switch(currentOpr){
        case plus :
            [calc add:currentValue];
            currentValue = [calc accumulator];
            break;
        case minus :
            [calc subtract:currentValue];
            currentValue = [calc accumulator];
            break;
        case multiply :
            [calc multiply:currentValue];
            currentValue = [calc accumulator];
            break;
        case divide:
            [calc divide:currentValue];
            currentValue = [calc accumulator];
            break;
        default :
            break;
    }
    
    self.myLabel.text = [NSString stringWithFormat:@"%d", currentValue];
    
}

- (IBAction)clear:(id)sender {
    currentValue = 0;
    currentOpr = none;
    self.myLabel.text = @"0";
    
}

-(IBAction)unwind:(UIStoryboardSegue *)sender{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //뷰 객체가 모두 로드된 이후 시점에 발생 구간
    //초기화
    calc = [[Calculator alloc] init];
    currentOpr = none;
    currentValue = 0;
    self.myLabel.text = @"0";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
