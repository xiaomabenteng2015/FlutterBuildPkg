#import "GomobileIosPlugin.h"
#import <Demo/Demo.h>
#import <YYModel/YYModel.h>
#import "User.h"

@implementation GomobileIosPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"gomobile_ios"
                                     binaryMessenger:[registrar messenger]];
    GomobileIosPlugin* instance = [[GomobileIosPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if([@"getSayHi" isEqualToString:call.method]) {
        NSDictionary *dic = @{@"name":@"惊鸿仙子",@"age":@(25),@"sex":@"女"};
        User *userData = [User yy_modelWithDictionary:dic];
        NSString *info = [userData yy_modelToJSONString];
        NSString * rStr = [NSString stringWithFormat:@"iOS %@",DemoSayHi(info)];
        result(rStr);
    }else {
        result(FlutterMethodNotImplemented);
    }
}

@end
