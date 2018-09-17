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
    var keypad01Model = keypad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func keypad01GestureHandler(_ sender: UIPanGestureRecognizer) {
        if sender.state == .ended {
//            DisplayLabel.text = sender.translation(in: self.view).debugDescription
            DisplayLabel.text = "\(keypad01Model.direct(of: sender.translation(in: self.view)))"
        }
    }
    
    
}

