//
//  NetworkService.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 03/06/2021.
//

import Foundation

class NetworkService {
    // 1.
    class func request<T: Codable>(router: Router, completion: @escaping (Result<[T], Error>) -> ()) {
        // 2.
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        // 3.
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        // 4.
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            // 5.
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }
            guard response != nil, let data = data else {
                return
            }
            // 6.
            let responseObject = try! JSONDecoder().decode([T].self, from: data)
            // 7.
            DispatchQueue.main.async {
                // 8.
                completion(.success(responseObject))
            }
        }
        dataTask.resume()
    }
}
