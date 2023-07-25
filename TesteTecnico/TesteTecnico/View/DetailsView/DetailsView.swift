//
//  DetailsView.swift
//  TesteTecnico
//
//  Created by Bianca on 24/07/23.
//

import UIKit

final class DetailsView: UIView {

    private let headerView: UIView
    private let navigationButton: UIButton
    private let navigationTitleLabel: UILabel
    private let dateTitleLabel: UILabel
    private let descriptionLabel: UILabel
    private let amountDescription: UILabel
    private let lineView: UIView
    private let originLabel: UILabel
    private let nameOriginLabel: UILabel
    private let destinationLabel: UILabel
    private let nameDestinationLabel: UILabel
    private let transactionIDLabel: UILabel
    private let controlLabel: UILabel
    
    var onNavigationAction: (() -> Void)?
    
    init() {
        headerView = UIView()
        navigationButton = UIButton()
        navigationTitleLabel = UILabel()
        dateTitleLabel = UILabel()
        descriptionLabel = UILabel()
        amountDescription = UILabel()
        lineView = UIView()
        originLabel = UILabel()
        nameOriginLabel = UILabel()
        destinationLabel = UILabel()
        nameDestinationLabel = UILabel()
        transactionIDLabel = UILabel()
        controlLabel = UILabel()
        super.init(frame: .zero)
        
        setupConstraint()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubview(headerView)
        addSubview(navigationButton)
        addSubview(navigationTitleLabel)
        addSubview(dateTitleLabel)
        addSubview(descriptionLabel)
        addSubview(amountDescription)
        addSubview(lineView)
        addSubview(originLabel)
        addSubview(nameOriginLabel)
        addSubview(destinationLabel)
        addSubview(nameDestinationLabel)
        addSubview(transactionIDLabel)
        addSubview(controlLabel)
        
        self.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: leftAnchor),
            headerView.rightAnchor.constraint(equalTo: rightAnchor),
            
            navigationButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
            navigationButton.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 24),
            navigationButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16),
            
            navigationTitleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
            navigationTitleLabel.leftAnchor.constraint(equalTo: navigationButton.rightAnchor, constant: 16),
            navigationTitleLabel.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -16),
            navigationTitleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16),
            
            dateTitleLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            dateTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            dateTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            
            descriptionLabel.topAnchor.constraint(equalTo: dateTitleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            
            amountDescription.topAnchor.constraint(equalTo: dateTitleLabel.bottomAnchor, constant: 20),
            amountDescription.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 8),
            
            lineView.topAnchor.constraint(equalTo: amountDescription.bottomAnchor, constant: 16),
            lineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            lineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            originLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            originLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            
            nameOriginLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 8),
            nameOriginLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            
            destinationLabel.topAnchor.constraint(equalTo: nameOriginLabel.bottomAnchor, constant: 16),
            destinationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            
            nameDestinationLabel.topAnchor.constraint(equalTo: destinationLabel.bottomAnchor, constant: 8),
            nameDestinationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            
            transactionIDLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            transactionIDLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            transactionIDLabel.bottomAnchor.constraint(equalTo: controlLabel.topAnchor),
            
            controlLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            controlLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            controlLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupView() {
        backgroundColor = .white
        
        headerView.backgroundColor = .orange
        
        navigationButton.imageView?.backgroundColor = .white
        navigationButton.imageView?.image = .add
        
        navigationButton.addTarget(self, action: #selector(didTapNavigationAction), for: .touchUpInside)
        
        lineView.backgroundColor = .systemGray5
        
        setupLabels()
    }
    
    private func setupLabels() {
        navigationTitleLabel.numberOfLines = 0
        navigationTitleLabel.textColor = .white
        navigationTitleLabel.font = .systemFont(ofSize: 20.0, weight: .bold)
        navigationTitleLabel.backgroundColor = .orange
        navigationTitleLabel.textAlignment = .left
        
        dateTitleLabel.numberOfLines = 0
        dateTitleLabel.textColor = .black
        dateTitleLabel.font = .systemFont(ofSize: 20.0, weight: .bold)
        dateTitleLabel.textAlignment = .center
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
        descriptionLabel.font = .systemFont(ofSize: 20.0, weight: .bold)
        descriptionLabel.textAlignment = .center
        
        amountDescription.numberOfLines = 0
        amountDescription.textColor = .black
        amountDescription.font = .systemFont(ofSize: 16.0, weight: .regular)
        amountDescription.textAlignment = .left
        
        originLabel.numberOfLines = 0
        originLabel.textColor = .black
        originLabel.font = .systemFont(ofSize: 20.0, weight: .bold)
        originLabel.textAlignment = .center
        
        nameOriginLabel.numberOfLines = 0
        nameOriginLabel.textColor = .black
        nameOriginLabel.font = .systemFont(ofSize: 16.0, weight: .regular)
        nameOriginLabel.textAlignment = .left
        
        destinationLabel.numberOfLines = 0
        destinationLabel.textColor = .black
        destinationLabel.font = .systemFont(ofSize: 20.0, weight: .bold)
        destinationLabel.textAlignment = .center

        nameDestinationLabel.numberOfLines = 0
        nameDestinationLabel.textColor = .black
        nameDestinationLabel.font = .systemFont(ofSize: 16.0, weight: .regular)
        nameDestinationLabel.textAlignment = .left
        
        transactionIDLabel.numberOfLines = 0
        transactionIDLabel.textColor = .black
        transactionIDLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        transactionIDLabel.textAlignment = .left
        
        controlLabel.numberOfLines = 0
        controlLabel.textColor = .black
        controlLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        controlLabel.textAlignment = .left
    }
    
    func setupDataModel(model: [ReceiptAPIModel]) {
        model.forEach { value in
            navigationTitleLabel.text = value.title
            dateTitleLabel.text = value.date
            descriptionLabel.text = "Valor"
            amountDescription.text = value.amount
            originLabel.text = "Origem"
            nameOriginLabel.text = value.name
            destinationLabel.text = "Destinatário"
            nameDestinationLabel.text = value.receiverName
            transactionIDLabel.text = "ID de transação: \(value.receiptId)"
            controlLabel.text = "Control: \(value.control)"
        }
    }
    
    @objc
    private func didTapNavigationAction() {
        onNavigationAction?()
    }
}
