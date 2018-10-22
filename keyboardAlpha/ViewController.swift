import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var controlPad: UILabel!
    @IBOutlet weak var capLockIndicator: UILabel!
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
        updateBorderColor()
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
                    capLockIndicator.textColor = keypad01Model.capLocked ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                case .enter:
                    inputField.text.append("\n")
                default:
                    inputField.text.append(key.rawValue)
                }
            }
            updateBorderColor()
        }
    }
    
    @IBAction func ClearButtonPressed(_ sender: UIButton) {
        inputField.text.removeAll()
    }
    
    
}


extension ViewController {
    private struct constants {
//        static let keypadBorderWidth = 3 as CGFloat
        static let keypadActiveColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        static let keypadInactiveColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    func updateBorderColor() -> Void {
        switch keypad01Model.currentState {
        case .selectKeypad:
            QWEPad.backgroundColor = constants.keypadInactiveColor
            RTYPad.backgroundColor = constants.keypadInactiveColor
            UIOPad.backgroundColor = constants.keypadInactiveColor
            controlPad.backgroundColor = constants.keypadInactiveColor
        case .selectedQWE:
            QWEPad.backgroundColor = constants.keypadActiveColor
            RTYPad.backgroundColor = constants.keypadInactiveColor
            UIOPad.backgroundColor = constants.keypadInactiveColor
            controlPad.backgroundColor = constants.keypadInactiveColor
        case .selectedRTY:
            QWEPad.backgroundColor = constants.keypadInactiveColor
            RTYPad.backgroundColor = constants.keypadActiveColor
            UIOPad.backgroundColor = constants.keypadInactiveColor
            controlPad.backgroundColor = constants.keypadInactiveColor
        case .selectedUIO:
            QWEPad.backgroundColor = constants.keypadInactiveColor
            RTYPad.backgroundColor = constants.keypadInactiveColor
            UIOPad.backgroundColor = constants.keypadActiveColor
            controlPad.backgroundColor = constants.keypadInactiveColor
        case .selectedControlPad:
            QWEPad.backgroundColor = constants.keypadInactiveColor
            RTYPad.backgroundColor = constants.keypadInactiveColor
            UIOPad.backgroundColor = constants.keypadInactiveColor
            controlPad.backgroundColor = constants.keypadActiveColor
        }
    }
}
