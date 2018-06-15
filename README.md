# LKLocalizedDemo
实现国际化本地语言切换功能


1，PROJECT-Info-Localize 添加所支持的语言。
2、新建InfoPlist.strings文件，选择所支持的语言。
3、在InfoPlist.strings中定义key-value
4、新增分类#import "NSBundle+LKLanguage.h"
5、在appdelegate中设置上一次修改的语言。
6、切换语言事件处理时，重新设置并保存语言，并重新设置根视图，跳转至当前界面。

注意事项：
1、必须为InfoPlist.strings文件名才能跟随系统，如自定义其它名称，第一次安装不会跟随系统语言，其次，appName不会跟随系统变化。
2、InfoPlist.strings文件中设置key-value注意事项
/**
 * 格式如：key = "value";
 * 注意：
 *  1、key 不能包含空格及特殊符号
 *  2、每行key-value都需要带上分号;
 *  3、各种语言key必须一致
 **/
 3、注意语言大小写，如zh-hans是不无效的。
    static NSString *kChinese = @"zh-Hans";
    static NSString *kEnglish = @"en";
