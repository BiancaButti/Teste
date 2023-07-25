//
//  TransferViewController.swift
//  TesteTecnico
//
//  Created by Bianca on 23/07/23.
//

import UIKit

final class TransferViewController: UIViewController {
    
    private var transferViewModel: TransferViewModel = TransferViewModel()
    private var mainView: TransferView {
        return view as? TransferView ?? TransferView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = TransferView(frame: UIScreen.main.bounds)
        let theView = mainView
        
        theView.onAction = { [weak self] in
            let controller = DetailsViewController()
            self?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func callView() {
        let loadItems = transferViewModel.loadItems()
        mainView.setupDataModel(model: loadItems?.data.receipts ?? [])
    }

    override func viewDidLoad() {
        callView()
        super.viewDidLoad()
    }
}
