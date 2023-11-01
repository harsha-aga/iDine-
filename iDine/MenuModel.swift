//
//  MenuModel.swift
//  iDine
//
//  Created by Harsha Agarwal on 31/10/23.
//

import Foundation

struct MenuSection: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let items: [MenuItem]
}

// MARK: - Item
struct MenuItem: Codable, Identifiable, Equatable, Hashable {
    let id, name, photoCredit: String
    let price: Int
    let restrictions: [String]
    let description: String

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
}
