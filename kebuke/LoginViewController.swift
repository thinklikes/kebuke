//
//  LoginViewController.swift
//  kebuke
//
//  Created by Ines on 2023/12/27.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var logoBorderView: UIImageView! {
        didSet {
            logoBorderView.clipsToBounds = true
            logoBorderView.layer.cornerRadius = 650
            logoBorderView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            logoBorderView.layer.borderColor = UIColor.accent.cgColor
            logoBorderView.layer.borderWidth = 2
        }
    }
    @IBOutlet weak var logoUIView: UIView! {
        didSet {
            logoUIView.clipsToBounds = true
            logoUIView.layer.cornerRadius = 600
            logoUIView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }

    @IBOutlet weak var userTextField: TextFieldWithPadding!

    @IBOutlet weak var AlertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userTextField.delegate = self
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBSegueAction func Login(_ coder: NSCoder) -> HomeViewController? {
        let controller = HomeViewController(coder: coder)
        controller?.user = userTextField.text
        return controller
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        validateUser(userTextField)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func validateUser(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        // 用來判斷文字長度的 range
        let characterRange = 2...6

        // 判斷是否有特殊符號的正規表達式
        let pattern = "[^a-zA-Z\\u4e00-\\u9fa5]+"
        //生成NSRegularExpression實例
        let regex = try! NSRegularExpression(pattern: pattern, options: .allowCommentsAndWhitespace)
        let numberOfMatches = regex.numberOfMatches(in: text, options:.reportProgress, range: NSMakeRange(0, text.length))
        
        if (
            !characterRange.contains(text.length) ||
            numberOfMatches > 0
        ) {
            // 提示用戶
            if let min = characterRange.min(),
               let max = characterRange.max() {
                AlertLabel.text = "請輸入 \(min) 至 \(max) 個中英文字"
            }
            
            AlertLabel.layer.opacity = 1
            return false
        }
        AlertLabel.layer.opacity = 0
        return true
    }
}

extension String {
    var length: Int {
        return self.utf16.count
    }
}
