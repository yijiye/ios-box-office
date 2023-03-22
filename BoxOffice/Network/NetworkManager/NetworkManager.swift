//
//  NetworkManager.swift
//  BoxOffice
//
//  Created by 리지, kokkilE on 2023/03/21.
//

import Foundation

struct NetworkManager: NetworkRequestable {
    private var urlRequest: URLRequest?
    var url: URL?
    
    mutating func setUrlRequest(method: RequestMethod, body: Data?) {
        guard let url = self.url else {
            print(NetworkError.invalidURL)
            return
        }
        urlRequest = .init(url: url)
        urlRequest?.httpMethod = method.description
        urlRequest?.httpBody = body
    }
    
    func request<element: Decodable>(returnType: element.Type, completion: @escaping (Result<element, NetworkError>) -> Void) {
        guard let urlRequest = self.urlRequest else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(.unknown))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.httpResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.httpStatusCode(code: httpResponse.statusCode)))
                return
            }
            
            guard let mimeType = httpResponse.mimeType, mimeType == "application/json" else {
                completion(.failure(.mimeType))
                return
            }
            
            if let data = data {
                guard let result = Decoder.parseJSON(data, returnType: returnType) else {
                    completion(.failure(.decode))
                    return
                }
                completion(.success(result))
            }
        }
        task.resume()
    }
}
