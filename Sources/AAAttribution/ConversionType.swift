//
//  ConversionType.swift
//  
//
//  Created by Andrew Farquharson on 13/11/23.
//

import Foundation

public enum ConversionType: String {
    case download = "Download"
    case redownload = "Redownload"
}

// MARK: - Codable

extension ConversionType: Codable { }

// MARK: - Equatable

extension ConversionType: Equatable { }
