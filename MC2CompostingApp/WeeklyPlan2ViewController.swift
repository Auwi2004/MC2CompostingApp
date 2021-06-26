//
//  WeeklyPlan2ViewController.swift
//  MC2CompostingApp
//
//  Created by Dian Tresnawan on 24/06/21.
//

import UIKit

class WeeklyPlan2ViewController: UIViewController {

    @IBOutlet weak var satuButton: UIButton!
    @IBOutlet weak var duaButton: UIButton!
    @IBOutlet weak var tigButton: UIButton!
    
    var check: Bool = false
    var check1: Bool = false
    var check2: Bool = false
    var check3: Bool = false
    var selectedWeek: Int = 0
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Kegiatan"
        
        print("Minggu yang diterima", selectedWeek)
        check = userDefaults.value(forKey: "CHECK") as! Bool
        if check == true {
            check1 = userDefaults.value(forKey: "CHECK1") as! Bool
            check2 = userDefaults.value(forKey: "CHECK2") as! Bool
            check3 = userDefaults.value(forKey: "CHECK3") as! Bool
        }
        print("check1", check1)
        print("check2", check2)
        print("check3", check3)

        if check1 == true {
            satuButton.isSelected = true
        }
        if check2 == true {
            duaButton.isSelected = true
        }
        if check3 == true {
            tigButton.isSelected = true
        }
    }
    
    @IBAction func satuButtonAction(_ sender: UIButton) {
        if check1 == false {
            if sender.isSelected {
                sender.isSelected = false
            } else {
                sender.isSelected = true
            }
            check1 = true
//            selectedCheck = 1
        }
    }
    
    @IBAction func duaButtonAction(_ sender: UIButton) {
        if check2 == false {
            if check1 == true {
                if sender.isSelected {
                    sender.isSelected = false
                } else {
                    sender.isSelected = true
                }
            }
            check2 = true
//            selectedCheck = 2
        }
    }
    
    @IBAction func tigaButtonAction(_ sender: UIButton) {
        print(check3)
        if check3 == false {
            if check1 == true && check2 == true {
                if sender.isSelected {
                    sender.isSelected = false
                } else {
                    sender.isSelected = true
                }
                check3 = true
//                selectedCheck = 3
            }
        }
    }
  
    @IBAction func simpanBtnAct(_ sender: Any) {
        userDefaults.setValue(true, forKey: "CHECK") // pernah di check
        userDefaults.setValue(check1, forKey: "CHECK1") // simpan data sub week
        userDefaults.setValue(check2, forKey: "CHECK2") // simpan data sub week
        userDefaults.setValue(check3, forKey: "CHECK3") // simpan data sub week
        userDefaults.setValue(selectedWeek, forKey: "WEEK") // simpan data week
        
        // untuk cek nilai saja
        print("check1", check1)
        print("check2", check2)
        print("check3", check3)
        print("SelectedWeek", selectedWeek)
    }

    
}

