//
//  DataResponse.swift
//  NasaApp
//
//  Created by Malik Em on 02.10.2022.
//

import Foundation

struct DataResponse: Decodable {
    var title: String
    var explanation: String
    var url: String
    var date: String
}

