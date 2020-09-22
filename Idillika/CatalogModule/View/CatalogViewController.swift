//
//  ViewController.swift
//  Idillika
//
//  Created by Рамазан on 28.07.2020.
//  Copyright © 2020 Рамазан. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var catalogActivityIndicator: UIActivityIndicatorView!
    
    var presenter: CatalogPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkService = NetworkService()
        presenter = CatalogPresenter(view: self, networkService: networkService)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let bagImage = UIImage(named: "bag")
        let basketButton = UIBarButtonItem(image: bagImage, style: .plain, target: self, action: #selector(goToBagFunc))
        
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.rightBarButtonItem = basketButton
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    
    
    @objc func goToBagFunc() {
        
        // Засовываем в переменную файл сторибоарда
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // ЗАсосываем во вторую перменную ВьюКонтроллер по ID
        let catalogVC = storyboard.instantiateViewController(identifier: "BagVC")
        // Пушим новый вью контроллер
        self.navigationController?.pushViewController(catalogVC, animated: true)
    }

}



//MARK: - UICollection

extension CatalogViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Возвращаем количество ячеек в collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.catalogItems?.count ?? 00 // Количество ячеек равняется количеству элементов массива презентера
    }
    
    // Возвращаем как будет выглядеть ячейка
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "catalogCell", for: indexPath) as? CatalogCollectionViewCell {
            
            itemCell.setData(catalogItem: (presenter.catalogItems?[indexPath.item]))
            
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    // Размер ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let cellWidth = ((collectionView.frame.width / 2) - (flowLayout.sectionInset.left + flowLayout.sectionInset.right) - flowLayout.minimumInteritemSpacing)
            
        return CGSize(width: cellWidth, height: cellWidth * 1.8)
    }
    
    // Действие при нажатии на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}


//MARK: - Protocols

extension CatalogViewController: CatalogViewProtocol {
    func showLoading() {
        catalogActivityIndicator.startAnimating()
        catalogActivityIndicator.isHidden = false
    }
    
    func hideLoading() {
        catalogActivityIndicator.stopAnimating()
        catalogActivityIndicator.isHidden = true
    }
    
    func success() {
        collectionView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

