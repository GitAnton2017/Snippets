
import Foundation
import UIKit
class TextSnippetEntryViewController: UIViewController
{
    
    var textSaver : (_ text: String)->Void = {_ in }
    
    @IBOutlet weak var textView: UITextView!
    
    @objc func doneButtonPressed ()
    {
      textView.resignFirstResponder()
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let keyboardToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        keyboardToolbar.setItems([flexSpace, doneButton], animated: false)
        textView.inputAccessoryView = keyboardToolbar
        textView.becomeFirstResponder()
        
    }
}
    
extension TextSnippetEntryViewController : UITextViewDelegate
{
    func textViewDidEndEditing(_ textView: UITextView)
    {
      textSaver(textView.text)
      dismiss(animated: true, completion: nil)
    }
}


