//
//  Post.swift
//  InstgramClone
//
//  Created by Ecc on 02.08.23.
//

import Foundation
import Firebase
struct Post : Identifiable, Hashable, Codable {
    let id: String
    let ownerUid : String
    let caption : String
    let likes : Int
    let imageUrl : String
    let timesTamp : Timestamp
    var user : User?
}

extension Post {
    static var MOCK_POSTS : [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is some Test Caption for now", likes: 123, imageUrl: "batman-2", timesTamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Venom is hungry. Time to eat", likes: 314, imageUrl: "venom", timesTamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Iron Man", likes: 314, imageUrl: "ironman", timesTamp: Timestamp(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Spiderman", likes: 314, imageUrl: "spiderman", timesTamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Spiderman", likes: 314, imageUrl: "venom", timesTamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Spiderman", likes: 314, imageUrl: "joshua", timesTamp: Timestamp(), user: User.MOCK_USERS[3]),
    ]
}
