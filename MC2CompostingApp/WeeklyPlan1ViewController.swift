//
//  WeeklyPlan1ViewController.swift
//  MC2CompostingApp
//
//  Created by Dian Tresnawan on 24/06/21.
//

import UIKit

class WeeklyPlan1ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {

    let minggu1: [String] = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7", "Week 8"]
    let minggu2: [String] = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7", "Week 8", "Week 9", "Week 10", "Week 11", "Week 12"]
    let minggu3: [String] = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7", "Week 8", "Week 9", "Week 10", "Week 11", "Week 12", "Week 13", "Week14", "Week 15", "Week 16", "Week 17", "Week 18", "Week 19", "Week 20", "Week 21", "Week 22", "Week 23", "Week 24"]
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

}
