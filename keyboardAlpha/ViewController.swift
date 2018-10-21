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
    @IBOutlet weak var KeyboardView: UILabel!
    @IBOutlet weak var curretInput: UILabel!
    var keypad01Model = keypad()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func keypad01TapHandler(_ sender: UITapGestureRecognizer) {
        //DisplayLabel.text?.append("S")
        DisplayLabel.text = "Middle";
        if (flag == 0){
            updateKeyboard()
        }
        else {
            updateInput()
        }
    }
    var flag = 0;
    func updateKeyboard() {
        
        if (DisplayLabel.text == "Left") {
    
            KeyboardView.text = "q w e\n a s d\n z x c"
            flag = 1;
            
        }
        else if(DisplayLabel.text == "Middle"){
            KeyboardView.text = "r t y\nf g h\nv b n"
            flag = 2;

        }
        else if(DisplayLabel.text == "Right"){
            KeyboardView.text = "u i o\nj k l\nm    p"
            flag = 3;
          

        }
    }
    func updateInput(){
        //DisplayLabel.text = "Label"
        
        if (flag == 1){
            if (DisplayLabel.text == "Left") {
                curretInput.text = "a"
            }
            else if (DisplayLabel.text == "Middle") {
                curretInput.text = "s"
            }
            else if (DisplayLabel.text == "Right") {
                curretInput.text = "d"
            }
            else if (DisplayLabel.text == "UpperLeft") {
                curretInput.text = "q"
            }
            else if (DisplayLabel.text == "Up") {
                curretInput.text = "w"
            }
            else if (DisplayLabel.text == "UpperRight") {
                curretInput.text = "e"
            }
            else if (DisplayLabel.text == "LowerLeft") {
                curretInput.text = "z"
            }
            else if (DisplayLabel.text == "Down") {
                curretInput.text = "x"
            }
            else if (DisplayLabel.text == "LowerRight") {
                curretInput.text = "c"
            }
            
        }
        if (flag == 2){
            if (DisplayLabel.text == "Left") {
                curretInput.text = "f"
            }
            else if (DisplayLabel.text == "Middle") {
                curretInput.text = "g"
            }
            else if (DisplayLabel.text == "Right") {
                curretInput.text = "h"
            }
            else if (DisplayLabel.text == "UpperLeft") {
                curretInput.text = "r"
            }
            else if (DisplayLabel.text == "Up") {
                curretInput.text = "t"
            }
            else if (DisplayLabel.text == "UpperRight") {
                curretInput.text = "y"
            }
            else if (DisplayLabel.text == "LowerLeft") {
                curretInput.text = "v"
            }
            else if (DisplayLabel.text == "Down") {
                curretInput.text = "b"
            }
            else if (DisplayLabel.text == "LowerRight") {
                curretInput.text = "n"
            }
            
            
        }
        if (flag == 3){
            if (DisplayLabel.text == "Left") {
                curretInput.text = "j"
            }
            else if (DisplayLabel.text == "Middle") {
                curretInput.text = "k"
            }
            else if (DisplayLabel.text == "Right") {
                curretInput.text = "l"
            }
            else if (DisplayLabel.text == "UpperLeft") {
                curretInput.text = "u"
            }
            else if (DisplayLabel.text == "Up") {
                curretInput.text = "i"
            }
            else if (DisplayLabel.text == "UpperRight") {
                curretInput.text = "o"
            }
            else if (DisplayLabel.text == "LowerLeft") {
                curretInput.text = "m"
            }
            else if (DisplayLabel.text == "Down") {
                curretInput.text = " "
            }
            else if (DisplayLabel.text == "LowerRight") {
                curretInput.text = "p"
            }
            
            
        }
        
        flag = 0;
        KeyboardView.text = " "
    }
    @IBAction func keypad01GestureHandler(_ sender: UIPanGestureRecognizer) {
        if sender.state == .ended {
            DisplayLabel.text = "\(keypad01Model.direct(of: sender.translation(in: self.view)))"
        }
        if (flag == 0){
            updateKeyboard()
        }
        else {
            updateInput()
        }
    }
    
    
    
    
}

