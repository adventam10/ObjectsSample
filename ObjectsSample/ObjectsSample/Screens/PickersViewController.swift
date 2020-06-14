//
//  PickersViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/13.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class PickersViewController: UIViewController {

    @IBOutlet private weak var pickerView: UIPickerView! {
        didSet {
            pickerView.delegate = self
            pickerView.dataSource = self
        }
    }
    @IBOutlet private weak var datePicker: UIDatePicker! {
        didSet {
            // コードで設定する場合
//            datePicker.date = Date()
//            datePicker.datePickerMode = .dateAndTime
//            datePicker.minuteInterval = 1
//            datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        }
    }

    private let pickerTitles: [[String]] = [["AAA", "BBB", "CCC"], ["EEE", "FFF", "GGG"]]
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = .init(identifier: "ja_JP")
        df.dateFormat = "yyyy/MM/dd (E) HH:mm"
        return df
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK:- IBAction
    @IBAction private func datePickerValueChanged(_ sender: Any) {
        print("DatePicker Change!! date: \(dateFormatter.string(from: datePicker.date))")
    }
}

extension PickersViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerTitles[component][row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("pickerViewDidSelectRow row: \(row), component: \(component)")
    }
}

extension PickersViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerTitles.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerTitles[component].count
    }
}
