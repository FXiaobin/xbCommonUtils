//
//  xbDefine.swift
//  xbUtilsFramework
//
//  Created by huadong on 2022/1/25.
//

import UIKit
import Foundation

/** * 定义日志打印输出方法 * * message: 具体的输出内容 * file: 项目名称 * method: 方法名称 * line: 第几行代码 */
public func DDLog<T>(_ message: T,file: String = #file,method: String = #function,line: Int = #line){
    #if DEBUG
        // 获取打印路径中的文件名
        let lastFileName: Substring = file.split(separator: "/").last!
        print("***打印日志:\(lastFileName), \(method), [第\(line)行]:\(message)")
    #endif
}

/** 字体 常规*/
public func kFont(fontSize: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize)
}

/** 字体 中等*/
public func kFontMedium(fontSize: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize, weight: .medium)
}

/** 字体 粗体*/
public func kFontBlod(fontSize: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: fontSize)
}

/** 字体 超粗体*/
public func kFontHeavy(fontSize: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize, weight: .heavy)
}

/** 字体 自定义粗细胖瘦 */
public func kFont(fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize, weight: weight)
}


/** UIImage*/
public func kImage(named: String) -> UIImage?{
    return UIImage(named: named)
}

/** 字符串国际化*/
func kLocalized(string: String) -> String {
    return NSLocalizedString(string, comment: "")
}

/** 获取屏幕尺寸适配比例，参数：UI设计图的宽度，默认是375.0*/
public func kScale(designSizeWith: CGFloat = 375.0, _ value: CGFloat) -> CGFloat {
    let scale = min(kWidth, kHeight)  / designSizeWith
    let scaleValue = value * scale
    return scaleValue
}

/** 状态栏高度（状态栏高度44.0/47.0 非IPoneX手机为20）*/
public func kStatusBarHeight() -> CGFloat {
    if #available(iOS 13.0, *){
        if let keyWind = kKeyWindow {
            let statusBarH: CGFloat? = keyWind.windowScene?.statusBarManager?.statusBarFrame.size.height
            if let statusH = statusBarH {
                return statusH
            }else{
                return  UIApplication.shared.statusBarFrame.size.height
            }
            
        }else{
            return  UIApplication.shared.statusBarFrame.size.height
        }
   
    }else{
        return  UIApplication.shared.statusBarFrame.size.height
    }
}

/** 安全区域 - 顶部高度*/
public func kSafeAreaInsetsTopHeight() -> CGFloat {
    // 经打印发现安全区域顶部高度跟状态栏高度一样
    var topH: CGFloat = kStatusBarHeight()
    // var topH: CGFloat = 0.0
    
    if kIsIphoneX {
        topH = 44.0
        //topH = 47.0
        if #available(iOS 11.0, *) {
            if let window = kKeyWindow {
                topH = window.safeAreaInsets.top
            }
        }
    }
    
    return topH
}

/** 安全区域 - 底部高度*/
public func kSafeAreaInsetsBottomHeight() -> CGFloat {
    var bottomH: CGFloat = 0.0
    
    if kIsIphoneX {
        bottomH = 34.0
        if #available(iOS 11.0, *) {
            if let window = kKeyWindow {
                bottomH = window.safeAreaInsets.bottom
            }
        }
    }
    
    return bottomH
}

/** 获取keyWindow */
public let kKeyWindow: UIWindow?    = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
//public let kKeyWindow: UIWindow?    = UIApplication.shared.windows.last
//public let kKeyWindow: UIWindow?    = UIApplication.shared.windows.first{ $0.isKeyWindow }

//设备屏幕尺寸
public let kScreenWidth     =   UIScreen.main.bounds.size.width
public let kScreenHeight    =   UIScreen.main.bounds.size.height

//设备屏幕尺寸
public let kWidth           =   min(kScreenWidth, kScreenHeight)
public let kHeight          =   max(kScreenWidth, kScreenHeight)

/** 是否时刘海屏*/
public let kIsIphoneX              :Bool    = (kStatusBarHeight() > 20.0)
//public let kIsIphoneX            :Bool    = (kHeight >= 812.0)



/** 顶部安全区域高度*/
//public let kSafeAreaTopHeight    :CGFloat = (kIsIphoneX ? 44.0 : 0.0)
public let kSafeAreaTopHeight      :CGFloat = kSafeAreaInsetsTopHeight()

/** 底部安全区域高度*/
//public let kSafeAreaBottomHeight   :CGFloat = (kIsIphoneX ? 34.0 : 0.0)
public let kSafeAreaBottomHeight   :CGFloat = kSafeAreaInsetsBottomHeight()

/** 底部菜单栏高度*/
public let kTabBarHeight           :CGFloat = (kSafeAreaBottomHeight + 49.0)

/** 导航栏高度*/
public let kNavigationBarHeight    :CGFloat = (kSafeAreaTopHeight + 44.0)



/** UUID*/
public let kUUID: String = (CFUUIDCreateString(nil, CFUUIDCreate(nil)) as String).replacingOccurrences(of: "-", with: "").lowercased()

/** Build号*/
public let kAppBuild  : String = Bundle.main.infoDictionary!["CFBundleVersion"] as! String

/** BundleID*/
public let kBundleID  : String = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String

/** 版本号*/
public let kAppVersion: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String


