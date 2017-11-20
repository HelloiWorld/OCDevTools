# ZKTools
Useful tools for iOS development

## Categories
Here are just **global** configurations and useful methods.  
You should have a variety of catrgories according to the needs of the business， although too many categories will increase App launch time.

#### NavigationBar
- UIViewController+Swizzling  快速配置全局导航栏，统一风格
- UIViewController+BackButtonHandler  用于拦截系统返回按钮的点击事件，实现`-(BOOL)navigationShouldPopOnBackButton`即可
- UILayoutFittingView 解决iOS11自定义导航栏titleView显示异常的问题，继承即可
- UINavigationBar+Swizzling 解决标题过长时，设置navigationItem.title导致标题偏移的问题
- UINavigationItem+Swizzling 设置导航栏titleView标签文字为从中间截取

#### NSTimer
- NSTimer+WeakTimer 解决timer引起的循环引用(retain cycle)问题

#### UIImage
- UIImage+Color 快速生成纯色图片

#### UILabel
- UILabel+LineSpace 快速设置文本标签行间距

#### UITextField
- UITextField+Editing 解决编辑状态文字下移的问题，也可自定义全局光标颜色

#### UIView
- UIView+Responder 获取view对应的父vc
- UIViewAdditions UIView的extensions，并提供了在父视图superview或子视图subviews中寻找指定继承class类的view的方法



## Macros
Here defines some **common** macros.  

#### UIDeviceMacros
这里定义了设备相关的宏，包括系统版本、设备尺寸（机型）判断

#### UtilMacros
这里提供了一些小巧精致耐用的宏，以节省重复代码书写

