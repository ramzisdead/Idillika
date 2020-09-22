//
//  CatalogCollectionViewCell.swift
//  Idillika
//
//  Created by Рамазан on 28.07.2020.
//  Copyright © 2020 Рамазан. All rights reserved.
//

import UIKit
import SDWebImage

class CatalogCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private var currentClose: CatalogItem!
    
    func setData(catalogItem: CatalogItem?) {
        
        currentClose = catalogItem
        
        //print(Clothes.shared.getFavorites())
        
        nameLabel.text = catalogItem?.title?.capitalized
        descriptionLabel.text = catalogItem?.brand
        priceLabel.text = String(catalogItem?.price ?? 0) + " ₽"
        if let image = catalogItem?.imageLink {
            imageView.sd_setImage(with: URL(string: image), completed: nil)
        }
        
        // Размер изображения
        let imageWidth = Double(self.frame.width)
        let imageHeight = imageWidth * 1.26
        imageView.frame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        
        
        // Проверка ЮсерДефаултс
        if Clothes.shared.isFavorite(item: catalogItem) {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    //
    @IBAction func addToFavoriteButton(_ sender: Any) {
        let _ = Clothes.shared.checkFavoriteOnClick(item: currentClose)
        if Clothes.shared.isFavorite(item: currentClose) {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}
