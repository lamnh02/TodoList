//
//  ItemModel.swift
//  TodoList
//
//  Created by Huu Lam Nguyen on 19/03/2022.
//

import Foundation
import SwiftUI

struct ItemModel: Identifiable, Codable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool

    
}
