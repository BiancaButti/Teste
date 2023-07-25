//
//  DataAPIModel.swift
//  TesteTecnico
//
//  Created by Bianca on 24/07/23.
//

import Foundation

struct DataAPIModel: Codable {
    let data: DataModel
}

struct DataModel: Codable {
    let receipts: [ReceiptAPIModel]
    let paginationModel: PaginationAPIModel
    
    enum CodingKeys: String, CodingKey {
        case receipts
        case paginationModel = "pagination"
    }
}

struct ReceiptAPIModel: Codable {
    let title: String
    let receiptId: String
    let name: String
    let receiverName: String
    let amount: String
    let control: String
    let date: String
}

struct PaginationAPIModel: Codable {
    let page: Int
    let pageSize: Int
    let totalElements: Int
    let totalPages: Int
}
