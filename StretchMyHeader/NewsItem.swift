//
//  NewsItem.swift
//  StretchMyHeader
//
//  Created by Jeff Huang on 2015-08-04.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

import UIKit



class NewsItem: NSObject {
    enum Category {
        case World
        case Americas
        case Europe
        case MiddleEast
        case Africa
        case AsiaPacific
    }
    
    var category = ""
    var categoryColor = UIColor.blackColor()
    var headline = ""
    
    init(category: Category, headline: String) {
        self.headline = headline
        switch category {
        case .World:
            self.category = "World"
            self.categoryColor = UIColor.greenColor()
        case .Americas:
            self.category = "Americas"
            self.categoryColor = UIColor.orangeColor()
        case .Europe:
            self.category = "Europe"
            self.categoryColor = UIColor.blueColor()
        case .MiddleEast:
            self.category = "Middle East"
            self.categoryColor = UIColor.purpleColor()
        case .Africa:
            self.category = "Africa"
            self.categoryColor = UIColor.redColor()
        case .AsiaPacific:
            self.category = "Asia Pacific"
            self.categoryColor = UIColor.yellowColor()
        }
    }
}
