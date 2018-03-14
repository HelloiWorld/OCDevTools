Here are some **basic** classes can be used by any project.  

### BaseJsonModel
小巧，轻量级的Json模型，用于 本地Model<-->服务端Json 快速互转

### BaseNavigationController
UINavigationController的基类，重写了`pushViewController:animated`代理方法

1. 在跳转时自动隐藏tabBar
2. 解决iPhone X跳转时tabBar上移的问题 



# Categories
Here are just **global** configurations and useful methods.  
You should have a variety of catrgories according to the needs of the business， although too many categories will increase App launch time.

#### NavigationBar
- UIViewController+Swizzling  快速配置全局导航栏，统一风格
- UIViewController+BackButtonHandler  用于拦截系统返回按钮的点击事件，实现`-(BOOL)navigationShouldPopOnBackButton`即可
- UILayoutFittingView 解决iOS11自定义导航栏titleView显示异常的问题，继承即可
- UINavigationBar+Swizzling 解决标题过长时，设置navigationItem.title导致标题偏移的问题，关于导航栏渐变效果，建议移步[WRNavigationBar](https://github.com/wangrui460/WRNavigationBar)

#### NSData
- NSDate+Base64 基于Base64编解码

#### NSTimer
- NSTimer+WeakTimer 解决timer引起的循环引用(retain cycle)问题

#### UIButton
- UIButton+EdgeInsets 提供了快速交换UIButton中图片和文字位置的方法

#### UIColor
- UIColor-Adaptive 使用hex设置颜色

#### UIImage
- UIImage+Color 快速生成纯色图片

#### UILabel
- UILabel+LineSpace 快速设置文本行间距

#### UIScrollView
- UIScrollView+Direction kvo获得UIScrollView或其子类的滚动方向

#### UITextField
- UITextField+Editing 解决编辑状态文字下移的问题，也可自定义全局光标颜色

#### UITextView
- UITextView+LineSpace 同UILabel，快速设置文本行间距

#### UIView
- UIView+Responder 获取view对应的父vc
- UIViewAdditions UIView的extensions，并提供了在父视图superview或子视图subviews中寻找指定继承class类的view的方法



# CustomControls
Here are some **custom controls** can be inherited to reduce the codes.

### LimitTextField
封装了`UITextField`的`UIControlEventEditingChanged`事件，用于限制输入字符长度和特殊字符的过滤，直接继承即可

### LimitTextView
继承了`UITextView`，重写了代理方法，使用时需要将`delegate`指向其子类，可以方便的显示默认提示文字及字符计数


# Macros
Here defines some **common** macros.  

### UIDeviceMacros
这里定义了设备相关的宏，包括系统版本、设备尺寸（机型）判断

### UtilMacros
这里提供了一些小巧精致耐用的宏，以节省重复代码书写

