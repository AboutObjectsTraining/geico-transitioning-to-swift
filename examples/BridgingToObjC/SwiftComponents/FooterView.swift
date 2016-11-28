//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

@IBDesignable
public class FooterView: UIView
{
    @IBInspectable public var text: String? = "Hello, World!"
    
    static let defaultAttributes: [String: Any] = {
        return [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18),
                NSForegroundColorAttributeName: UIColor.white]
    }()
    
    public class var attributes: [String: Any] {
        return FooterView.defaultAttributes
    }
    
    public override func draw(_ rect: CGRect) {
        guard let text = text else { return }
        (text as NSString).draw(at: CGPoint(x: 15, y: 8), withAttributes: type(of: self).attributes)
    }
}
