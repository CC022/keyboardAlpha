import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var controlPad: UILabel!
    @IBOutlet weak var QWEPad: UILabel!
    @IBOutlet weak var RTYPad: UILabel!
    @IBOutlet weak var UIOPad: UILabel!
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
    @IBAction func keypad01TapHandler(_ sender: UITapGestureRecognizer) {
        if let key = keypad01Model.getKey(with: .Middle) {
            inputField.text.append(key.rawValue)
        }
    }
    
    @IBAction func keypad01GestureHandler(_ sender: UIPanGestureRecognizer) {
        if sender.state == .ended {
            if let key = keypad01Model.getKey(with: keypad01Model.direct(of: sender.translation(in: keypad01))) {
                switch key {
                case .space:
                    inputField.text.append(" ")
                case .delete:
                    inputField.text.removeLast()
                case .capsLock:
                    keypad01Model.capLocked.toggle()
                case .enter:
                    inputField.text.append("\n")
                default:
                    inputField.text.append(key.rawValue)
                }
            }
            
            //            DisplayLabel.text = "\(keypad01Model.direct(of: sender.translation(in: self.view)))"
        }
    }
    
    
}

