//
//  User.swift
//  ToDoList
//
//  Created by Bartek Prejs on 05/06/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let username: String
    let email: String
    let joined: TimeInterval
}
