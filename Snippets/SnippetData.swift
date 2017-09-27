


struct SnippetData
{
    let type: SnippetType
    init(type: SnippetType)
    {
     self.type = type
     print ("New Snippet of type \(type.rawValue) Created!")
    }
}

enum SnippetType: String
{
    case text = "Text"
    case photo = "Photo"
}
