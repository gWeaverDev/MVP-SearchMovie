//
//  Comment.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 08.06.2023.
//

import Foundation

struct Comment: Decodable {
    
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
