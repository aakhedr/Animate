//
//  ViewController.swift
//  Animate
//
//  Created by Ahmed Khedr on 9/21/17.
//  Copyright © 2017 Ahmed Khedr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var syncButton: UIBarButtonItem!
    @IBOutlet weak var updateButton: UIBarButtonItem!
    
    var updateLabel: UILabel!
    var syncLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // y and width for both labels
        let y = navigationController!.navigationBar.frame.height + UIApplication.shared.statusBarFrame.height + 8
        let width = view.bounds.width * 0.4
        
        let syncX = view.bounds.width - width
        syncLabel = UILabel(frame: CGRect(x: syncX, y: y, width: width, height: 0))
        view.addSubview(syncLabel)
        syncLabel.text = "Sync Label Sync Label Sync Label"
        syncLabel.numberOfLines = 0
        syncLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        syncLabel.sizeToFit()
        
        let updateX = view.bounds.minX + 8
        updateLabel = UILabel(frame: CGRect(x: updateX, y: y, width: width, height: 0))
        view.addSubview(updateLabel)
        updateLabel.text = "Update Label Update Label Update Label "
        updateLabel.numberOfLines = 0
        updateLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        updateLabel.sizeToFit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Remove labels from the view initially
        updateLabel.center.y -= view.bounds.height
        syncLabel.center.y -= view.bounds.height
    }

    @IBAction func updateAction(_ sender: UIBarButtonItem) {
        // Put back to its original position
        UIView.animate(withDuration: 0.5) {
            self.updateLabel.center.y += self.view.bounds.height
        }
        
        // Make disappear
        UIView.animate(withDuration: 0.5,
                       delay: 2,
                       options: .curveLinear,
                       animations: {
                        self.updateLabel.center.y -= self.view.bounds.height
                        
        },
                       completion: nil)
    }
    
    @IBAction func syncAction(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.5) {
            self.syncLabel.center.y += self.view.bounds.height
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 2,
                       options: .curveLinear,
                       animations: {
                        self.syncLabel.center.y -= self.view.bounds.height
                        
        },
                       completion: nil)
    }
}

