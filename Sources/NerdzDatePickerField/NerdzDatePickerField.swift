
import UIKit

public class NerdzDatePickereField: UITextField, UITextFieldDelegate {
    
    public var onDateSelected: ((Date) -> Void)?
    
    public var formatter: DateFormatter?
    
    public var date: Date? {
        didSet {
            datePicker.date = date ?? datePicker.date
            updateTextIfNeeded()
        }
    }
    
    public override var placeholder: String? {
        set {
            if #available(iOS 14, *) {
                super.placeholder = nil
            }
        }
        
        get {
            super.placeholder
        }
    }
    
    public override var text: String? {
        set {
            if #available(iOS 14, *) {
                super.text = nil
            }
        }
        
        get {
            super.text
        }
    }
    
    public override var attributedText: NSAttributedString? {
        set {
            if #available(iOS 14, *) {
                super.attributedText = nil
            }
        }
        
        get {
            super.attributedText
        }
    }
    
    public override var attributedPlaceholder: NSAttributedString? {
        set {
            if #available(iOS 14, *) {
                super.attributedPlaceholder = nil
            }
        }
        
        get {
            super.attributedPlaceholder
        }
    }
    
    public private(set) lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()        
        datePicker.addTarget(self, action: #selector(dateValueChanged), for: .valueChanged)
        
        return datePicker
    }()
    
    @objc private func dateValueChanged() {
        updateTextIfNeeded()
        onDateSelected?(datePicker.date)
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        guard superview != nil else {
            return
        }
        
        delegate = self
        setupDatePicker()
    }
    
    private func setupDatePicker() {
        if #available(iOS 14, *) {
            superview?.addSubview(datePicker)
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            datePicker.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        }
        else {
            datePicker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            datePicker.heightAnchor.constraint(equalToConstant: 216).isActive = true
            
            inputView = datePicker
        }
    }
    
    private func updateTextIfNeeded() {
        text = formatter?.string(from: datePicker.date)
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if #available(iOS 14, *) {
            return false
        }
        else {
            return true
        }
    }
}
