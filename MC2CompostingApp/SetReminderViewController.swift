//
//  SetReminderViewController.swift
//  MC2CompostingApp
//
//  Created by Catharina Benita Irawan on 15/06/21.
//

import UIKit

class SetReminderViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return setiap[row]
    }
    
    
    @IBOutlet weak var textFieldJam: UITextField!
    @IBOutlet weak var labelpengingat: UILabel!
    @IBOutlet weak var labelsetiap: UILabel!
    @IBOutlet weak var labeljam: UILabel!
    @IBOutlet weak var pickersetiap: UIPickerView!
    @IBOutlet weak var buttonsave: UIButton!
    
    
    let setiap = ["3 Hari","7 Hari"]
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickersetiap.dataSource = self
        pickersetiap.delegate = self
        
        let time = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm"
        textFieldJam.text = formatter.string(from: time)
        textFieldJam.textColor = .link
        
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        timePicker.frame.size = CGSize (width: 0, height: 250)
        
        textFieldJam.inputView = timePicker
    }
    @objc func timePickerValueChanged(sender :UIDatePicker)
    {
        // when time is changed it will appear here
        let formatter = DateFormatter ()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm"
        textFieldJam.text = formatter.string(from: sender.date)
    }
    
}


