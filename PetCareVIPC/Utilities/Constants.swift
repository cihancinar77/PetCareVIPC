//
//  Constants.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

enum APIUrls {
    static let searchResultUrl = URL(string: "https://api.npoint.io/84ce6371b6b39be36ca6")!
}

enum Colors {
    static let violet = UIColor.init(hexString: "4552CB")
    static let black = UIColor.init(hexString: "070821")
    static let orange = UIColor.init(hexString: "F1A852")
    static let yellow = UIColor.init(hexString: "FFCF6F")
    static let red = UIColor.init(hexString: "ED6D4E")
    static let pink = UIColor.init(hexString: "FD90AA")
    static let darkBlue = UIColor.init(hexString: "2E1E7A")
    static let lightGrey = UIColor.init(hexString: "F0F0F8")
    static let pageGrey = UIColor.init(hexString: "E5E5E5")
    static let grey = UIColor.init(hexString: "BBC3CE")
}

enum Fonts {
	enum EncodeSans {
       static let black = "EncodeSans-Black"
       static let bold = "EncodeSans-Bold"
       static let bExtraBold = "EncodeSans-ExtraBold"
       static let extraLight = "EncodeSans-ExtraLight"
       static let light = "EncodeSans-Light"
       static let medium = "EncodeSans-Medium"
       static let regular = "EncodeSans-Regular"
       static let semiBold = "EncodeSans-SemiBold"
       static let thin = "EncodeSans-Thin"
    }
}

enum FontSize {
    static let h1Headline: CGFloat = 34
    static let h2Headline: CGFloat = 24
    static let h3Headline: CGFloat = 18
    static let h4Headline: CGFloat = 16
    static let h5Headline: CGFloat = 14
    static let h6Headline: CGFloat = 13
    static let body1: CGFloat = 16
    static let body2: CGFloat = 14
    static let body3: CGFloat = 12
    static let button: CGFloat = 16
    static let caption: CGFloat = 11
}
