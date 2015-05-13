//
//  ChallengeTableViewCell.swift
//  captureClou
//
//  Created by Caroline Louie on 2015-05-10.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

protocol ChallengeTableViewCellDelegate: class {
    func challengeTableViewCellDidTouchHeart(cell: ChallengeTableViewCell, sender: AnyObject)
    
    func challengeTableViewCellDidTouchTitle(cell: ChallengeTableViewCell, sender: AnyObject)
    
    func challengeTableViewCellDidTouchAdd(cell: ChallengeTableViewCell, sender: AnyObject)
    
}

class ChallengeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var TitleButton: SpringButton!

    @IBOutlet weak var heartButton: SpringButton!
   
    @IBOutlet weak var addButton: SpringButton!
   
    @IBOutlet weak var acceptedsLabel: UILabel!
    
    @IBOutlet weak var checkmarkButton: SpringButton!
    
    @IBOutlet weak var addedButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var challengeImageView: UIImageView!
    
    weak var delegate: ChallengeTableViewCellDelegate?
    
    
    @IBAction func addButtonDidTouch(sender: AnyObject) {
        
        addButton.alpha = 0
        showCheckMark()
        
        delegate?.challengeTableViewCellDidTouchAdd(self, sender:sender)
    }
    
    @IBAction func titleButtonDidTouch(sender: AnyObject) {
        delegate?.challengeTableViewCellDidTouchTitle(self, sender:sender)
    }
    
    @IBAction func heartButtonDidTouch(sender: AnyObject) {
        heartButton.animation = "pop"
        heartButton.force = 3
        heartButton.animate()
        
        delegate?.challengeTableViewCellDidTouchHeart(self, sender:sender)
    }
    
    func showCheckMark() {
        checkmarkButton.alpha = 1
        checkmarkButton.animation = "pop"
        checkmarkButton.duration = 2
        checkmarkButton.animate()
       
        hideCheckMark()

    }
    
    func hideCheckMark() {
        springWithDelay(1, 0.20, {
            self.checkmarkButton.alpha = 0
            self.addedButton.alpha = 0.9
            self.addedButton.tintColor = UIColor(hex:"#00D6F1")
        })
    }
    
    func confirgureWithChallenge(challenge: JSON){
        
        let title = challenge["title"].string!
        let challengeImage = challenge["id"].string!
        let count = challenge["accepteds_count"].string!
//        let challenge = challenge["image"] as! String
        
        titleLabel.text = title
        challengeImageView.image = UIImage(named: "pic " + challengeImage)
        acceptedsLabel.text = count
        
//        if let commentTextView = commentTextView {
//            commentTextView.text = comment
//        }
        
    }
}
