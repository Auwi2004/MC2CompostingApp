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
    
    // @IBOutlet weak var pesanUILabel: UILabel!
    
    @IBOutlet weak var pesanUILabel: UILabel!
    let layout = UICollectionViewFlowLayout()
    
    var minggu = [String]()
    var pilihbulan: Int = 0
    var selectWeek: Int = 0
    var nextPageEnable: Bool = false
    var enWeek: [Bool] = []
    var indeks: Int = 0
    var indCollor: Int = 0
    var tempBool: Bool = false
    var check1: Bool = false
    var check2: Bool = false
    var check3: Bool = false
    var pesan1: Bool = false
    var pesan2: Bool = false
    var pesan3: Bool = false
    var gotNoticed: Bool = false // harus diambil dari set reminder jika sudah di notifikasi maka jadi true
    // diambil dengan --> gotNoticed = usedDefaults.Value(forKey: "NOTICE")
    // notice ketika tanggal notifikasi terlewati...
    var userDefaults = UserDefaults.standard // digunakan untuk menimpan BULAN, WEEK dst

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perencanaan"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pilihbulan = userDefaults.value(forKey: "MONTH") as! Int // ambil data BULAN yang dipilih dari halaman lain
        selectedMonth() // jumlah minggu sesuai pilihan bulan
        
        pesanUILabel.text = "Pesan Awal"

    }
    
    
    
//    @IBAction func notifBtn(_ sender: Any) {
//        gotNoticed = true
//        if pesan1 == true && gotNoticed == true{
//            pesanUILabel.text = "Yuk masukan material dalam komposter kamu."
//            gotNoticed = false
//        }
//        if pesan2 == true && gotNoticed == true {
//            pesanUILabel.text = "Kamu punya satu kegiatan terakhir yang harus dilakukan nih. Cek, ya!"
//            gotNoticed = false
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
//        collectionView.reloadData()
//        print("test test test")
        pesan1 = userDefaults.value(forKey: "PESAN1") as! Bool
        pesan2 = userDefaults.value(forKey: "PESAN2") as! Bool
        pesan3 = userDefaults.value(forKey: "PESAN3") as! Bool
        if pesan1 == true {
            pesanUILabel.text = "Kamu sudah menyelesaikan kegiatan hari ini. Sampai bertemu pada kegiatan selanjutnya ya!"
            if gotNoticed == true {
                pesanUILabel.text = "Yuk masukan material dalam komposter kamu."
            }
        } else if pesan2 == true {
            pesanUILabel.text = "Kamu sudah menyelesaikan kegiatan hari ini. Sampai bertemu pada kegiatan selanjutnya ya!"
            if gotNoticed == true {
                pesanUILabel.text = "Kamu punya satu kegiatan terakhir yang harus dilakukan nih. Cek, ya!"
            }
        } else if pesan3 == true {
            pesanUILabel.text = "Keren! kamu sudah menyelesaikan semua kegiatan. Sampai jumpa minggu depan ya!"
        } else {
            pesanUILabel.text = "Ayo kumpulkan sampah yang kamu hasilkan!"
        }
        if pesan1 == true && pesan2 == true && pesan3 == true {
            userDefaults.setValue(false, forKey: "PESAN1")
            userDefaults.setValue(false, forKey: "PESAN2")
            userDefaults.setValue(false, forKey: "PESAN3")
        }
        
    }
    
    
    
    func selectedMonth(){
        if (pilihbulan == 2) {
            minggu = minggu1
        } else if (pilihbulan == 3) {
            minggu = minggu2
        } else {
            minggu = minggu3
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/3.45), height: (view.frame.size.width/3.45))
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
//        cell.contentView.backgroundColor = UIColor(red: 201/255, green: 202/255, blue: 206/255, alpha: 100/255)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Enable atau tidak?
        indeks = indexPath.item
        enWeek.insert(userDefaults.value(forKey: "ENWEEK1") as! Bool, at: 0)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK2") as! Bool, at: 1)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK3") as! Bool, at: 2)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK4") as! Bool, at: 3)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK5") as! Bool, at: 4)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK6") as! Bool, at: 5)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK7") as! Bool, at: 6)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK8") as! Bool, at: 7)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK9") as! Bool, at: 8)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK10") as! Bool, at: 9)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK11") as! Bool, at: 10)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK12") as! Bool, at: 11)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK13") as! Bool, at: 12)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK14") as! Bool, at: 13)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK15") as! Bool, at: 14)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK16") as! Bool, at: 15)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK17") as! Bool, at: 16)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK18") as! Bool, at: 17)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK19") as! Bool, at: 18)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK20") as! Bool, at: 19)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK21") as! Bool, at: 20)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK22") as! Bool, at: 21)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK23") as! Bool, at: 22)
        enWeek.insert(userDefaults.value(forKey: "ENWEEK24") as! Bool, at: 23)
            
        if indeks == 0 && enWeek[0] == true {
            nextPageEnable = true
        } else if indeks == 1 && enWeek[1] == true {
            nextPageEnable = true
        } else if indeks == 2 && enWeek[2] == true {
            nextPageEnable = true
        } else if indeks == 3 && enWeek[3] == true {
            nextPageEnable = true
        } else if indeks == 4 && enWeek[4] == true {
            nextPageEnable = true
        } else if indeks == 5 && enWeek[5] == true {
            nextPageEnable = true
        } else if indeks == 6 && enWeek[6] == true {
            nextPageEnable = true
        } else if indeks == 7 && enWeek[7] == true {
            nextPageEnable = true
        } else if indeks == 8 && enWeek[8] == true {
            nextPageEnable = true
        } else if indeks == 9 && enWeek[9] == true {
            nextPageEnable = true
        } else if indeks == 10 && enWeek[10] == true {
            nextPageEnable = true
        } else if indeks == 11 && enWeek[11] == true {
            nextPageEnable = true
        } else if indeks == 12 && enWeek[12] == true {
            nextPageEnable = true
        } else if indeks == 13 && enWeek[13] == true {
            nextPageEnable = true
        } else if indeks == 14 && enWeek[14] == true {
            nextPageEnable = true
        } else if indeks == 15 && enWeek[15] == true {
            nextPageEnable = true
        } else if indeks == 16 && enWeek[16] == true {
            nextPageEnable = true
        } else if indeks == 17 && enWeek[17] == true {
            nextPageEnable = true
        } else if indeks == 18 && enWeek[18] == true {
            nextPageEnable = true
        } else if indeks == 19 && enWeek[19] == true {
            nextPageEnable = true
        } else if indeks == 20 && enWeek[20] == true {
            nextPageEnable = true
        } else if indeks == 21 && enWeek[21] == true {
            nextPageEnable = true
        } else if indeks == 22 && enWeek[22] == true {
            nextPageEnable = true
        } else if indeks == 23 && enWeek[23] == true {
            nextPageEnable = true
        } else {
            nextPageEnable = false
        }

        if pilihbulan == 2 && enWeek[7] == false {
            print("Test test test test")
            let cell = collectionView.cellForItem(at: indexPath )
            cell!.contentView.backgroundColor = UIColor(red: 145/255, green: 190/255, blue: 75/255, alpha: 100/255)
        }
        if pilihbulan == 3 && enWeek[11] == false {
            let cell = collectionView.cellForItem(at: indexPath )
            cell!.contentView.backgroundColor = UIColor(red: 145/255, green: 190/255, blue: 75/255, alpha: 100/255)
        }
        if pilihbulan == 6 && enWeek[23] == false {
            let cell = collectionView.cellForItem(at: indexPath )
            cell!.contentView.backgroundColor = UIColor(red: 145/255, green: 190/255, blue: 75/255, alpha: 100/255)
        }
        
        // Bisa pindah halaman radio button
        if nextPageEnable == true {
            if let cell = collectionView.cellForItem(at: indexPath ) {
                cell.contentView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100/255)
            }
            if indeks > 0 {
                let myIndexPath = IndexPath(row: indeks - 1, section: 0)
                if let cell = collectionView.cellForItem(at: myIndexPath ) {
                    cell.contentView.backgroundColor = UIColor(red: 145/255, green: 190/255, blue: 75/255, alpha: 100/255)
                }
            }

            
            // Push VC
            let rencana = UIStoryboard(name: "WeeklyPlan2Storyboard", bundle: nil)
            let vc = rencana.instantiateViewController(identifier: "WeeklyPlan2View") as! WeeklyPlan2ViewController
            vc.selectedWeek = indeks
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

