//
//  ViewController.swift
//  Snippets
//
//  Created by Anton2016 on 27.09.17.
//  Copyright © 2017 Anton2016. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var data : [SnippetData] = []
    
    @IBAction func createNewSnippet(_ sender: Any)
    {
        let alert = UIAlertController(title: "Select Snippet Type", message: nil, preferredStyle: .alert)
        
        let textAction = UIAlertAction(title: "TEXT", style: .default)
        {
          _ in
            guard let textEntryVC = self.storyboard?.instantiateViewController(withIdentifier: "textSnippetEntry") as? TextSnippetEntryViewController
            else
            {
             return
            }
            textEntryVC.textSaver = {(text: String) in self.data.append(TextData(text: text))}
            textEntryVC.modalTransitionStyle = .coverVertical
            
            self.present(textEntryVC, animated: true, completion: nil)
        }
        
        let photoAction = UIAlertAction(title: "PHOTO", style: .default)
        {
            _ in self.data.append(SnippetData(type: .photo))
        }
        
        let cancelAction = UIAlertAction(title: "CANCEL", style: .destructive, handler: nil)
    
        
        alert.addAction(textAction)
        alert.addAction(photoAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

