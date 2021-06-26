//
//  SetReminderViewController.swift
//  MC2CompostingApp
//
//  Created by Puri Aprianty on 15/06/21.
//

import UIKit
import UserNotifications

class SetReminderViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var text: String = ""
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
            )
            }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: setiapHari[row], attributes: [NSAttributedString.Key.foregroundColor : UIColorFromRGB(rgbValue: 0x3C4D22)])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("item dipilih\(setiapHari[row])")
        
        selectedDay = setiapHari[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return setiapHari[row]
    }

    @IBOutlet weak var pilihanHariPicker: UIPickerView!
    @IBOutlet weak var pilihanWaktuLabel: UILabel!
    @IBOutlet weak var pilihanHariLabel: UILabel!
    @IBOutlet weak var pilihanJamPicker: UIDatePicker!
    @IBOutlet weak var simpanButton: UIButton!
    
    let setiapHari = ["3 Hari","7 Hari"]
    var selectedDay: String = ""
    var selectedTime: String = ""
    var waktuTigaHari = 259200
    var waktuTujuhHari = 604800
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pilih Waktu Panen"
        
        pilihanHariPicker.dataSource = self
        
        pilihanHariPicker.delegate = self
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .alert, .sound]){
            (granted, Error) in
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Pengingat"
        content.body = "Hai! Cek kegiatan dalam perencaan mu hari ini yuk!"
        
        //triger notifikasi
//        let date = Date().addingTimeInterval(5) // setelah  5 detik
//        let dataComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        var dateComponents = DateComponents()
        
        dateComponents.calendar = Calendar.current
//        pengulangan notifikasi di waktu tertentu
        dateComponents.weekday = 3
        dateComponents.hour = 8
        dateComponents.minute = 20
    
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) {(error) in
            // Check the error parameter and handle any error
        }
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm"
        
        pilihanJamPicker.datePickerMode = .time
        pilihanJamPicker.addTarget(self, action: #selector(pilihanJamPickerValueChange(sender:)), for: UIControl.Event.valueChanged)
        pilihanJamPicker.frame.size = CGSize (width: 100, height: 100)
        
    }

    @IBAction func simpan(_ sender: Any) {

        //set alert
        let alert = UIAlertController (title: "Rangkuman", message: "Pengingat akan dikirimkan setiap \(selectedDay) pada jam \(selectedTime) selama \(text) ", preferredStyle: .alert)
        let setUlang = UIAlertAction(title: "Set Ulang", style: .cancel, handler: nil)
        
//        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(setUlang)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alertAction) in
            let rencana = UIStoryboard(name: "WeeklyPlan1Storyboard", bundle: nil)
            let vc = rencana.instantiateViewController(identifier: "WeeklyPlan1View") as! WeeklyPlan1ViewController


            self.navigationController?.pushViewController(vc, animated: true)
        }))
        

        
        //munculkan alert
        present(alert, animated: true, completion: nil)
       
    }
        //set time picker
    @objc func pilihanJamPickerValueChange(sender :UIDatePicker){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm"
        selectedTime = formatter.string(from: sender.date)
    }
    
    
    }

//if text && selectedDay
//else selected time
