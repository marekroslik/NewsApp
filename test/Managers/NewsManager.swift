//
//  NewsManager.swift
//  NewsApp
//
//  Created by Marek Roslik on 4.02.22.
//

import Foundation

class NewsManager {
    
    func getNews() async throws -> ResponseBody{
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=61f62a576a92462caf3f26e3a692bb73") else { fatalError("Missing API URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Date error")}
        
        let decodedData =  try JSONDecoder().decode(ResponseBody.self, from: data)
        return decodedData
    }
}


struct ResponseBody: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    struct Article: Decodable {
        let id = UUID()
        let source: Sourse
        let author: String
        let title: String
        let description: String
        let url: String
        let urlToImage: String
        let publishedAt: String
        let content: String
        
        struct Sourse: Decodable {
            let id: String
            let name: String
        }
    }
    
}


