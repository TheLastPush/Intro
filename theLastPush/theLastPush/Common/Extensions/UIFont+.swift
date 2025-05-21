//
//  UIFont+.swift
//  theLastPush
//
//  Created by seongjun cho on 5/21/25.
//

import UIKit

extension UIFont? {
	func unwrap(fontSize: CGFloat) -> UIFont {
		guard self != nil else {
			print("Alert: UIFont is nil")
			return UIFont.systemFont(ofSize: fontSize)
		}

		return self!
	}
}
