//
//  NewsModel.swift
//  DioNews
//
//  Created by Gilvan Wemerson on 08/09/23.
//

import Foundation

struct NewsModel: Codable {
    var source: SourceModel
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: Date
    var content: String?
}

