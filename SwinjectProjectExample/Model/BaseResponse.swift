//
//  BaseResponse.swift
//  SwinjectProjectExample
//
//  Created by Pyae Phyo Oo on 9/9/2567 BE.
//

import Foundation

class BaseResponse<T: Decodable>: Decodable {
    
    let status: String
    let message: String?
    let data: T?
}
