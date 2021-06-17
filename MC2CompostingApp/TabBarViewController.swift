//
//  TabBarViewController.swift
//  MC2CompostingApp
//
//  Created by Catharina Benita Irawan on 15/06/21.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var labelPanduan: UILabel!
    @IBOutlet weak var fotoPertama: UIImageView!
    @IBOutlet weak var labelPertama: UILabel!
    @IBOutlet weak var fotoKedua: UIImageView!
    @IBOutlet weak var labelKedua: UILabel!
  
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonPrevious: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var imageOne = 0
    var imageTwo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set Up first view controller
        
        imageOne = 1
        labelPertama.text = String("1. Siapkan komposter dengan keran atau lubang dibawahnya")
        labelKedua.text = String("2. Kumpulkan bahan coklat dan hijau")
        
        buttonPrevious.isEnabled = false
        
        
    }
    
    
    @IBAction func back(_ sender: Any) {
        
        imageOne -= 1
        imageTwo -= 1
        labelPertama.text = String("")
        labelKedua.text = String("")
        
        
    }
    
    
    @IBAction func next(_ sender: Any) {
        
        imageOne += 1
        imageTwo += 1
        labelPertama.text = String("")
        labelKedua.text = String("")
    }
    
    func panduanKompos() {
        
        if imageOne == 1, imageTwo == 1 {
            buttonPrevious.isEnabled = false
            fotoPertama.image = UIImage(named: "test.jpg")
            fotoKedua.image = UIImage(named:"test2.jpg")
        }
        
        if imageOne == 2, imageTwo == 2 {
            buttonPrevious.isEnabled = false
            fotoPertama.image = UIImage(named: "test.jpg")
            fotoKedua.image = UIImage(named:"test2.jpg")
        }
        
        if imageOne == 3, imageTwo == 3 {
            buttonPrevious.isEnabled = false
            fotoPertama.image = UIImage(named: "test.jpg")
            fotoKedua.image = UIImage(named:"test2.jpg")
        }
        
        if imageOne == 4, imageTwo == 4 {
            buttonPrevious.isEnabled = false
            fotoPertama.image = UIImage(named: "test.jpg")
            fotoKedua.image = UIImage(named:"test2.jpg")
        }
        
        if imageOne == 5, imageTwo == 5 {
            buttonPrevious.isEnabled = false
            fotoPertama.image = UIImage(named: "test.jpg")
            fotoKedua.image = UIImage(named:"test2.jpg")
        }
        
        if imageOne == 6, imageTwo == 6 {
            buttonPrevious.isEnabled = false
            fotoPertama.image = UIImage(named: "test.jpg")
            fotoKedua.image = UIImage(named:"test2.jpg")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
