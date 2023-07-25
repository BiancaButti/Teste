//
//  TransferViewModel.swift
//  TesteTecnico
//
//  Created by Bianca on 24/07/23.
//

import Foundation

final class TransferViewModel {
    
    private var service: TransferService
    var receiptModel: [ReceiptAPIModel] = []
    
    init(service: TransferService = .init()) {
        self.service = service
    }

    func loadItems() -> DataAPIModel? {
        let jsonData = service.readJSONFile()
        return jsonData
    }
    
}
