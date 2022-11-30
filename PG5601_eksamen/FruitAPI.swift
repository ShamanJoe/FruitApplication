import Foundation

final class FruitAPI{
    
    static let shared = FruitAPI()
    
    func fetchFruitlist( onCompletion: @escaping ([Fruit]) -> ()){
        let urlString = "https://fruityvice.com/api/fruit/all"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url){ (data, resp, error) in
            
            guard let data = data else {
                print("data is nil")
                return
            }
            
            print(data)
            
            guard let Fruit = try? JSONDecoder().decode([Fruit].self, from: data) else {
                print("could not decode JSON")
                return
            }
            
            print(Fruit)
            
            onCompletion(Fruit)
        }
        
        task.resume()
    }
}

/*struct FruitList: Codable{
    let fruit: [Fruit]
}*/
struct Fruit: Codable{
    let genus: String
    let name: String
    let id: Int
    let family: String
    let order: String
    let nutritions: Nutritions
}

struct Nutritions: Codable{
    let carbohydrates: Double
    let protein: Double
    let fat: Double
    let calories: Double
    let sugar:Double
}
