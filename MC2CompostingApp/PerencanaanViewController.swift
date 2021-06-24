//
//  PerencanaanViewController.swift
//  MC2CompostingApp
//
//  Created by Catharina Benita Irawan on 15/06/21.
//

import UIKit

class PerencanaanViewController: UIViewController {

    @IBOutlet weak var labelpilih: UILabel!
    @IBOutlet weak var view2bulan: UIView!
    @IBOutlet weak var view3bulan: UIView!
    @IBOutlet weak var view6bulan: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @objc func clickedView2bulan() {
        let reminder = UIStoryboard(name: "SetReminder", bundle: nil)
        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
        vc.text = "2 bulan"
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func clickedView3bulan() {
        var reminder = UIStoryboard(name: "SetReminder", bundle: nil)
        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
        vc.text = "3 bulan"

        self.navigationController?.pushViewController(vc, animated: true)

    }
    @objc func clickedView6bulan() {
        var reminder = UIStoryboard(name: "SetReminder", bundle: nil)
        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
        vc.text = "6 bulan"

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
        
        
    //ini kalau pakai button

//    }
//    @IBAction func action2bulan(_ sender: Any) {
//        var reminder = UIStoryboard(name: "SetReminder", bundle: nil)
//        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
//        vc.text = "2 bulan"
//
//        self.navigationController?.pushViewController(vc, animated: true)
//
//    }
//
//    @IBAction func action3bulan(_ sender: Any) {
//        var reminder = UIStoryboard(name: "SetReminder", bundle: nil)
//        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
//        vc.text = "3 bulan"
//
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
//    @IBAction func action6bulan(_ sender: Any) {
//        var reminder = UIStoryboard(name: "SetReminder", bundle: nil)
//        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
//        vc.text = "6 bulan"
//
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
    //ini kalau pake tarik2
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.destination.isKind(of: SetReminderViewController.self){
//            let vc = segue.destination as! SetReminderViewController
//            vc.text = "4 bulan"
//
//        }

    }

}
