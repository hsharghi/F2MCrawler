import SwiftSoup
import Foundation

class F2MCrawler {
    var siteURL="https://www.f2m.site"
    var api: RequestProvider
    
    init() {
        api = ApiRequest()
    }
    
    func getPageURL(page: Int = 1) -> String {
        return siteURL + "/page/\(page)"
    }
    
    func getPageHTMLDocument(page: Int = 1) -> SwiftSoup.Document? {
        guard let url = URL(string: getPageURL(page: page)) else { return nil }
                
        
        do {
            let htmlString = try String(contentsOf: url, encoding: .utf8)
            return try SwiftSoup.parse(htmlString)
        } catch let error {
            print("Error getting page contents: \(error)")
            return nil
        }
    }
    
    func getPostsDocument(page: Int = 1) -> SwiftSoup.Elements? {
        guard let doc = getPageHTMLDocument(page: page) else { return nil }
        do {
            return try doc.select("div.post")
        } catch let error {
            print("Error getting posts block: \(error)")
            return nil
        }
    }
    
    
}
