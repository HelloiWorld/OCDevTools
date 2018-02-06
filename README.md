# git开发流程

1. fork 请把项目fork到自己的仓库
2. git clone git@github.com:HelloiWorld/ObjcDevTools.git 把项目克隆到本地（克隆）
3. git remote rename origin upstream 把origin仓库名改为upstream
4. git remote add origin [自己的仓库地址]

规范的开发形式应该为pull request形式
1. 本地git checkout 一个新的分支，修改完commit以后，git push (默认就是push到origin仓库的对应分支，若没有则新建一个分支)
2. 此时打开 https://github.com/HelloiWorld/ObjcDevTools 会自动有一个生成pr的按钮，然后生成一个pr,pr会跑ci，然后通过了ci以后可以merge.
3. 回到本地，git pull upstream master保持本地master为最新状态。

tips:
1. 目前基本是一个人负责一个项目的情况下，允许本地直接修改master，然后git push upstream master这个操作（会直接覆盖主仓库的master）， 由每个人对所写项目的主仓库负责。
2. 每次开发前最好git pull upstream master，这个习惯会让你避免开发了一会发现跟主仓库代码不一致还要去git rabase
3. 一旦人员数超过3人开发同一个项目，禁止1操作。



# Base
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



# Macros
Here defines some **common** macros.  

### UIDeviceMacros
这里定义了设备相关的宏，包括系统版本、设备尺寸（机型）判断

### UtilMacros
这里提供了一些小巧精致耐用的宏，以节省重复代码书写

