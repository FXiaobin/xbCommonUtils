//
//  xbUIViewUtils.swift
//  xbUtilsFramework
//
//  Created by huadong on 2022/1/25.
//

import UIKit

class xbUIViewUtils: NSObject {

    /** 创建label font*/
    class func createLabelWith(frame: CGRect, text: String?, textColor: UIColor, textAlignment: NSTextAlignment,font: UIFont!, numberOfLines: Int) -> UILabel{
        
        let label = UILabel.init(frame: frame)
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        // 文本宽度自适应
        label.adjustsFontSizeToFitWidth = true
       
        return label
    }
    
    
    /** 创建按钮 文字+图片+normal*/
    class func createButtonWith(frame: CGRect, title: String?, titleColor: UIColor?, imageName: String?, font: UIFont!, target: Any?, action: Selector? ,tag: Int = 0) -> UIButton{

        return createButtonWith(frame: frame, title: title, titleColor: titleColor, titleSelected: title, titleColorSelected: titleColor, imageName: imageName, imageNameSelected: imageName, font: font, target: target, action: action, tag: tag)
        
    }
    
    /** 创建按钮 仅文字*/
    class func createButtonWith(frame: CGRect, title: String?, titleColor: UIColor?, titleSelected: String?, titleColorSelected: UIColor?, font: UIFont!, target: Any?, action: Selector? ,tag: Int = 0) -> UIButton{
        
        return createButtonWith(frame: frame, title: title, titleColor: titleColor, titleSelected: titleSelected, titleColorSelected: titleColorSelected, imageName: nil, imageNameSelected: nil, font: font, target: target, action: action, tag: tag)
    }
    
    /** 创建按钮 仅图片*/
    class func createButtonWith(frame: CGRect, imageName: String?, imageNameSelected: String?, target: Any?, action: Selector? ,tag: Int = 0) -> UIButton{

        return createButtonWith(frame: frame, title: "", titleColor: UIColor.black, titleSelected: "", titleColorSelected: UIColor.black, imageName: imageName, imageNameSelected: imageNameSelected, font: UIFont.systemFont(ofSize: 15.0), target: target, action: action, tag: tag)
    }
    
    /** 创建按钮 文字+图片*/
    class func createButtonWith(frame: CGRect, title: String?, titleColor: UIColor?, titleSelected: String?,titleColorSelected: UIColor?, imageName: String?, imageNameSelected: String?, font: UIFont!, target: Any?, action: Selector? ,tag: Int = 0) -> UIButton{

        let button = UIButton(frame: frame)
        button.setTitle(title, for: .normal)
        button.setTitle(titleSelected, for: .selected)
        // 防止点击按钮时的过渡效果导致显示标题的错误
        // 可理解为普通状态下的高亮状态
        button.setTitle(title, for: .highlighted)
        // 可理解为选中状态下的高亮状态
        button.setTitle(titleSelected, for: [.selected, .highlighted])
        
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleColorSelected, for: .selected)
        if let nomalImage = imageName {
            button.setImage(UIImage(named: nomalImage), for: .normal)
            button.setImage(UIImage(named: nomalImage), for: .highlighted)
        }
        if let selImage = imageNameSelected {
            button.setImage(UIImage(named: selImage), for: .selected)
            button.setImage(UIImage(named: selImage), for: [.selected, .highlighted])
        }
        button.titleLabel?.font = font ?? UIFont.systemFont(ofSize: 15.0)
        if let act = action {
            button.addTarget(target, action: act, for: .touchUpInside)
        }
        // 屏蔽系统的点击高亮状态
        button.adjustsImageWhenHighlighted = false
        // 文本宽度自适应
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tag = tag
    
        return button
    }
    
    /** 创建UIImageView*/
    class func createImageViewWith(frame: CGRect, backgroundColor: UIColor, cornerRadius: CGFloat, contentMode: UIView.ContentMode) -> UIImageView {
        
        let imageView = UIImageView(frame: frame)
        imageView.backgroundColor = backgroundColor
        imageView.isUserInteractionEnabled = true
        
        imageView.clipsToBounds = true
        imageView.contentMode = contentMode
        
        if cornerRadius > 0.0 {
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = cornerRadius
        }
        
        return imageView
    }
    
    
    /** 创建UITextField*/
    class func createTextFildWith(frame: CGRect, text: String?, placeholder: String?, textColor: UIColor?, textAlignment: NSTextAlignment, font: UIFont?, borderStyle: UITextField.BorderStyle, keyboardType: UIKeyboardType, tintColor: UIColor) -> UITextField{
        
        let textFiled = UITextField(frame: frame)
        textFiled.text = text
        textFiled.textAlignment = textAlignment
        textFiled.textColor = textColor
        textFiled.tintColor = tintColor
        textFiled.font = font
        textFiled.placeholder = placeholder
        textFiled.borderStyle = borderStyle
        textFiled.keyboardType = keyboardType
        
        return textFiled
    }
    
    class func createTextViewWith(frame: CGRect, text: String?, textColor: UIColor?, textAlignment: NSTextAlignment, font: UIFont?, isEditable: Bool) -> UITextView {
        let textView = UITextView(frame: frame)
        textView.text = text
        textView.textColor = textColor
        textView.textAlignment = textAlignment
        textView.font = font
        textView.isEditable = isEditable
        
        return textView
    }
    
}
