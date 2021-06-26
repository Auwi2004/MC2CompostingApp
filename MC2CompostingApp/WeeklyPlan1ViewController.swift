//
//  WeeklyPlan1ViewController.swift
//  MC2CompostingApp
//
//  Created by Dian Tresnawan on 24/06/21.
//

import UIKit

class WeeklyPlan1ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {

    let minggu1: [String] = ["1", "2", "3", "4", "5", "6", "7", "8"]
    let minggu2: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    let minggu3: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
    let layout = UICollectionViewFlowLayout()
    
    var minggu = [String]()
    var pilihbulan: Int = 0
    var selectWeek: Int = 0
//    var selectedWeek: [Bool] = [false, false, false, false, false, false, ]
    var userDefaults = UserDefaults.standard // digunakan untuk menimpan BULAN, WEEK, SUBWEEK

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perencanaan"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        userDefaults.setValue(0, forKey: "CHECK") // dummy: disimpan di halaman yang lain
        userDefaults.setValue(12, forKey: "BULAN") // dummy: disimpan di halaman yang lain
        pilihbulan = userDefaults.value(forKey: "BULAN") as! Int // ambil data BULAN yang dipilih dari halaman lain
        print(pilihbulan)
        
        selectedMonth() // jumlah minggu sesuai pilihan bulan

    }
    
    func selectedMonth(){
        if (pilihbulan == 3) {
            minggu = minggu1
        } else if (pilihbulan == 12) {
            minggu = minggu2
        } else {
            minggu = minggu3
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/3.31), height: (view.frame.size.width/3.31))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return minggu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WeeklyPlan1CollectionViewCell
        cell.myLabel.text = minggu[indexPath.item]
        cell.contentView.backgroundColor = UIColor(red: 201/255, green: 202/255, blue: 206/255, alpha: 100/255)
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Minggu yang dikirim", indexPath.item)  // cek yang dipilih
        
        if let cell = collectionView.cellForItem(at: indexPath ) {
            cell.contentView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100/255)
        }

        // Move to next VC
        
        let rencana = UIStoryboard(name: "WeeklyPlan2Storyboard", bundle: nil)
        let vc = rencana.instantiateViewController(identifier: "WeeklyPlan2View") as! WeeklyPlan2ViewController
        
        vc.selectedWeek = indexPath.item
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

//BUAT ALERT DI BACK BUTTON??

//    @IBAction func backButton (_ sender: Any) {
//        let alert = UIAlertController (title: "Reset", message: "Apakah kamu yakin mau mengatur ulang kegiatan ini?", preferredStyle: .alert)
//        let tidak = UIAlertAction(title: "Tidak", style: .cancel, handler: nil)
////        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(tidak)
//        alert.addAction(UIAlertAction(title: "Ya", style: .default, handler: { (alertAction) in
//            let rencana = UIStoryboard(name: "WeeklyPlan1Storyboard", bundle: nil)
//            let vc = rencana.instantiateViewController(identifier: "WeeklyPlan1View") as! WeeklyPlan1ViewController
//
//
//            self.navigationController?.pushViewController(vc, animated: true)
//        }))
//
//
//
//        //munculkan alert
//        present(alert, animated: true, completion: nil)
//
//}
