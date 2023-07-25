//
//  DetailsViewController.swift
//  TesteTecnico
//
//  Created by Bianca on 24/07/23.
//

import UIKit

class DetailsViewController: UIViewController {

    private var transferViewModel: TransferViewModel = TransferViewModel()
    private var mainView: DetailsView {
        return view as? DetailsView ?? DetailsView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = DetailsView()
        let theView = mainView
        
        theView.onNavigationAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
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
