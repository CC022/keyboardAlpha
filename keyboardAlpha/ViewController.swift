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
        controlPad.layer.borderWidth = constants.keypadBorderWidth
        QWEPad.layer.borderWidth = constants.keypadBorderWidth
        RTYPad.layer.borderWidth = constants.keypadBorderWidth
        UIOPad.layer.borderWidth = constants.keypadBorderWidth
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
                    capLockIndicator.textColor = keypad01Model.capLocked ? #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
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
        static let keypadBorderWidth = 3 as CGFloat
        static let keypadBorderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1) as CGColor
        static let keypadBorderInactiveColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) as CGColor
    }
    
    func updateBorderColor() -> Void {
        switch keypad01Model.currentState {
        case .selectKeypad:
            QWEPad.layer.borderColor = constants.keypadBorderInactiveColor
            RTYPad.layer.borderColor = constants.keypadBorderInactiveColor
            UIOPad.layer.borderColor = constants.keypadBorderInactiveColor
            controlPad.layer.borderColor = constants.keypadBorderInactiveColor
        case .selectedQWE:
            QWEPad.layer.borderColor = constants.keypadBorderColor
            RTYPad.layer.borderColor = constants.keypadBorderInactiveColor
            UIOPad.layer.borderColor = constants.keypadBorderInactiveColor
            controlPad.layer.borderColor = constants.keypadBorderInactiveColor
        case .selectedRTY:
            QWEPad.layer.borderColor = constants.keypadBorderInactiveColor
            RTYPad.layer.borderColor = constants.keypadBorderColor
            UIOPad.layer.borderColor = constants.keypadBorderInactiveColor
            controlPad.layer.borderColor = constants.keypadBorderInactiveColor
        case .selectedUIO:
            QWEPad.layer.borderColor = constants.keypadBorderInactiveColor
            RTYPad.layer.borderColor = constants.keypadBorderInactiveColor
            UIOPad.layer.borderColor = constants.keypadBorderColor
            controlPad.layer.borderColor = constants.keypadBorderInactiveColor
        case .selectedControlPad:
            QWEPad.layer.borderColor = constants.keypadBorderInactiveColor
            RTYPad.layer.borderColor = constants.keypadBorderInactiveColor
            UIOPad.layer.borderColor = constants.keypadBorderInactiveColor
            controlPad.layer.borderColor = constants.keypadBorderColor
        }
    }
}
