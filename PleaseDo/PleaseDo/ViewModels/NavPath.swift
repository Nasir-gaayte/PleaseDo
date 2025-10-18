//
//  NavPath.swift
//  PleaseDo
//
//  Created by nasir on 17/10/25.
//


import SwiftUI
import Foundation


enum NavPath: Hashable {
    case newItem
    case details(Item)
}
