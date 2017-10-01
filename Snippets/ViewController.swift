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
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }

    
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
            _ in
            guard UIImagePickerController.isSourceTypeAvailable(.camera)
            else
            {
             print ("Device Camera is not available!")
             return
            }
            
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .camera
            
            self.present(self.imagePicker, animated: true, completion: nil)
            
        }
        
        let cancelAction = UIAlertAction(title: "CANCEL", style: .destructive, handler: nil)
    
        
        alert.addAction(textAction)
        alert.addAction(photoAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage
        else
        {
            print("Image could not be found")
            return
        }
        
        let newPhotoSnippet = PhotoData(photo: image)
        self.data.append(newPhotoSnippet)
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
      return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .medium
        df.locale = Locale(identifier: "ru-RU")
        
        switch data[indexPath.row].type
        {
         case .text:
            cell = tableView.dequeueReusableCell(withIdentifier: "textSnippetCell", for: indexPath)
           (cell as! TextSnippetCell).label.text = (data[indexPath.row] as! TextData).text
           (cell as! TextSnippetCell).dateLabel.text = df.string(from: data[indexPath.row].dateStamp)
         case .photo:
            cell = tableView.dequeueReusableCell(withIdentifier: "photoSnippetCell", for: indexPath)
            (cell as! PhotoSnippetCell).photo.image = (data[indexPath.row] as! PhotoData).photo
            (cell as! PhotoSnippetCell).dateLabel.text = df.string(from: data[indexPath.row].dateStamp)
        }
      
      return cell
        
    }
    
    
    
}




