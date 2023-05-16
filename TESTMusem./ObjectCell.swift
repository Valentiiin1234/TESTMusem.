//
//  ObjectCell.swift
//  TESTMusem.
//
//  Created by Mac on 13.03.2023.
//

import UIKit
import Kingfisher


class ObjectCell: UITableViewCell {
    
    
    @IBOutlet var imageObject: UIImageView!
    
    @IBOutlet var principalOrFirstMaker: UILabel!
    
    
    
    @IBOutlet var nameObject: UILabel!
    
    func configure(with object: ArtObject) {
        
        imageObject.frame.size = CGSize(width: 100, height: 100)
        self.principalOrFirstMaker.text = "\(object.principalOrFirstMaker)"
        self.nameObject.text = "\(object.title)"
        
  
      
        guard let imageURL = URL(string: object.webImage.url) else {return}
        
        let procesor = DownsamplingImageProcessor(size: imageObject.bounds.size)
        imageObject.kf.indicatorType = .activity
                
        imageObject.kf.setImage(with: imageURL, options: [
            .processor(procesor),
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
    }
}
