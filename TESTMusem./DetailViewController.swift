//
//  DetailViewController.swift
//  TESTMusem.
//
//  Created by Mac on 24.04.2023.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var object: ArtObject!
    
    @IBOutlet var imageObject: UIImageView!
    @IBOutlet var descriptionObject: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionObject.text = object.longTitle
        
        guard let imageURL = URL(string: object.webImage.url ) else {return}
        
        let procesor = DownsamplingImageProcessor(size: imageObject.bounds.size)
        imageObject.kf.indicatorType = .activity
        
        imageObject.kf.setImage(with: imageURL, options: [
            .processor(procesor),
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
        ]
        )
    }
}



