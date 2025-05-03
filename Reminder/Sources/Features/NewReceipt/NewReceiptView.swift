//
//  NewReceiptView.swift
//  Reminder
//
//  Created by Saulo Nascimento on 01/05/25.
//

import Foundation
import UIKit

final class NewReceiptView: UIView {
    
    let recurrenceOptions = [
        "De hora em hora",
        "2 em 2 horas",
        "4 em 4 horas",
        "6 em 6 horas",
        "8 em 8 horas",
        "12 em 12 horas",
        "Um por dia"
    ]
    
    var typedMedicine: String = "" {
         didSet {
             validateInput()
        }
    }
    
    var selectedHour: String = "" {
        didSet {
            validateInput()
       }
   }
    
    var selectedRecurrence: String = "" {
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
        )
        input.translatesAutoresizingMaskIntoConstraints = false
        input.tintColor = .clear
        input.textField.delegate = self
        return input
    }()
    
    private lazy var recurrenceInput: ReminderInput = {
        let input = ReminderInput(
            label: "Recorrência",
            placeholder: "Selecione"
        )
        input.textField.delegate = self
        input.tintColor = .clear
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    // MARK: - Pickers
    private lazy var timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle = .wheels
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = Colors.gray700
        
        return picker
    }()
    
    private lazy var recurrencePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = Colors.gray700
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()
    
    lazy var addButton: UIButton = {
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
        let allFieldsFilled = !typedMedicine.isEmpty && !selectedHour.isEmpty && !selectedRecurrence.isEmpty
        addButton.isEnabled = allFieldsFilled
        addButton.backgroundColor = addButton.isEnabled ? Colors.primaryRedBase : Colors.gray400
    }
    
    private func setupTimeInput() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barTintColor = Colors.gray700
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didSelectTime)
        )
        doneButton.tintColor = Colors.primaryRedBase
        
        toolbar.setItems([doneButton], animated: false)
        
        hourInput.textField.inputView = timePicker
        hourInput.textField.inputAccessoryView = toolbar
        
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupRecurrenceInput() {
        let toolbar = UIToolbar()
        toolbar.barTintColor = Colors.gray700
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didSelectRecurrence)
        )
        doneButton.tintColor = Colors.primaryRedBase
        
        
        toolbar.setItems([doneButton], animated: true)
        
        recurrenceInput.textField.inputView = recurrencePicker
        recurrenceInput.textField.inputAccessoryView = toolbar
        
        recurrencePicker.delegate = self
        recurrencePicker.dataSource = self
        
        toolbar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didSelectTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        hourInput.textField.text = formatter.string(from: timePicker.date)
        selectedHour = formatter.string(from: timePicker.date)
        hourInput.textField.resignFirstResponder()
    }
    
    @objc
    private func didSelectRecurrence() {
        let selectedRow = recurrencePicker.selectedRow(inComponent: 0)
        recurrenceInput.textField.text = recurrenceOptions[selectedRow]
        selectedRecurrence = recurrenceOptions[selectedRow]
        recurrenceInput.textField.resignFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        applyViewCode()
        validateInput()
        setupTimeInput()
        setupRecurrenceInput()
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

// MARK: - UITextFieldDelegate
extension NewReceiptView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

// MARK: - UIPickerDelegate
extension NewReceiptView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return recurrenceOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return recurrenceOptions[row]
    }
}

#Preview {
    NewReceiptView()
}
