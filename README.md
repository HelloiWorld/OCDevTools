# ZKTools
Useful tools for iOS development

## Categories
Here are just **global** configurations and useful methods. You will have a variety of catrgories according to the needs of the business.

#### NavigationBar
- UIViewController+Swizzling  快速配置全局导航栏，统一风格
- UIViewController+BackButtonHandler  用于拦截系统返回按钮的点击事件，实现`-(BOOL)navigationShouldPopOnBackButton`即可
- UILayoutFittingView 解决iOS11自定义导航栏titleView显示异常的问题，继承即可

#### UIImage
- UIImage+Color 快速生成纯色图片

#### UILabel
- UILabel+LineSpace 快速设置文本标签行间距

#### UITextField
- UITextField+Editing 解决编辑状态文字下移的问题，也可自定义全局光标颜色
