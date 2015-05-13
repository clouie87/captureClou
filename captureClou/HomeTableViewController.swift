//
//  HomeTableViewController.swift
//  captureClou
//
//  Created by Caroline Louie on 2015-05-10.
//  Copyright (c) 2015 Caroline Louie. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, ChallengeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
                    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChallengeCell") as! ChallengeTableViewCell
        
        let challenge = data[indexPath.row]
        
        cell.confirgureWithChallenge(challenge)
        
        cell.delegate = self
          
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        performSegueWithIdentifier("ChallengeIdSegue", sender: indexPath)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //Mark: ChallengeTableViewCellDelegate
    
    func challengeTableViewCellDidTouchHeart(cell: ChallengeTableViewCell, sender: AnyObject) {
        //TO DO CODE HERE
        
    }
    func challengeTableViewCellDidTouchAdd(cell: ChallengeTableViewCell, sender: AnyObject) {
        //TO DO
    }
    
    func challengeTableViewCellDidTouchTitle(cell: ChallengeTableViewCell, sender: AnyObject) {
        
        performSegueWithIdentifier("ChallengeIdSegue", sender: cell)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "ChallengeIdSegue" {
            
            let toView = segue.destinationViewController as! ChallengeIdTableViewController

            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
    
            toView.challenge = data[indexPath.row]
            
        }
    }
    
    
    
    
//    @IBAction func LogoutButtonDidTouch(sender: AnyObject) {
//        performSegueWithIdentifier("LoggedInSegue", sender: indexPath)
        
//    }
   
}
