//
//  User.swift
//  InstgramClone
//
//  Created by Ecc on 02.08.23.
//

import Foundation
import Firebase
struct User : Identifiable,Hashable, Codable {
    let id: String
    var userName : String
    var profileImageUrl : String?
    var fullname : String?
    var bio : String?
    var email : String
    var isCurrenUser : Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
            return currentUid == id
    }
    
}


extension User {
    static var MOCK_USERS: [User] = [
    
        .init(id: NSUUID().uuidString, userName: "batman",profileImageUrl: nil,fullname: "Bruce Wayne",bio: "Gotham's Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, userName: "venom",profileImageUrl: nil,fullname: "Eddie Brock",bio: "Venom", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, userName: "ironman",profileImageUrl: nil,fullname: nil,bio: "PlayBoy", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, userName: "spiderman",profileImageUrl: nil,fullname: "Peter Parker",bio: "Test Bio", email: "spiderman@gmail.com"),
    ]
}
