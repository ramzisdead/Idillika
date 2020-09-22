//
//  MainViewController.swift
//  Idillika
//
//  Created by Рамазан on 03.08.2020.
//  Copyright © 2020 Рамазан. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /*
    @IBAction func showCatalogButton(_ sender: Any) {
        // Засовываем в переменную файл сторибоарда
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // ЗАсосываем во вторую перменную ВьюКонтроллер по ID
        let catalogVC = storyboard.instantiateViewController(identifier: "CatalogVC")
        // Пушим новый вью контроллер
        self.navigationController?.pushViewController(catalogVC, animated: true)
        
    }
    */
    @IBAction func showCatalogButton(_ sender: Any) {
        // Засовываем в переменную файл сторибоарда
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // ЗАсосываем во вторую перменную ВьюКонтроллер по ID
        let catalogVC = storyboard.instantiateViewController(identifier: "CatalogVC")
        // Пушим новый вью контроллер
        self.navigationController?.pushViewController(catalogVC, animated: true)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black

    }
    
}
