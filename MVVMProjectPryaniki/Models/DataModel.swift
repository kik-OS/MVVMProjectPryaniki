//
//  DataModel.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 05.02.2021.
//

import Foundation

// MARK: - DataModel
struct DataModel: Codable {
    let data: [Datum]?
    let view: [String]?
}

// MARK: - Datum
struct Datum: Codable {
    let name: String?
    var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let text: String?
    let url: String?
    var selectedId: Int?
    let variants: [Variant]?
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int?
    let text: String?
}
