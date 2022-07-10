//
//  File.swift
//  
//
//  Created by Hadi Sharghi on 7/11/22.
//

import Foundation
import SwiftSoup


class MoviePost {
    
    init(element: SwiftSoup.Element) throws {
        let anchor = try element.select("div#post-title").first()?.select("a").first()
            

        title = try anchor?.attr("title").replacingOccurrences(of: "دانلود فیلم", with: "").trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        link = try anchor?.attr("href") ?? ""
        let metaData = try element.select("p")[2].text()
        let regex = try! NSRegularExpression(pattern: "(\\w+)(:\\s*\\d+)*")
        let matches = regex.findMatches(in: metaData)
        if let formatIndex = matches.firstIndex(where: {$0 == "فرمت"})?.advanced(by: 1) {
            let formatString = matches[formatIndex].lowercased()
            format = VideoFormat.init(rawValue: formatString) ?? .none
        } else {
            format = .none
        }
        poster = try element.select("img#myimg").attr("src")
    }
    
    var title: String
    var link: String
    var format: VideoFormat
    var poster: String
}

enum VideoFormat: String {
    case mkv = "mkv"
    case mp4 = "mp4"
    case none = ""
}
