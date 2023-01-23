//
//  TabType.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/11/22.
//

import Foundation
import SwiftUI

enum TabType: Int, CaseIterable {
    case list, settings, info, favourite
    
    func title() -> String {
        switch self {
        case .list:
            return "list".capitalized
        case .settings:
            return "settings".capitalized
        case .info:
            return "info".capitalized
        case .favourite:
            return "favourites".capitalized
        }
    }
    
    func image() -> String {
        switch self {
        case .list:
            return "list.bullet.rectangle.fill"
        case .settings:
            return "gearshape.fill"
        case .info:
            return "info"
        case .favourite:
            return "heart"
        }
    }
}
