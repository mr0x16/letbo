// Generated by Apple Swift version 3.0.2 (swiftlang-800.0.63 clang-800.0.42.1)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import Foundation;
@import CoreGraphics;
@import ObjectiveC;
#endif

#import "/Users/maxuesong/Documents/git/letbo/letbo-Bridging-Header.h"

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIViewController;
@class UIApplication;

SWIFT_CLASS("_TtC5letbo11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull weiboAppKey;)
+ (NSString * _Nonnull)weiboAppKey;
@property (nonatomic, strong) UIViewController * _Nonnull beginView;
@property (nonatomic) BOOL loginStaute;
@property (nonatomic, readonly, copy) NSString * _Nonnull env;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (BOOL)application:(UIApplication * _Nonnull)application openURL:(NSURL * _Nonnull)url sourceApplication:(NSString * _Nullable)sourceApplication annotation:(id _Nonnull)annotation;
- (BOOL)application:(UIApplication * _Nonnull)application handleOpenURL:(NSURL * _Nonnull)url;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;
@class UINavigationBar;
@class UITabBar;
@class UITabBarItem;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC5letbo14ViewController")
@interface ViewController : UIViewController <UITabBarDelegate>
@property (nonatomic, readonly, copy) NSString * _Nonnull FEEDLIST;
@property (nonatomic, readonly, copy) NSString * _Nonnull HOTLIST;
@property (nonatomic, readonly, copy) NSString * _Nonnull HOME;
@property (nonatomic, readonly, strong) UILabel * _Nonnull titleLabel;
@property (nonatomic, readonly, strong) UINavigationBar * _Nonnull navigationBar;
@property (nonatomic, readonly, strong) UITabBar * _Nonnull tabbar;
@property (nonatomic, readonly, strong) UITabBarItem * _Nonnull tabItem1;
@property (nonatomic, readonly, strong) UITabBarItem * _Nonnull tabItem2;
@property (nonatomic, readonly, strong) UITabBarItem * _Nonnull tabItem3;
@property (nonatomic, strong) UIViewController * _Nonnull context;
@property (nonatomic, strong) UIViewController * _Nullable currentView;
- (void)viewDidLoad;
- (void)signalTest;
- (void)didReceiveMemoryWarning;
- (UIViewController * _Nonnull)viewControllerProductWithVcType:(NSString * _Nonnull)vcType;
- (void)tabBar:(UITabBar * _Nonnull)tabBar didSelectItem:(UITabBarItem * _Nonnull)item;
- (void)initFirstShow SWIFT_METHOD_FAMILY(none);
/**
  切换填充视图的方法
  \param nextVC 要展示的视图

  \param showFrame 要展示视图在当前视图占据的区域

  \param complate 完成后回调的closure

*/
- (void)replaceViewControllerWithNextVC:(UIViewController * _Nullable)nextVC showFrame:(CGRect)showFrame complate:(SWIFT_NOESCAPE void (^ _Nonnull)(BOOL))complate;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class UITableViewCell;

SWIFT_CLASS("_TtC5letbo18feedViewController")
@interface feedViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, readonly, strong) UITableView * _Nonnull feedList;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)dataUpdate;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5letbo18homeViewController")
@interface homeViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5letbo17hotViewController")
@interface hotViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5letbo10myKeychain")
@interface myKeychain : NSObject
+ (void)setKeychainWithKey:(NSString * _Nonnull)key object:(NSString * _Nonnull)object;
+ (NSString * _Nullable)getKeychainWithKey:(NSString * _Nonnull)key;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIButton;

SWIFT_CLASS("_TtC5letbo18testViewController")
@interface testViewController : UIViewController
@property (nonatomic, readonly, strong) UIButton * _Nonnull authorizeButton;
@property (nonatomic, readonly, strong) UIButton * _Nonnull feedlistButton;
@property (nonatomic, readonly, strong) UIButton * _Nonnull revokeAuthorizeButton;
@property (nonatomic, readonly) CGRect viewFrame;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class WBBaseRequest;
@class WBBaseResponse;

SWIFT_CLASS("_TtC5letbo15weiboGetRequest")
@interface weiboGetRequest : NSObject <WeiboSDKDelegate>
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull baseURL;)
+ (NSString * _Nonnull)baseURL;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) AppDelegate * _Nonnull appDelegate;)
+ (AppDelegate * _Nonnull)appDelegate;
@property (nonatomic) NSInteger countAuthorize;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL reLoginStaute;)
+ (BOOL)reLoginStaute;
+ (void)setReLoginStaute:(BOOL)value;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (void)didReceiveWeiboRequest:(WBBaseRequest * _Null_unspecified)request;
- (void)didReceiveWeiboResponse:(WBBaseResponse * _Null_unspecified)response;
- (NSURLRequest * _Nullable)adapt:(NSURLRequest * _Nonnull)urlRequest error:(NSError * _Nullable * _Nullable)error;
+ (void)oauth2Request;
@end

#pragma clang diagnostic pop
