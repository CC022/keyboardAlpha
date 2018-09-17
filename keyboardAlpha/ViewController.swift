//
//  ViewController.swift
//  keyboardAlpha
//
//  Created by zzc on 9/16/18.
//  Copyright © 2018 zzc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var DisplayLabel: UILabel!
    @IBOutlet weak var keypad01: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        keypad01.layer.masksToBounds = true
//        keypad01.layer.cornerRadius = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func keypadGestureHandler(_ sender: KeypadGestureRecognizer) {
        if sender.state == .ended {
            DisplayLabel.text = "Aha"
        }
    }
    
}

