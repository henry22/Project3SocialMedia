//
//  DetailViewController.swift
//  Project1StormViewer
//
//  Created by Henry on 4/26/15.
//  Copyright (c) 2015 Henry. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                //UIImage is the data type used to load image data, such as PNG or JPEGs.
                imageView.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        //The .Action(UIBarButtonSystem.Action) system item displays an arrow coming out of a box, signalling the user can do something when it's tapped.The action parameter is saying "when you're tapped, call the shareTapped() method," and the target parameter tells the button that the method belongs to the current view controller – self.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "sharedTapped")
    }
    
    override func viewWillAppear(animated: Bool) {
        //It means that it passes the method on to UIViewController, which may do its own processing
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        //It means that it passes the method on to UIViewController, which may do its own processing
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func sharedTapped() {
        //Created with the Facebook service type
        let viewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        viewController.setInitialText("Look at this great picture!")
        viewController.addImage(detailImageView.image!)
        //The NSURL(string:) method converts the string into a full NSURL instance, which can then be passed to addURL()
        viewController.addURL(NSURL(string: "http://www.photolab.noaa.gov/nssl"))
        presentViewController(viewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

