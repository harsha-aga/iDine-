//
//  APIJsonDecoder.swift
//  iDine
//
//  Created by Harsha Agarwal on 31/10/23.
//

import UIKit

extension Bundle {
    func decode<T: Decodable>(type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("couldn't locate file in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("couldnt locate URL in Bundle")
        }

        let decoder = JSONDecoder()
        guard let loader = try? decoder.decode(T.self, from: data) else {
            fatalError("couldnt locate URL in Bundle")
        }
        return loader
    }
}
