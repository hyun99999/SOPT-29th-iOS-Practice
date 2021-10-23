//
//  PickerPracticeViewController.swift
//  29th-iOS-SeminarPractice-week3
//
//  Created by kimhyungyu on 2021/10/23.
//

import UIKit

class PickerPracticeViewController: UIViewController {
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var partList = [PartData]()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPartData()
        pickerView.dataSource = self
        pickerView.delegate = self
    }
}

// MARK: - Extensions

extension PickerPracticeViewController {
    private func initPartData() {
        partList.append(contentsOf: [
            PartData(imageName: "wesoptiOSPart", partName: "iOS"),
            PartData(imageName: "wesoptAndroidPart", partName: "Android"),
            PartData(imageName: "wesoptWebPart", partName: "Web"),
            PartData(imageName: "wesoptServerPart", partName: "Server"),
            PartData(imageName: "wesoptDesignPart", partName: "Design"),
            PartData(imageName: "wesoptPlanPart", partName: "Plan")
        ])
    }
}

// MARK: UIPickerViewDelegate

extension PickerPracticeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return partList[row].partName
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = partList[row].makeImage()
    }
}

// MARK: UIPickerViewDataSource

extension PickerPracticeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partList.count
    }
}
