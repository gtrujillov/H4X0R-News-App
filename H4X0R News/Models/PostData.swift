//
//  PostData.swift
//  H4X0R News
//
//  Created by gonzalo trujillo vallejo on 21/1/23.
//

import Foundation

struct Results: Decodable {
    let hits : [Post]
}

struct Post: Decodable, Identifiable {
    var id : String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
