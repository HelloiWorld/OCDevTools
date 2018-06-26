//
//  ZKTipsDescription.h
//  DevTools
//
//  Created by PengZK on 2018/5/16.
//  Copyright © 2018年 None. All rights reserved.
//

#ifndef ZKTipsDescription_h
#define ZKTipsDescription_h

// 列表单页数据最大长度
static const CGFloat kMaxListLimit = 20;

/*
 七牛提供的压缩图片方式: https://developer.qiniu.com/dora/manual/1279/basic-processing-images-imageview2
 
 /0/w/<LongEdge>/h/<ShortEdge>    限定缩略图的长边最多为<LongEdge>，短边最多为<ShortEdge>，进行等比缩放，不裁剪。如果只指定 w 参数则表示限定长边（短边自适应），只指定 h 参数则表示限定短边（长边自适应）。
 /1/w/<Width>/h/<Height>    限定缩略图的宽最少为<Width>，高最少为<Height>，进行等比缩放，居中裁剪。转后的缩略图通常恰好是 <Width>x<Height> 的大小（有一个边缩放的时候会因为超出矩形框而被裁剪掉多余部分）。如果只指定 w 参数或只指定 h 参数，代表限定为长宽相等的正方图。
 /2/w/<Width>/h/<Height>    限定缩略图的宽最多为<Width>，高最多为<Height>，进行等比缩放，不裁剪。如果只指定 w 参数则表示限定宽（长自适应），只指定 h 参数则表示限定长（宽自适应）。它和模式0类似，区别只是限定宽和高，不是限定长边和短边。从应用场景来说，模式0适合移动设备上做缩略图，模式2适合PC上做缩略图。
 /3/w/<Width>/h/<Height>    限定缩略图的宽最少为<Width>，高最少为<Height>，进行等比缩放，不裁剪。如果只指定 w 参数或只指定 h 参数，代表长宽限定为同样的值。你可以理解为模式1是模式3的结果再做居中裁剪得到的。
 /4/w/<LongEdge>/h/<ShortEdge>    限定缩略图的长边最少为<LongEdge>，短边最少为<ShortEdge>，进行等比缩放，不裁剪。如果只指定 w 参数或只指定 h 参数，表示长边短边限定为同样的值。这个模式很适合在手持设备做图片的全屏查看（把这里的长边短边分别设为手机屏幕的分辨率即可），生成的图片尺寸刚好充满整个屏幕（某一个边可能会超出屏幕）。
 /5/w/<LongEdge>/h/<ShortEdge>    限定缩略图的长边最少为<LongEdge>，短边最少为<ShortEdge>，进行等比缩放，居中裁剪。如果只指定 w 参数或只指定 h 参数，表示长边短边限定为同样的值。同上模式4，但超出限定的矩形部分会被裁剪。
 */
#define QINIU_THUMBNAIL_IMAGE_LONGEDGE(__longEdge) [NSString stringWithFormat:@"?imageView2/0/w/%d", __longEdge]
#define QINIU_THUMBNAIL_IMAGE_LONGEDGE_SHORTWDGE(__longEdge, __shortEdge) [NSString stringWithFormat:@"?imageView2/0/w/%d/h/%d", __longEdge, __shortEdge]


static NSString * const kTipDsc_service_tel = @"400-000-0000";  //客服电话
#define ZK_SERVICE_TEL_STR [NSString stringWithFormat:@"telprompt://%@",kTipDsc_service_tel]

#endif /* ZKTipsDescription_h */
