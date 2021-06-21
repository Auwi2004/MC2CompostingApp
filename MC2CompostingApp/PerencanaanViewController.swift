//
//  PerencanaanViewController.swift
//  MC2CompostingApp
//
//  Created by Catharina Benita Irawan on 15/06/21.
//

import UIKit

class PerencanaanViewController: UIViewController {

    @IBOutlet weak var labelpilih: UILabel!
    @IBOutlet weak var button2bulan: UIButton!
    @IBOutlet weak var button3bulan: UIButton!
    @IBOutlet weak var button6bulan: UIButton!
    @IBOutlet weak var view2bulan: UIView!
    @IBOutlet weak var view3bulan: UIView!
    @IBOutlet weak var view6bulan: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    @IBAction func action2bulan(_ sender: Any) {
        var reminder = UIStoryboard(name: "SetReminder", bundle: nil)
        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
        vc.text = "2 bulan"
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func action3bulan(_ sender: Any) {
        var reminder = UIStoryboard(name: "SetReminder", bundle: nil)
        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
        vc.text = "3 bulan"
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func action6bulan(_ sender: Any) {
        var reminder = UIStoryboard(name: "SetReminder", bundle: nil)
        let vc = reminder.instantiateViewController(identifier: "SetReminderVC") as! SetReminderViewController
        vc.text = "6 bulan"
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //ini kalau pake tarik2
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.destination.isKind(of: SetReminderViewController.self){
//            let vc = segue.destination as! SetReminderViewController
//            vc.text = "4 bulan"
//
//        }

    }

