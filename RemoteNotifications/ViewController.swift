//
//  ViewController.swift
//  RemoteNotifications
//
//  Created by Magnus Ödman on 2016-04-19.
//  Copyright © 2016 Volvo Cars. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uuidTextField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateTextField), name: "UUIDUpdated", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateTextField(notification: NSNotification) {
        if let uuid = notification.userInfo!["uuid"] as? String {
            uuidTextField.text = uuid
        }
        
    }

    @IBAction func copyToClipboard(sender: AnyObject) {
        UIPasteboard.generalPasteboard().string = uuidTextField.text
        let activityViewController = UIActivityViewController(activityItems: [uuidTextField.text! as NSString], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
        
    }
}

