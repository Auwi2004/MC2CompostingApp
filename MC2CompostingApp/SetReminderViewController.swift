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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
