//
//  WidgetsViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/13.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class WidgetsViewController: UITableViewController {

    @IBOutlet private weak var label: UILabel! {
        didSet {
            // コードで設定する場合
//            label.text = "Labelです"
//            label.textColor = .systemGray2
//            label.textAlignment = .natural
//            label.font = .systemFont(ofSize: 17)
            button.addTarget(self, action: <#T##Selector#>, for: .touchUpOutside)
        }
    }
    @IBOutlet private weak var button: UIButton! {
        didSet {
            // コードで設定する場合
//            button.setTitle("Button", for: .normal)
//            button.setImage(UIImage(systemName: "link.circle"), for: .normal)
//            button.setTitleColor(.link, for: .normal)
//            button.addTarget(self, action: #selector(buttonTouchUpInside(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet private weak var segmentedControl: UISegmentedControl! {
        didSet {
             // コードで設定する場合
//            segmentedControl.setTitle("First", forSegmentAt: 0)
//            segmentedControl.setTitle("Second", forSegmentAt: 1)
//            segmentedControl.selectedSegmentIndex = 0
//            segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        }
    }
    @IBOutlet private weak var textField: UITextField! {
        didSet {
            textField.delegate = self
//            // コードで設定する場合
//            textField.text = ""
//            textField.clearButtonMode = .always
//            textField.placeholder = "ココに入力"
//            textField.borderStyle = .roundedRect
//            textField.minimumFontSize = 17
//            textField.font = .systemFont(ofSize: 14)
//            textField.textAlignment = .natural
//            textField.textColor = .label
        }
    }
    @IBOutlet private weak var slider: UISlider! {
        didSet {
            // コードで設定する場合
//            slider.maximumValue = 100
//            slider.minimumValue = 0
//            slider.value = 10
//            slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        }
    }
    @IBOutlet private weak var uiSwitch: UISwitch! {
        didSet {
            // コードで設定する場合
//            uiSwitch.isOn = true
//            uiSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        }
    }
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            // コードで設定する場合
//            activityIndicatorView.startAnimating()
//            activityIndicatorView.hidesWhenStopped = true
//            activityIndicatorView.style = .medium
        }
    }
    @IBOutlet private weak var progressView: UIProgressView! {
        didSet {
            progressView.progress = 0.8
        }
    }
    @IBOutlet private weak var stepper: UIStepper! {
        didSet {
            // コードで設定する場合
//            stepper.stepValue = 1
//            stepper.minimumValue = 0
//            stepper.maximumValue = 100
//            stepper.value = 0
//            stepper.wraps = false // 最大値 <=> 最小値に戻すかどうか
//            stepper.autorepeat = true // 長押し
//            stepper.isContinuous = true // 長押し時にイベント送信されるかどうか
//            stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        }
    }
    @IBOutlet private weak var horizontalStackView: UIStackView! {
        didSet {
            // コードで設定する場合
//            horizontalStackView.axis = .horizontal
//            horizontalStackView.spacing = 0
//            horizontalStackView.alignment = .fill
//            horizontalStackView.distribution = .fillEqually
        }
    }
    @IBOutlet private weak var verticalStackView: UIStackView! {
        didSet {
            // コードで設定する場合
//            verticalStackView.axis = .vertical
//            verticalStackView.spacing = 0
//            verticalStackView.alignment = .fill
//            verticalStackView.distribution = .fillEqually
        }
    }
    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            // コードで設定する場合
//            imageView.image = UIImage(systemName: "folder.fill")
//            imageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet private weak var textView: UITextView! {
        didSet {
            textView.delegate = self
            // コードで設定する場合
//            textView.text = "ココに入力"
//            textView.font = .systemFont(ofSize: 14)
//            textView.textAlignment = .natural
//            textView.textColor = .label
        }
    }
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
            // コードで設定する場合
//            searchBar.placeholder = "検索"
//            searchBar.text = ""
//            searchBar.barStyle = .default
//            searchBar.searchBarStyle = .default
//            searchBar.showsCancelButton = true
//            searchBar.showsBookmarkButton = true
//            searchBar.showsSearchResultsButton = true
        }
    }
    @IBOutlet private weak var customView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK:- IBAction
    @IBAction private func buttonTouchUpInside(_ sender: Any) {
        print("Button Tap!!")
    }

    @IBAction private func segmentedControlValueChanged(_ sender: Any) {
        print("SegmentedControl Change!! selectedSegmentIndex: \(segmentedControl.selectedSegmentIndex)")
    }

    @IBAction private func sliderValueChanged(_ sender: Any) {
        print("Slider Change!! value: \(slider.value)")
    }

    @IBAction private func switchValueChanged(_ sender: Any) {
        print("Switch Change!! isOn: \(uiSwitch.isOn)")
    }

    @IBAction private func stepperValueChanged(_ sender: Any) {
        print("Stepper Change!! value: \(stepper.value)")
    }
}

extension WidgetsViewController: UITextFieldDelegate {

    /// 編集を開始するか設定するfalseなら開始しない
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }

    /// 編集開始後に呼ばれる
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }

    /// 編集を停止するか設定するfalseなら停止しない
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        return true
    }

    /// 編集終了時に呼ばれる
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }

    /// 編集終了時に呼ばれる
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing reason: \(reason)")
    }

    /// 指定のテキストを変更するかどうか設定する
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        print("textFieldShouldChangeCharactersIn range: \(range), replacementString: \(string)")
        return true
    }

    /// 選択を変更したときに呼ばれる
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textFieldDidChangeSelection")
    }

    /// 現在のテキストを削除するか設定する
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear")
        return true
    }

    /// Returnボタンの押下を処理するか設定する
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
}

extension WidgetsViewController: UITextViewDelegate {

    /// 編集を開始するか設定するfalseなら開始しない
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldBeginEditing")
        return true
    }

    /// 編集を停止するか設定するfalseなら停止しない
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldEndEditing")
        return true
    }

    /// 編集開始後に呼ばれる
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("textViewDidBeginEditing")
    }

    /// 編集終了時に呼ばれる
    func textViewDidEndEditing(_ textView: UITextView) {
        print("textViewDidEndEditing")
    }

    /// 指定のテキストを変更するかどうか設定する
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        print("textViewShouldChangeTextIn range: \(range), replacementText: \(text)")
        return true
    }

    /// テキストを変更時に呼ばれる
    func textViewDidChange(_ textView: UITextView) {
        print("textViewDidChange")
    }

    /// 選択を変更したときに呼ばれる
    func textViewDidChangeSelection(_ textView: UITextView) {
        print("textViewDidChangeSelection")
    }
}

extension WidgetsViewController: UISearchBarDelegate {

    /// 編集を開始するか設定するfalseなら開始しない
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("searchBarShouldBeginEditing")
        return true
    }

    /// 編集開始後に呼ばれる
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidBeginEditing")
    }

    /// 編集を停止するか設定するfalseなら停止しない
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print("searchBarShouldEndEditing")
        return true
    }

    /// 編集終了時に呼ばれる
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidEndEditing")
    }

    /// テキストを変更時に呼ばれる
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchBarTextDidChange searchText: \(searchText)")
    }

    /// 指定のテキストを変更するかどうか設定する
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange,
                   replacementText text: String) -> Bool {
        print("searchBarShouldChangeTextIn range: \(range), replacementText: \(text)")
        return true
    }

    /// 検索押下時に呼ばれる
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        print("searchBarSearchButtonClicked")
    }

    /// ブックマーク押下時に呼ばれる
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        print("searchBarBookmarkButtonClicked")
    }

    /// キャンセル押下時に呼ばれる
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        print("searchBarCancelButtonClicked")
    }

    /// ResultsList押下時に呼ばれる
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        print("searchBarResultsListButtonClicked")
    }

    /// スコープボタンが押されてインデックスが変わった時に呼ばれる
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("searchBarSelectedScopeButtonIndexDidChange selectedScope: \(selectedScope)")
    }
}
