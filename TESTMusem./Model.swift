//
//  Model.swift
//  TESTMusem.
//
//  Created by Mac on 11.02.2023.
//

import Foundation

struct Model: Decodable {
    let artObjects: [ArtObject]
}

struct ArtObject: Decodable {
    let objectNumber: String
    let principalOrFirstMaker: String
    let longTitle: String
    let title: String
    let webImage: Image
}
struct Image: Decodable {
    let guid: String  
    let url: String
}


