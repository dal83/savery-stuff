//
//  MethodItem.swift
//  Savery
//
//  Created by Deborah Lilly on 1/30/21.
//  Copyright © 2021 SaveryApp. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

struct methodItem: Identifiable {
    let id = UUID()
    let methodName: String
    let description: String
    let actionItems: String
    let imageName: String
    let smallImage: String
    let links: [Link<Text>]
}
