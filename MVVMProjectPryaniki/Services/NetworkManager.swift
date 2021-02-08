//
//  NetworkManager.swift
//  MVVMProjectPryaniki
//
//  Created by Никита Гвоздиков on 05.02.2021.
//

import Foundation


class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    let dataModelUrl = "https://pryaniky.com/static/json/sample.json"

    func fetchData(with complition: @escaping (DataModel) -> Void) {

        guard let url = URL(string: dataModelUrl) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }

            do {
                let dataModel = try JSONDecoder().decode(DataModel.self, from: data)
                DispatchQueue.main.async {
                    complition(dataModel)
                }

            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
        }.resume()
    }
}



//var dannye: DataModel = DataModel(data: [Datum(name: "hz", data: DataClass(text: "KLKL", url: nil, selectedId: nil, variants: nil)), Datum(name: "selector", data: DataClass(text: "aaaaaaa", url: nil, selectedId: 2, variants: [Variant(id: 1, text: "one"), Variant(id: 2, text: "dva"), Variant(id: 3, text: "tri"), Variant(id: 4, text: "chetyri")])), Datum(name: "picture", data: DataClass(text: "kartinka", url: "https://bipbap.ru/wp-content/uploads/2017/08/0-70.jpg", selectedId: nil, variants: nil))], view: ["hz", "selector", "picture", "hz", "hz", "selector", "picture", "hz"])




