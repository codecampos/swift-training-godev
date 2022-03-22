//
//  Person.swift
//  App
//
//  Created by Idwall Go Dev 013 on 21/03/22.
//

import Foundation
import UIKit

// MARK: - Person
struct Person: Codable {
    let id: Int
    let name: String
    var photo: String
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
}


