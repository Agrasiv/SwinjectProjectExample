//
//  WebService.swift
//  SwinjectProjectExample
//
//  Created by Pyae Phyo Oo on 9/9/2567 BE.
//

import Foundation
import Moya
import Alamofire

enum WebServiceError: Error {
    /**
     Error from backend
     */
    case api(code: Int, messages: [String], customData: [String: Any]?, mappingKey: String?)
    /**
     Error from Firebase
     */
    case firebase(code: Int, message: String)
    /**
     Error from Moya
     */
    case moya(error: MoyaError)
    /**
     Error from mapping JSON to object
     */
    case mapping
}

protocol WebServiceType {
    associatedtype Provider
    
    func requestJSON(path: Provider, completion: @escaping (Result<Any, Error>) -> Void)
    func requestObject<T: Decodable>(path: Provider, completion: @escaping (Result<T, Error>) -> Void)
    func requestCollection<T: Decodable>(path: Provider, completion: @escaping (Result<[T], Error>) -> Void)
}

struct WebService<U: TargetType>: WebServiceType {
    private var provider: MoyaProvider<U>
    
    init(provider: MoyaProvider<U> = MoyaProvider<U>(
        session: DefaultAlamofireManager.getSession(timeout: 5.0),
        plugins: [
            NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
        ]
    )) {
        self.provider = provider
    }
    
    mutating func setTimeout(timeout: Double) {
        provider = MoyaProvider<U>(
            session: DefaultAlamofireManager.getSession(timeout: timeout),
            plugins: [
                NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
            ]
        )
    }
    
    func requestJSON(path: U, completion: @escaping (Result<Any, Error>) -> Void) {
        provider.request(path) { result in
            switch result {
            case .success(let response):
                do {
                    let json = try response.mapJSON()
                    completion(.success(json))
                } catch {
                    completion(.failure(WebServiceError.mapping))
                }
            case .failure(let error):
                completion(.failure(WebServiceError.moya(error: error)))
            }
        }
    }

    func requestObject<T: Decodable>(path: U, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(path) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(T.self, from: response.data)
                    completion(.success(object))
                } catch {
                    print("Decoding error: \(error)")
                    completion(.failure(WebServiceError.mapping))
                }
            case .failure(let error):
                completion(.failure(WebServiceError.moya(error: error)))
            }
        }
    }


    func requestCollection<T: Decodable>(path: U, completion: @escaping (Result<[T], Error>) -> Void) {
        provider.request(path) { result in
            switch result {
            case .success(let response):
                do {
                    let collection = try JSONDecoder().decode([T].self, from: response.data)
                    completion(.success(collection))
                } catch {
                    completion(.failure(WebServiceError.mapping))
                }
            case .failure(let error):
                completion(.failure(WebServiceError.moya(error: error)))
            }
        }
    }
    
}


