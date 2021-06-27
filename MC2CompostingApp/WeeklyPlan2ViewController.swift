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
        
        check = userDefaults.value(forKey: "CHECK") as! Bool
        if check == true {
            check1 = userDefaults.value(forKey: "CHECK1") as! Bool
            check2 = userDefaults.value(forKey: "CHECK2") as! Bool
            check3 = userDefaults.value(forKey: "CHECK3") as! Bool
        }

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
        }
    }
    
    @IBAction func tigaButtonAction(_ sender: UIButton) {
//        print(check3)
        if check3 == false {
            if check1 == true && check2 == true {
                if sender.isSelected {
                    sender.isSelected = false
                } else {
                    sender.isSelected = true
                }
                check3 = true
            }
        }
    }
  
    @IBAction func simpanBtnAct(_ sender: Any) {
        userDefaults.setValue(true, forKey: "CHECK") // pernah di check
        userDefaults.setValue(check1, forKey: "CHECK1") // simpan data sub week
        userDefaults.setValue(check2, forKey: "CHECK2") // simpan data sub week
        userDefaults.setValue(check3, forKey: "CHECK3") // simpan data sub week
        userDefaults.setValue(selectedWeek, forKey: "WEEK") // simpan data week
        
        if check1 == true && check2 == true && check3 == true {
            userDefaults.setValue(false, forKey: "CHECK1") // simpan data sub week
            userDefaults.setValue(false, forKey: "CHECK2") // simpan data sub week
            userDefaults.setValue(false, forKey: "CHECK3") // simpan data sub week
            userDefaults.setValue(true, forKey: "GREEN") // simpan data sub week
            userDefaults.setValue(selectedWeek, forKey: "WEEK") // berarti yang bisa dipilih warna terang dan yang sebelumnya yang tidak bisa dipilih warna hijau.
            
            if selectedWeek == 0 {
                userDefaults.setValue(false, forKey: "ENWEEK1")
                userDefaults.setValue(true, forKey: "ENWEEK2")
            } else if selectedWeek == 1 {
                userDefaults.setValue(false, forKey: "ENWEEK2")
                userDefaults.setValue(true, forKey: "ENWEEK3")
            } else if selectedWeek == 2 {
                userDefaults.setValue(false, forKey: "ENWEEK3")
                userDefaults.setValue(true, forKey: "ENWEEK4")
            } else if selectedWeek == 3 {
                userDefaults.setValue(false, forKey: "ENWEEK4")
                userDefaults.setValue(true, forKey: "ENWEEK5")
            } else if selectedWeek == 4 {
                userDefaults.setValue(false, forKey: "ENWEEK5")
                userDefaults.setValue(true, forKey: "ENWEEK6")
            } else if selectedWeek == 5 {
                userDefaults.setValue(false, forKey: "ENWEEK6")
                userDefaults.setValue(true, forKey: "ENWEEK7")
            } else if selectedWeek == 6 {
                userDefaults.setValue(false, forKey: "ENWEEK7")
                userDefaults.setValue(true, forKey: "ENWEEK8")
            } else if selectedWeek == 7 {
                userDefaults.setValue(false, forKey: "ENWEEK8")
                userDefaults.setValue(true, forKey: "ENWEEK9")
            } else if selectedWeek == 8 {
                userDefaults.setValue(false, forKey: "ENWEEK9")
                userDefaults.setValue(true, forKey: "ENWEEK10")
            } else if selectedWeek == 9 {
                userDefaults.setValue(false, forKey: "ENWEEK10")
                userDefaults.setValue(true, forKey: "ENWEEK11")
            } else if selectedWeek == 10 {
                userDefaults.setValue(false, forKey: "ENWEEK11")
                userDefaults.setValue(true, forKey: "ENWEEK12")
            } else if selectedWeek == 11 {
                userDefaults.setValue(false, forKey: "ENWEEK12")
                userDefaults.setValue(true, forKey: "ENWEEK13")
            } else if selectedWeek == 12 {
                userDefaults.setValue(false, forKey: "ENWEEK13")
                userDefaults.setValue(true, forKey: "ENWEEK14")
            } else if selectedWeek == 13 {
                userDefaults.setValue(false, forKey: "ENWEEK14")
                userDefaults.setValue(true, forKey: "ENWEEK15")
            } else if selectedWeek == 14 {
                userDefaults.setValue(false, forKey: "ENWEEK15")
                userDefaults.setValue(true, forKey: "ENWEEK16")
            } else if selectedWeek == 15 {
                userDefaults.setValue(false, forKey: "ENWEEK16")
                userDefaults.setValue(true, forKey: "ENWEEK17")
            } else if selectedWeek == 16 {
                userDefaults.setValue(false, forKey: "ENWEEK17")
                userDefaults.setValue(true, forKey: "ENWEEK18")
            } else if selectedWeek == 17 {
                userDefaults.setValue(false, forKey: "ENWEEK18")
                userDefaults.setValue(true, forKey: "ENWEEK19")
            } else if selectedWeek == 18 {
                userDefaults.setValue(false, forKey: "ENWEEK19")
                userDefaults.setValue(true, forKey: "ENWEEK20")
            } else if selectedWeek == 19 {
                userDefaults.setValue(false, forKey: "ENWEEK20")
                userDefaults.setValue(true, forKey: "ENWEEK21")
            } else if selectedWeek == 20 {
                userDefaults.setValue(false, forKey: "ENWEEK21")
                userDefaults.setValue(true, forKey: "ENWEEK22")
            } else if selectedWeek == 21 {
                userDefaults.setValue(false, forKey: "ENWEEK22")
                userDefaults.setValue(true, forKey: "ENWEEK23")
            } else if selectedWeek == 22 {
                userDefaults.setValue(false, forKey: "ENWEEK23")
                userDefaults.setValue(true, forKey: "ENWEEK24")
            }
       // mengganti warna sebelum balik ke halaman induk
//            self.dismiss(animated: true, completion: nil)
            
        }
        self.navigationController?.popViewController(animated: true)
//        dismiss(animated: true, completion: nil)
        
    }
//    override func willMove(toParent parent: UIViewController?) {
//        super.willMove(toParent: parent)
//
//        if parent == nil {
//            print("Tulis sesuatu")
//        }
//    }

    
}

