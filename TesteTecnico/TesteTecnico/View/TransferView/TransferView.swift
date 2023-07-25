//
//  TransferView.swift
//  TesteTecnico
//
//  Created by Bianca on 22/07/23.
//

import UIKit

final class TransferView: UIView {

    private let headerView: UIView
    private let headerTitleViewLabel: UILabel
    private let scrollView: UIScrollView
    private let stackView: UIStackView
    private let lineView: UIView
    private let cardView = TranferCardView()
    
    var onAction: (() -> Void)?
    
    override init(frame: CGRect) {
        headerView = UIView()
        headerTitleViewLabel = UILabel()
        scrollView = UIScrollView()
        stackView = UIStackView()
        lineView = UIView()
        super.init(frame: frame)
        
        setupConstraint()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubview(headerView)
        addSubview(headerTitleViewLabel)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        self.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        scrollView.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: leftAnchor),
            headerView.rightAnchor.constraint(equalTo: rightAnchor),
            
            headerTitleViewLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
            headerTitleViewLabel.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 24),
            headerTitleViewLabel.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -24),
            headerTitleViewLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupView() {
        backgroundColor = .white
        
        headerView.backgroundColor = .orange
        
        headerTitleViewLabel.numberOfLines = 0
        headerTitleViewLabel.text = "Comprovantes"
        headerTitleViewLabel.textColor = .white
        headerTitleViewLabel.font = .systemFont(ofSize: 20.0, weight: .bold)
        headerTitleViewLabel.backgroundColor = .orange
        headerTitleViewLabel.textAlignment = .center
        
        scrollView.showsHorizontalScrollIndicator = true
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        lineView.backgroundColor = .orange
    }
    
    
    func setupDataModel(model: [ReceiptAPIModel]) {
        model.forEach({ value in
            cardView.setupData(model: value)
            stackView.addArrangedSubview(cardView)
            stackView.addArrangedSubview(lineView)
        })
        cardView.onAction = { [weak self] in
            self?.onAction?()
        }
    }
    
}
