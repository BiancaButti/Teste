//
//  TranferCardView.swift
//  TesteTecnico
//
//  Created by Bianca on 23/07/23.
//

import UIKit

final class TranferCardView: UIControl {

    private let dateLabel: UILabel
    private let iconImage: UIImageView
    private let titleReceiptTypeLabel: UILabel
    private let receiverNameLabel: UILabel
    private let amountToReceiveLabel: UILabel
    private let iconButton: UIImageView
    
    var onAction: (() -> Void)?
    
    init() {
        dateLabel = UILabel()
        iconImage = UIImageView()
        titleReceiptTypeLabel = UILabel()
        receiverNameLabel = UILabel()
        amountToReceiveLabel = UILabel()
        iconButton = UIImageView()
        super.init(frame: .zero)
        
        setupConstraint()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        addSubview(dateLabel)
        addSubview(iconImage)
        addSubview(titleReceiptTypeLabel)
        addSubview(receiverNameLabel)
        addSubview(amountToReceiveLabel)
        addSubview(iconButton)
        
        self.subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            iconImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            iconImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            iconImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            iconImage.heightAnchor.constraint(equalToConstant: 32),
            iconImage.widthAnchor.constraint(equalToConstant: 32),
        
            titleReceiptTypeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            titleReceiptTypeLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 8),
            
            receiverNameLabel.topAnchor.constraint(equalTo: titleReceiptTypeLabel.bottomAnchor, constant: 8),
            receiverNameLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 8),
            
            amountToReceiveLabel.topAnchor.constraint(equalTo: receiverNameLabel.bottomAnchor, constant: 8),
            amountToReceiveLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 8),
            
            iconButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            iconButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            iconButton.heightAnchor.constraint(equalToConstant: 24),
            iconButton.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupView() {
        dateLabel.numberOfLines = 0
        dateLabel.font = .systemFont(ofSize: 16.0, weight: .bold)
        
        titleReceiptTypeLabel.numberOfLines = 0
        titleReceiptTypeLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        
        receiverNameLabel.numberOfLines = 0
        receiverNameLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        
        amountToReceiveLabel.numberOfLines = 0
        amountToReceiveLabel.font = .systemFont(ofSize: 12.0, weight: .regular)
        amountToReceiveLabel.textColor = .red
        amountToReceiveLabel.textAlignment = .right
        
        iconButton.image = UIImage(named: "Arrow")
        
        addTarget(self, action: #selector(didTapTransferModel), for: .touchUpInside)
        isEnabled = true
    }
    
    private func setupIcon(with title: String) -> String {
        if title == "Pagamento de boleto" {
            return "Payment"
        } else {
            return "Transfer"
        }
    }
    
    func setupData(model: ReceiptAPIModel) {
        dateLabel.text = model.date
        iconImage.image = UIImage(named: setupIcon(with: model.title))
        titleReceiptTypeLabel.text = model.title
        receiverNameLabel.text = model.receiverName
        amountToReceiveLabel.text = model.amount
    }
    
    @objc
    private func didTapTransferModel() {
        onAction?()
    }
    
}
