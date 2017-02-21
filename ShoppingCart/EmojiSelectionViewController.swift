//
//  EmojiSelectionViewController.swift
//  ShoppingCart
//
//  Created by Jim Campagno on 8/10/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class EmojiSelectionViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var instructions: UILabel!
    
    var emojiDelegate: EmojiCreation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.22, green:0.33, blue:0.58, alpha:1.00)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        print("Button went and got hisself pressed")
        guard let leftEmoji = text1.text,
            let rightEmoji = text2.text else {
                print("Didn't do nothin'")
                return
        }
        print("Bout to go ahead and get me some emojis")
        let pairOEmojis = (leftEmoji, rightEmoji)
        emojiDelegate?.create(emojiGroup: pairOEmojis)
        
        dismiss(animated: true, completion: nil)
    }
}
