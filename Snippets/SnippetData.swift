import Foundation
import UIKit

enum SnippetType: String
{
    case text = "Text"
    case photo = "Photo"
}

class SnippetData
{
    let type: SnippetType
    let dateStamp: Date;
    init(type: SnippetType, dateStamp: Date)
    {
     self.type = type
     self.dateStamp = dateStamp
     print ("New Snippet of type \(type.rawValue) has been Created!")
    }
}

class TextData : SnippetData
{
    let text: String
    init (text: String)
    {
     self.text = text
     super.init(type: .text, dateStamp: Date())
     print ("New TEXT Snippet with text \(text) has been Created!")
        
    }
}

class PhotoData : SnippetData
{
    let photo: UIImage
    init (photo: UIImage)
    {
        self.photo = photo
        super.init(type: .photo, dateStamp: Date())
        print ("New PHOTO Snippet with image \(photo) has been Created!")
        
    }
}


