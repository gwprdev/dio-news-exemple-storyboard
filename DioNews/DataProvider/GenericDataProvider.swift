//
//  GenericDataProvider.swift
//  DioNews
//
//  Created by Gilvan Wemerson on 10/09/23.
//

import Foundation

protocol GenericDataProvider {
    func success(model: Any)
    func errorData(_ provide: GenericDataProvider?, error: Error)
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
