//
//  ShoppingListViewController.swift
//  ShoppingCart
//
//  Created by Jim Campagno on 8/10/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit


protocol EmojiCreation {
    func create(emojiGroup: (String , String) )
}


class ShoppingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var emojis: [(String, String)] = []{
        didSet{
            tableView.reloadData()
            print ("Reloaded me that there tableView data")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.75, green:0.18, blue:0.27, alpha:1.00)
        tableView.backgroundColor = UIColor(red:0.85, green:0.37, blue:0.29, alpha:1.0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        print("Done went and woke m'self up")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! EmojiSelectionViewController
        destVC.emojiDelegate = self
        print ("Done gone and went up over t'yonder other view")
    }
    
}

// MARK: - UITableViewDataSource Methods
extension ShoppingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiCellTableViewCell
        let currentEmojiLove = emojis[(indexPath as NSIndexPath).row]
        cell.firstEmojiLabel.text = currentEmojiLove.0
        cell.secondEmojiLabel.text = currentEmojiLove.1
        print ("Made me a nice lil emoji cell")
        return cell
    }
}

// MARK: - UITableViewDelegate Methods
extension ShoppingViewController: UITableViewDelegate { }

//M--> Emoji methods
extension ShoppingViewController: EmojiCreation {
    
    func create(emojiGroup: (String , String) ){
        print ("Appended me some emojis")
        emojis.append(emojiGroup)
    }
}




