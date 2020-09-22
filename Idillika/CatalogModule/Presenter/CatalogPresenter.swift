//
//  CatalogPresenter.swift
//  Idillika
//
//  Created by Рамазан on 28.07.2020.
//  Copyright © 2020 Рамазан. All rights reserved.
//

import Foundation


//MARK: - protocols

protocol CatalogViewProtocol: class { // Спросить почему наследуют именно классы
    func success()
    func failure(error: Error)
    func showLoading()
    func hideLoading()
}

protocol CatalogPresenterProtocol: class {
    init(view: CatalogViewProtocol, networkService: NetworkServiceProtocol)
    func getCatalog()
    var catalogItems: [CatalogItem]? {get set}
}


//MARK: - classes

class CatalogPresenter: CatalogPresenterProtocol {
    required init(view: CatalogViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getCatalog()
    }
    
    weak var view: CatalogViewProtocol?
    var networkService: NetworkServiceProtocol
    var catalogItems: [CatalogItem]?
    
    func getCatalog() {
        view?.showLoading()
        networkService.getCatalog { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let catalogItem):
                    self.catalogItems = catalogItem
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
                self.view?.hideLoading()
            }
        }
    }
}
