
import Foundation

public class GetTitleManagerForTest {

    
    func getTitle(completion: ((_ title: String?) -> Void)?) {
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
                completion?(nil)
                return
            }
            
            if (response as! HTTPURLResponse).statusCode != 200 {
                print("Status code != 200, Statuse code is \((response as! HTTPURLResponse).statusCode) ")
                completion?(nil)
                return
            }
            
            guard let data else {
                print("Data = nil")
                completion?(nil)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    if let title = json[5]["title"] as? String {
                        print(title)
                        completion?(title)
                    }
                }
            } catch {
                print(error)
                completion?(nil)
            }
        }
        
        task.resume()
    }
}
