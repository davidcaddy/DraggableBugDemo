//
//  TransferableType.swift
//  DropTest
//
//  Created by David Caddy on 17/6/2024.
//

import Foundation
import UniformTypeIdentifiers
import CoreTransferable

extension UTType {
    static let itemType1 = UTType(exportedAs: "com.droptest.typeone")
    static let itemType2 = UTType(exportedAs: "com.droptest.typetwo")
    static let itemType3 = UTType(exportedAs: "com.droptest.typethree")
}

struct ItemType1: Codable, Transferable {
    var id: String
    
    public static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .itemType1)
    }
}

struct ItemType2: Codable, Transferable {
    var id: String
    
    public static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .itemType2)
    }
}

struct ItemType3: Codable, Transferable {
    var id: String
    
    public static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .itemType3)
    }
}
