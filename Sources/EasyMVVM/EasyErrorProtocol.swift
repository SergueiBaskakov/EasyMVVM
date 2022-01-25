//
//  EasyErrorProtocol.swift
//  
//
//  Created by Serguei on 25/01/22.
//

import Foundation

public protocol EasyErrorProtocol: Error, Codable {
    
    func getErrorMessage() -> String
    
}
