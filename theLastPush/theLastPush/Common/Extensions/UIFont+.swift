//
//  UIFont+.swift
//  theLastPush
//
//  Created by seongjun cho on 5/21/25.
//

import UIKit

extension UIFont {
	static func ibmPlexSansKR(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
		let descriptor = UIFontDescriptor(
			fontAttributes: [
				.family: "IBM Plex Sans KR",
				.traits: [
					UIFontDescriptor.TraitKey.weight: weight
				]
			]
		)

		return UIFont(descriptor: descriptor, size: size)
	}

	static func nunitoSans(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
		let descriptor = UIFontDescriptor(
			fontAttributes: [
				.family: "Nunito Sans",
				.traits: [
					UIFontDescriptor.TraitKey.weight: weight
				]
			]
		)

		return UIFont(descriptor: descriptor, size: size)
	}
}
