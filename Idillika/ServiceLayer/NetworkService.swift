//
//  NetworkService.swift
//  Idillika
//
//  Created by Рамазан on 28.07.2020.
//  Copyright © 2020 Рамазан. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func getCatalog(completion: @escaping (Result<[CatalogItem]?, Error>) -> Void) // ЗАГУГЛИТЬ
}

// ВООБЩЕ НЕ ПОНИМАЮ ЧТО ТУТ ПРОИСХОДИТ // ЧУТЬ ЛУЧШЕ ПОНИМАЮ ЧТО ТУТ ПРОИСХОДИТ
class NetworkService: NetworkServiceProtocol {
    func getCatalog(completion: @escaping (Result<[CatalogItem]?, Error>) -> Void) {
        let urlString = "https://idillika.com/api/catalogList.php?section=21&session_id=f3e82db3d0b2bcce07eae17dd9cb46d3"
        // Вводим URL в строковую переменную
        
        guard let url = URL(string: urlString) else { // Переводим в URL
            return
        }
        
        // Стандартный URLSession - ЗАГУГЛИТЬ
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            // Обработка Error'а
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([CatalogItem].self, from: data!)
                print(obj)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
