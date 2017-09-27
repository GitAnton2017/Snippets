
enum SnippetType: String
{
    case text = "Text"
    case photo = "Photo"
}

class SnippetData
{
    let type: SnippetType
    init(type: SnippetType)
    {
     self.type = type
     print ("New Snippet of type \(type.rawValue) Created!")
    }
}

class TextData : SnippetData
{
    let text: String
    init (text: String)
    {
     self.text = text
     super.init(type: .text)
     print ("New Text Snippet with text \(text) Created!")
        
    }
}


