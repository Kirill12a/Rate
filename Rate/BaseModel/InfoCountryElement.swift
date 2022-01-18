//
//  InfoCountryElement.swift
//  Rate
//
//  Created by Kirill Drozdov on 14.01.2022.
//

import Foundation

// MARK: - InfoCountryElement
struct InfoCountryElement: Decodable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let region: String
}

enum Region: String, Decodable {
    case africa = "Africa"
    case americas = "Americas"
    case asia = "Asia"
    case empty = ""
    case europe = "Europe"
    case oceania = "Oceania"
    case polar = "Polar"
}

