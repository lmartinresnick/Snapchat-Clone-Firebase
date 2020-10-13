//
//  SnapVC.swift
//  SnapchatClone37
//
//  Created by Luke Martin-Resnick on 10/2/20.
//

import UIKit
import ImageSlideshow

class SnapVC: UIViewController {
    
    var selectedSnap : Snap?
    var inputArray = [KingfisherSource]()

    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let snap = selectedSnap {
            
            timeLabel.text = "Time Left: \(snap.timeDifference)"
            for imageURL in snap.imageURLArray {
                inputArray.append(KingfisherSource(urlString: imageURL)!)
                
            }
            
            let imageSlideShow = ImageSlideshow(frame: CGRect(x: 10, y: 10, width: self.view.frame.width * 0.95, height: self.view.frame.height * 0.9))
            imageSlideShow.backgroundColor = UIColor.white
            
            let pageIndicator = UIPageControl()
            pageIndicator.currentPageIndicatorTintColor = UIColor.black
            pageIndicator.pageIndicatorTintColor = UIColor.lightGray
            imageSlideShow.pageIndicator = pageIndicator
            
            imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
            imageSlideShow.setImageInputs(inputArray)
            self.view.addSubview(imageSlideShow)
            self.view.bringSubviewToFront(timeLabel)
        }
        

        
    }
    

    

}
