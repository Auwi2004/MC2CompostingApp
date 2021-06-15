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
    
    

    @IBOutlet weak var labelpengingat: UILabel!
    @IBOutlet weak var labelsetiap: UILabel!
    @IBOutlet weak var labeljam: UILabel!
    @IBOutlet weak var pickersetiap: UIPickerView!
    @IBOutlet weak var pickerjam: UIDatePicker!
    @IBOutlet weak var buttonsave: UIButton!
    
    
    let setiap = ["3 Hari","7 Hari"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickersetiap.dataSource = self
        pickersetiap.delegate = self
        
        
        
        
        
    }

}


