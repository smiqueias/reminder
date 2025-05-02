//
//  NewReceiptView.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

import Foundation
import UIKit

final class NewReceiptView: UIView {
    
    private var typedMedicine: String = "" {
         didSet {
             validateInput()
        }
    }
    private var typedHour: String = "" {
        didSet {
            validateInput()
       }
   }
    private var typedRecurrence: String = "" {
        didSet {
            validateInput()
       }
   }
    
    // MARK: - Components
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Nova receita"
        label.textColor = Colors.primaryRedBase
        label.font = Typography.heading
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Adicione a sua prescrição médica para receber lembretes de quando tomar seu medicamento"
        label.textColor = Colors.gray200
        label.font = Typography.body
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var medicineInput: ReminderInput = {
        let input = ReminderInput(
            label: "Remédio",
            placeholder: "Nome do medicamento"
        ) {
            text in
            self.typedMedicine = text
        }
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    private lazy var hourInput: ReminderInput = {
        let input = ReminderInput(
            label: "Horário",
            placeholder: "00:00"
        ) {
            text in
            self.typedHour = text
        }
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    private lazy var recurrenceInput: ReminderInput = {
        let input = ReminderInput(
            label: "Recorrência",
            placeholder: "Selecione"
        ) {
            text in
            self.typedRecurrence = text
        }
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar", for: .normal)
        button.setTitleColor(Colors.gray800, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.titleLabel?.font = Typography.subHeading
        button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Colors.gray800
        
        return button
    }()
    
    private lazy var takeNowCheckbox: ReminderCheckbox = {
        let checkbox = ReminderCheckbox(
            label: "Tomar agora"
        )
        
        return checkbox
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                backButton,
                titleLabel,
                descriptionLabel,
                SizedBox(height: 16),
                medicineInput,
                hourInput,
                recurrenceInput,
                takeNowCheckbox
            ]
        )
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func validateInput() {
        let allFieldsFilled = !typedMedicine.isEmpty && !typedHour.isEmpty && !typedRecurrence.isEmpty
        addButton.isEnabled = allFieldsFilled
        addButton.backgroundColor = addButton.isEnabled ? Colors.primaryRedBase : Colors.gray400
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        applyViewCode()
        validateInput()
    }
}

// MARK: - ViewCode

extension NewReceiptView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(mainStackView)
        addSubview(addButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
            medicineInput.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
            hourInput.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
            recurrenceInput.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
            
            addButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

        ])
    }
}

#Preview {
    NewReceiptView()
}
