//
//  HomeViewModel.swift
//  Easycom Japan PH
//
//  Created by Michael Angelo Zafra on 1/16/23.
//

import Foundation
import Combine
import UIKit

class HomeViewModel: ObservableObject {
    
    @Published var entries:[Entry] = [Entry]()
    
    init() {
    }
    
    func getEntries(completion:@escaping ([Entry]) -> ()) {
        guard let url = URL(string: "\(Constants.baseURL)/photos") else { return }
        debugPrint(url)
        var request = URLRequest(url: url)
        //      request.addValue("application/json", forHTTPHeaderField: "Accept") //for header
        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            let response = try? JSONDecoder().decode([Entry].self, from: data!)
            //          debugPrint(response)
            
            DispatchQueue.main.async {
                //          self.isLoading = false
                guard let data = response else { return completion([]) }
                completion(data)
            }
        }
        task.resume()
    }
    
    func actionSheet(url:String) {
        guard let urlShare = URL(string: url) else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}
