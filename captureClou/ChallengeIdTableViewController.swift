//
//  ChallengeIdTableViewController.swift
//  captureClou
//
//  Created by Caroline Louie on 2015-05-11.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

class ChallengeIdTableViewController: UITableViewController {

    
//    @IBOutlet weak var challengeId: UIView!
    
    var challenge: JSON!
    var images: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = challenge["images"]
        
        tableView.estimatedRowHeight = 150
//        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("ChallengeCell") as! ChallengeTableViewCell
//        
//        cell.confirgureWithChallenge(challenge)
        
        
        let identifer = indexPath.row == 0 ? "ChallengeCell" : "ImageCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifer) as! UITableViewCell
        
        if let challengeCell = cell as? ChallengeTableViewCell {
            challengeCell.confirgureWithChallenge(challenge)
        }
        
        if let imageCell = cell as? ImageTableViewCell {
            let image = images[indexPath.row - 1]
            imageCell.configureWithImage(image)
        }
        
        return cell
        
    }
    

}
