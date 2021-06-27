//
//  PlannerViewController.swift
//  MC2CompostingApp
//
//  Created by Catharina Benita Irawan on 25/06/21.
//

import UIKit

class PlannerViewController: UIViewController {

    @IBOutlet weak var labelpilih: UILabel!
    @IBOutlet weak var view2bulan: UIView!
    @IBOutlet weak var view3bulan: UIView!
    @IBOutlet weak var view6bulan: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var userDefaults = UserDefaults.standard // digunakan untuk menimpan MONTH, WEEK etc... (Dian)
    
    
    
    
    @objc func clickedView2bulan() {
        let reminder = UIStoryboard(name: "SetReminder", bundle: nil)
        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
        vc.text = "2 bulan"
        userDefaults.setValue(2, forKey: "MONTH")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func clickedView3bulan() {
        let reminder = UIStoryboard(name: "SetReminder", bundle: nil)
        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
        vc.text = "3 bulan"
        userDefaults.setValue(3, forKey: "MONTH")
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @objc func clickedView6bulan() {
        let reminder = UIStoryboard(name: "SetReminder", bundle: nil)
        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
        vc.text = "6 bulan"
        userDefaults.setValue(6, forKey: "MONTH")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        scrollView.contentOffset = CGPoint.zero
        
    }
    
    //func warna
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
            )
            }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColorFromRGB(rgbValue: 0xCEE3C2)
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 60/255, green: 77/255, blue: 34/255, alpha: 1.0)]

            navigationController?.navigationBar.tintColor = UIColorFromRGB(rgbValue: 0x3C4D22)
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
//        self.automaticallyAdjustsScrollViewInsets = false

        
        let view2bulantapgesture = UITapGestureRecognizer(target: self, action: #selector(clickedView2bulan))
        view2bulan.addGestureRecognizer(view2bulantapgesture)
        view2bulan.isUserInteractionEnabled = true

        let view3bulantapgesture = UITapGestureRecognizer(target: self, action: #selector(clickedView3bulan))
        view3bulan.addGestureRecognizer(view3bulantapgesture)
        view3bulan.isUserInteractionEnabled = true

        let view6bulantapgesture = UITapGestureRecognizer(target: self, action: #selector(clickedView6bulan))
        view6bulan.addGestureRecognizer(view6bulantapgesture)
        view6bulan.isUserInteractionEnabled = true
        
        // nitip variable global yah...
        userDefaults.setValue(0, forKey: "MONTH")
        userDefaults.setValue(0, forKey: "WEEK")
        userDefaults.setValue(0, forKey: "ENWEEK")
        userDefaults.setValue(true, forKey: "ENWEEK1")
        userDefaults.setValue(false, forKey: "ENWEEK2")
        userDefaults.setValue(false, forKey: "ENWEEK3")
        userDefaults.setValue(false, forKey: "ENWEEK4")
        userDefaults.setValue(false, forKey: "ENWEEK5")
        userDefaults.setValue(false, forKey: "ENWEEK6")
        userDefaults.setValue(false, forKey: "ENWEEK7")
        userDefaults.setValue(false, forKey: "ENWEEK8")
        userDefaults.setValue(false, forKey: "ENWEEK9")
        userDefaults.setValue(false, forKey: "ENWEEK10")
        userDefaults.setValue(false, forKey: "ENWEEK11")
        userDefaults.setValue(false, forKey: "ENWEEK12")
        userDefaults.setValue(false, forKey: "ENWEEK13")
        userDefaults.setValue(false, forKey: "ENWEEK14")
        userDefaults.setValue(false, forKey: "ENWEEK15")
        userDefaults.setValue(false, forKey: "ENWEEK16")
        userDefaults.setValue(false, forKey: "ENWEEK17")
        userDefaults.setValue(false, forKey: "ENWEEK18")
        userDefaults.setValue(false, forKey: "ENWEEK19")
        userDefaults.setValue(false, forKey: "ENWEEK20")
        userDefaults.setValue(false, forKey: "ENWEEK21")
        userDefaults.setValue(false, forKey: "ENWEEK22")
        userDefaults.setValue(false, forKey: "ENWEEK23")
        userDefaults.setValue(false, forKey: "ENWEEK24")
        userDefaults.setValue(false, forKey: "CHECK")
        userDefaults.setValue(false, forKey: "CHECK1")
        userDefaults.setValue(false, forKey: "CHECK2")
        userDefaults.setValue(false, forKey: "CHECK3")
        userDefaults.setValue(false, forKey: "GREEN")
        userDefaults.setValue(false, forKey: "PESAN1")
        userDefaults.setValue(false, forKey: "PESAN2")
        userDefaults.setValue(false, forKey: "PESAN3")
        
    }
    

    
    
}
