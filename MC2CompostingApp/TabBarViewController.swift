//
//  TabBarViewController.swift
//  MC2CompostingApp
//
//  Created by Catharina Benita Irawan on 15/06/21.
//

import UIKit

class TabBarViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var labelPanduan: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images: [String] = ["step 1","Step 3","step 5","step 7", "step 11"]
    var images2: [String] = ["step 2","step 4","step 6","step 8"]
    var frame = CGRect(x:0,y:0,width:0,height:0)
    var desc: [String] = ["balabls","nas;d","sdja"]
    var desc2: [String] = ["yayay","jsdja","kcsdk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = desc.count
        for index in 0..<desc.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let allViewsInXibArray = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)

            //If you only have one view in the xib and you set it's class to MyView class
            let myView = allViewsInXibArray?.first as! Slide
            
            //Set wanted position and size (frame)
            myView.frame = frame
            myView.labelAtas.text = desc[index]
            myView.fotoAtas.image = UIImage(named: images[index])
            myView.labelBawah.text = desc2[index]
            
            
            //Add the view
            self.scrollView.addSubview(myView)

            //TODO: set wanted constraints.
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x:  10, y: view.frame.size.height-150, width: view.frame.size.width-20, height: 70)
    }
    
    //scrollview method
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        
    }


}

        // Do any additional setup after loading the view.
        // Set Up first view controller
        
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
