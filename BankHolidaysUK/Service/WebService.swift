//
//  WebService.swift
//  BankHolidaysUK
//
//  Created by Silas Hayri on 27.05.2023.
//

import Foundation

class WebService{
    
    func fetchData(url : URL, completion: @escaping ([Holidays]?)->()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error=error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                let holidaysArray   = try? JSONDecoder().decode([Holidays].self, from: data)
                if let holidaysArray = holidaysArray{
                    completion(holidaysArray)
                }
                
                
            }
            
            
        }.resume()
        
    }
    
}
