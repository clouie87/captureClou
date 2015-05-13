//
//  ImageTableViewCell.swift
//  captureClou
//
//  Created by Caroline Louie on 2015-05-12.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit


class ImageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var picImageView: UIImageView!
    
    @IBOutlet weak var heartButton: SpringButton!
    
    @IBOutlet weak var bigHeartConfirm: SpringButton!
    
    @IBAction func heartButtonDidTouch(sender: AnyObject) {
        heartButton.tintColor = UIColor(hex: "#c71f16")
        showHeartConfirm()
        
    }
    
    func showHeartConfirm() {
        bigHeartConfirm.alpha = 0.7
        bigHeartConfirm.animation = "pop"
        bigHeartConfirm.duration = 2
        bigHeartConfirm.animate()
        
        hideHeartConfirm()
    }
    
    func hideHeartConfirm() {
        springWithDelay(2, 0.6, {
            self.bigHeartConfirm.alpha = 0
        })
    }
        
    func configureWithImage(image: JSON){
        let title = image["title"].string
        let picImage = image["image"].string!
        
        titleLabel.text = title
        picImageView.image = UIImage(named: picImage)
        
    }
    
}
