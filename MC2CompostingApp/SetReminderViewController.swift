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
        


        //setup picker
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm"
        
        pilihanJamPicker.datePickerMode = .time
        pilihanJamPicker.addTarget(self, action: #selector(pilihanJamPickerValueChange(sender:)), for: UIControl.Event.valueChanged)
        pilihanJamPicker.frame.size = CGSize (width: 100, height: 100)
        

    }
    
    
    func createDailyNotif(gapDays:Int,monthPeriod:Int){
        //detect sekarang hari apa
        //3 hari dari hari minggu sampe 3 bulan kedapan apa aja
        let date = Date()
        let cal = Calendar.current
        let tanggalSekarang = cal.component(.day, from: date)
        
        let center = UNUserNotificationCenter.current()
       
        for i in tanggalSekarang+1...tanggalSekarang+(monthPeriod*30){
            if (i-tanggalSekarang)%gapDays == 0{
                var dateComponents = DateComponents()
                
                dateComponents.calendar = Calendar.current
        //        pengulangan notifikasi di waktu tertentu
                dateComponents.day = i
                dateComponents.hour =  cal.component(.hour, from: pilihanJamPicker.date)
                dateComponents.minute =  cal.component(.minute, from: pilihanJamPicker.date)
                
//                dump(dateComponents)
            
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                let triger2 = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                
                let uuidString = UUID().uuidString
                let content = UNMutableNotificationContent()
                content.title = "Pengingat"
                content.body = "Hai! Cek kegiatan dalam perencaan mu hari ini yuk!"
                let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
                
                let re2 = UNNotificationRequest(identifier: "coba", content: content, trigger: triger2
                )
                
                center.add(request) {(error) in
                    // Check the error parameter and handle any error
                }
                center.add(re2) { (error) in
                    if let error = error{
                        print(error)
                    }
                }
            }
        }
    }
    func createDailyNotif2(gapDays:Int,monthPeriod:Int){
       
    
        for i in 5...waktuTigaHari*monthPeriod*10{
            if (i - waktuTigaHari) % waktuTigaHari == 0 || i==10{
                let triger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(i), repeats: false)
                let uuidString = UUID().uuidString
                let content = UNMutableNotificationContent()
                content.title = "Pengingat"
                content.body = "Hai! Cek kegiatan dalam perencaan mu hari ini yuk!"
                let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: triger)
                
                UNUserNotificationCenter.current().add(request) {(error) in
                    // Check the error parameter and handle any error
                }
            }
        }
    }
    @IBAction func simpan(_ sender: Any) {

        //set alert
        let alert = UIAlertController (title: "Rangkuman", message: "Pengingat akan dikirimkan setiap \(selectedDay) pada jam \(selectedTime) selama \(text) ", preferredStyle: .alert)
        let setUlang = UIAlertAction(title: "Set Ulang", style: .cancel, handler: nil)
        
//        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(setUlang)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] (alertAction) in
            
            guard let hari = Int.parse(from: self?.selectedDay ?? "") else {
                return
            }
            guard let month = Int.parse(from: self?.text ?? "") else {
                return
            }
            
            self?.createDailyNotif(gapDays: hari, monthPeriod: month)
            let rencana = UIStoryboard(name: "WeeklyPlan1Storyboard", bundle: nil)
            let vc = rencana.instantiateViewController(identifier: "WeeklyPlan1View") as! WeeklyPlan1ViewController
            

            self?.navigationController?.pushViewController(vc, animated: true)
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

//ambil Integer dari data String
extension Int {
    static func parse(from string:String)->Int?{
        return Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }
}


extension SetReminderViewController : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound])
    }
}
