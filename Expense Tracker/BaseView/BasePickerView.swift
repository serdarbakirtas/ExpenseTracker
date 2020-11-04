//
//  BasePickerView.swift
//  Expense Tracker
//
//  Created by Hasan on 04.11.20.
//

import UIKit

protocol BasePickerViewDelegate {
    func didSelectRowInPickerView(_ pickerView: UIPickerView, didSelectRow row: Int)
}

class BasePickerView: UIPickerView {

    var pickerViewDelegate: BasePickerViewDelegate?
    
    var items: [String] = [""]
    
    func configurePickerView(items: [String]) {
        delegate = self
        dataSource = self
        
        self.items = items
    }
}

extension BasePickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
}

extension BasePickerView: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewDelegate?.didSelectRowInPickerView(pickerView, didSelectRow: row)
    }
}
