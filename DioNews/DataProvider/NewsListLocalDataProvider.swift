//
//  NewsListLocalDataProvider.swift
//  DioNews
//
//  Created by Gilvan Wemerson on 10/09/23.
//

import Foundation

protocol NewsListLocalDataProviderProtocol: GenericDataProvider{}

class NewsListLocalDataProvider: DataProviderManager<NewsListLocalDataProviderProtocol, NewsModel> {
    
    func getNewsList(){
        NewsListRepository.shared.getNewList{
            newModelList, error in
            if let error = error {
                self.delegate?.errorData(self.delegate, error: error)
                return
            }
            
            if let model = newModelList {
                self.delegate?.success(model: model)
            }
        }
    }

}
