//
//  TransferService.swift
//  TesteTecnico
//
//  Created by Bianca on 24/07/23.
//

import Foundation

final class TransferService {
    
    func readJSONFile() -> DataAPIModel? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "jsonExemplo", ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            let dataModel = try JSONDecoder().decode(DataAPIModel.self, from: jsonData)
                return dataModel
            }
         } catch {
            print("Error: \(error)")
         }
        return nil
    }
}
