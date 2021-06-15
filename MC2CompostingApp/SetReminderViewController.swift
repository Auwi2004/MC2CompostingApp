//
//  SetReminderViewController.swift
//  MC2CompostingApp
//
//  Created by Catharina Benita Irawan on 15/06/21.
//

import UIKit

class SetReminderViewController: UIViewController {

    @IBOutlet weak var labelpengingat: UILabel!
    @IBOutlet weak var labelsetiap: UILabel!
    @IBOutlet weak var labeljam: UILabel!
    @IBOutlet weak var pickersetiap: UIPickerView!
    @IBOutlet weak var pickerjam: UIDatePicker!
    @IBOutlet weak var buttonsave: UIButton!
    
    var setiap = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickersetiap.dataSource = self
        pickersetiap.delegate = self
        
        let setiap = ["3 Hari","7 Hari"]

        
        
        
    }

}
//setting picker view untuk pilihan hari
extension UIViewController : UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return setiap.count
        
    }
}

extension UIViewController : UIPickerViewDelegate{
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return setiap[row]
    }

}

