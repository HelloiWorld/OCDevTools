# Base

Here are some **basic** classes can be used by any project.  

#### BaseJsonModel([BaseJsonModel.h](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Base/Model/BaseJsonModel.h)/[BaseJsonModel.m](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Base/Model/BaseJsonModel.m))
小巧，轻量级的Json模型，用于 本地Model<-->服务端Json 快速互转

#### BaseNavigationController([BaseNavigationController.h](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Base/ViewController/NavigationController/BaseNavigationController.h)/[BaseNavigationController.m](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Base/ViewController/NavigationController/BaseNavigationController.m))
UINavigationController的基类，重写了`pushViewController:animated`代理方法

1. 在跳转时自动隐藏tabBar
2. 解决iPhone X跳转时tabBar上移的问题 

#### BaseViewController([BaseViewController.h](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Base/ViewController/ViewController/BaseViewController.h)/[BaseViewController.m](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Base/ViewController/ViewController/BaseViewController.m))
基类，提供隐藏导航栏及返回的方法，也可自定义导航栏的一些属性

#### BlankViewController([BlankViewController.h](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Base/ViewController/ViewController/BlankViewController.h)/[BlankViewController.m](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Base/ViewController/ViewController/BlankViewController.m))
提供了无数据或无网络情况下页面默认显示内容，提供了跳转过渡时动画方法

#### ZKWebViewController([ZKWebViewController.h](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Base/ViewController/WebViewController/ZKWebViewController.h)/[ZKWebViewController.m](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Base/ViewController/WebViewController/ZKWebViewController.m))
带进度条的WebViewController，与JS交互时提供了解析方法



# Categories
Here are just **global** configurations and useful methods.  
You should have a variety of catrgories according to the needs of the business， although too many categories will increase App launch time.

#### NavigationBar
> 关于导航栏渐变效果，建议移步[WRNavigationBar](https://github.com/wangrui460/WRNavigationBar)

- [UIViewController+Swizzling](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/NavigationBar/UIViewController%2BSwizzling.m)：快速配置全局导航栏，统一风格
- [UIViewController+BackButtonHandler](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/NavigationBar/UIViewController%2BBackButtonHandler.m)：用于拦截系统返回按钮的点击事件，实现`-(BOOL)navigationShouldPopOnBackButton`即可
- [UILayoutFittingView](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/NavigationBar/UILayoutFittingView.m)：解决iOS11自定义导航栏titleView显示异常的问题，继承即可

#### NSArray
- [NSArray+Search](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/NSArray/NSArray%2BSearch.m)：在本地数组中搜索包含指定条件的数据
- [NSArray+Sort](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/NSArray/NSArray%2BSort.m)：系统提供的数组快速排序的封装

#### NSData
- [NSData+Base64](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/NSData/NSData%2BBase64.m)：基于Base64编解码

#### NSDate
- [NSDate+Format](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/NSDate/NSDate%2BFormat.m)：提供了NSString<-->NSDate<-->timesTamp的转换方法

#### NSTimer
- [NSTimer+WeakTimer](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/NSTimer/NSTimer%2BWeakTimer.m)：解决timer引起的循环引用(retain cycle)问题

#### UIButton
- [UIButton+EdgeInsets](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UIButton/UIButton%2BEdgeInsets.m)：提供了快速交换UIButton中图片和文字位置的方法

#### UIColor
- [UIColor-Adaptive](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UIColor/UIColor-Adaptive.m) 使用hex设置颜色

#### UIImage
- [UIImage+Color](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UIImage/UIImage%2BColor.m) 快速生成纯色图片及有渐变效果的图片

#### UILabel
- [UILabel+LineSpace](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UILabel/UILabel%2BLineSpace.m) 快速设置文本行间距

#### UIScrollView
- [UIScrollView+Direction](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UIScrollView/UIScrollView%2BDirection.m) kvo获得UIScrollView或其子类的滚动方向

#### UITextField
- [UITextField+Editing](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UITextField/UITextField%2BEditing.m) 解决编辑状态文字下移的问题，也可自定义全局光标颜色

#### UITextView
- [UITextView+LineSpace](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UITextView/UITextView%2BLineSpace.m) 同UILabel，快速设置文本行间距

#### UIView
- [UIView+Alert](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UIView/UIView%2BAlert.m) 快速弹出Toast提示及UIAlertViewController 
- [UIView+Animation](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UIView/UIView%2BAnimation.m) 提供了一些封装的动画写法
- [UIView+Responder](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UIView/UIView%2BResponder.m) 获取view对应的父vc
- [UIViewAdditions](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Categories/UIView/UIViewAdditions.m) UIView的extensions，并提供了在父视图superview或子视图subviews中寻找指定继承class类的view的方法



# CustomControls
Here are some **custom controls** can be inherited to reduce the codes.

#### Alert
- [AlignLeftAlertController](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/CustomControls/Alert/AlignLeftAlertController.m)
：message文本左对齐的UIAlertController

- [ForceAlertView](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/CustomControls/Alert/ForceAlertView.m) 
：点击后按钮依然存在的UIAlertView，可用于做强制升级的弹框

#### TableHeaderView
[ZKTableHeaderView](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/CustomControls/TableHeaderView/ZKTableHeaderView.m)
：利用Masonry写的可随内部文字变化自动调节高度的tableHeaderView

#### TextField
[LimitTextField](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/CustomControls/LimitTextField/LimitTextField.m)
：封装了`UITextField`的`UIControlEventEditingChanged`事件，用于限制输入字符长度和特殊字符的过滤，直接继承即可

#### TextView
[LimitTextView](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/CustomControls/LimitTextView/LimitTextView.m)
：继承了`UITextView`，重写了代理方法，使用时需要将`delegate`指向其子类，可以方便的显示默认提示文字及字符计数

# Helpers
### AppManager
- [ZKAppManager](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Helpers/AppManager/ZKAppManager.m)：提供了快速获取全局容器的方法 及 全局临时数据存储接口
- [ZKFileHandler](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Helpers/AppManager/ZKFileHandler.m)：快速使用NSUserDefaults数据接口，建议把需要用到属性都用静态变量存储到这里，便于管理

### EventCalendar
[EventCalendar](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Helpers/EventCalendar/EventCalendar.m)：封装了保存到日历及提醒事项的方法

# Macros
Here defines some **common** macros. 

### [CommonThemeMacro](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Macros/CommonThemeMacro.h)
全局颜色的一些设置，如果以后支持换肤，使用宏就很有必要了

### [UIDeviceMacros](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Macros/UIDeviceMacros.h)
这里定义了设备相关的宏，包括系统版本、设备尺寸（机型）判断

### [UtilMacros](https://github.com/HelloiWorld/ObjcDevTools/blob/master/DevTools/DevTools/Expand/Macros/UtilMacros.h)
这里提供了一些小巧精致耐用的宏，方便使用

