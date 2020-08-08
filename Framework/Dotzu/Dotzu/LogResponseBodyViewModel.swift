//
//  LogResponseBodyViewModel.swift
//  exampleWindow
//
//  Created by Remi Robert on 29/01/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

class LogResponseBodyViewModel {

    private let data: Data

    var format: String? {
        do {
            let json = try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
            let pretty = try JSONSerialization.data(withJSONObject: json,   options: .prettyPrinted)
            let prettyString = String(data: pretty, encoding: .utf8)
            return prettyString?.replacingOccurrences(of: "\\/", with: "/")
        } catch {
            return String(data: data as Data, encoding: .utf8)
        }
    }

    init(data: Data) {
        self.data = data
    }
}
