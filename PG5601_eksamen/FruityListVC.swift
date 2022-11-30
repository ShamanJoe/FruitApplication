import UIKit

class FruityListVC: UIViewController{
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var fruitList = [Fruit]()
    var fruitsFilterList = [Fruit]()
    let tabBarVC = UITabBarController()

    var filter = "..."
    
    override func viewDidLoad() {
        safeArea = view.layoutMarginsGuide
        setupView()
 
        let anonFunction = { (fetchedFruitList:[Fruit]) in
            DispatchQueue.main.sync{
                self.fruitList = fetchedFruitList
                
             
             
                for i in self.fruitList.indices{
                 let fruit = self.fruitList[i]
                    print(self.filter)
                    if fruit.family == self.filter{
                        self.title = self.filter
                     self.fruitsFilterList.append(fruit)
                    }else if fruit.genus == self.filter{
                        self.title = self.filter
                     self.fruitsFilterList.append(fruit)
                    }else if fruit.order == self.filter {
                        self.title = self.filter
                     self.fruitsFilterList.append(fruit)
                    }else if self.filter == "..." {
                     self.fruitsFilterList.append(fruit)
                 }else{
                     print("=====")
                 }
             }
                self.tableView.reloadData()
            }
        }
        FruitAPI.shared.fetchFruitlist(onCompletion: anonFunction)
        
        
        
        
        
    }

    
    
    
    func setupView(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self 
        tableView.register(FruitCell.self, forCellReuseIdentifier: "cellid")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
}



extension FruityListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsFilterList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let fruit = fruitsFilterList[indexPath.row]
        fruitsFilterList.sort(by: { $0.id < $1.id })
        guard let fruitCell = cell as? FruitCell else{
            return cell
            
        }
        if self.filter != "..."{
            fruitCell.familyLabel.isHidden = true
        }
        fruitCell.nameLabel.text = fruit.name
        fruitCell.familyLabel.text = fruit.family
        
        fruitCell.imageIV.layer.cornerRadius = 5
        switch fruit.family {
        case "Rosaceae":
            fruitCell.imageIV.backgroundColor = UIColor.lightGray
            
        case "Myrtaceae":
            fruitCell.imageIV.backgroundColor = UIColor.red
            
        case "Actinidiaceae":
            fruitCell.imageIV.backgroundColor = UIColor.green
            
        case "Passifloraceae":
            fruitCell.imageIV.backgroundColor = UIColor.yellow
            
        case "Lauraceae":
            fruitCell.imageIV.backgroundColor = UIColor.cyan
            
        case "Musaceae":
            fruitCell.imageIV.backgroundColor = UIColor.orange
            
        case "Cactaceae":
            fruitCell.imageIV.backgroundColor = UIColor.systemCyan
            
        case "Grossulariaceae":
            fruitCell.imageIV.backgroundColor = UIColor.systemMint
            
        case "Malvaceae":
            fruitCell.imageIV.backgroundColor = UIColor.systemPink
            
        case "Moraceae":
            fruitCell.imageIV.backgroundColor = UIColor.systemTeal
            
        case "Vitaceae":
            fruitCell.imageIV.backgroundColor = UIColor.purple
            
        case "Rutaceae":
            fruitCell.imageIV.backgroundColor = UIColor.systemIndigo
            
        case "Ericaceae":
            fruitCell.imageIV.backgroundColor = UIColor.brown
            
        case "Sapindaceae":
            fruitCell.imageIV.backgroundColor = UIColor.systemGray
            
        case "Caricaceae":
            fruitCell.imageIV.backgroundColor = UIColor.systemYellow
            
        case "Bromeliaceae":
            fruitCell.imageIV.backgroundColor = UIColor.darkGray
            
        case "Lythraceae":
            fruitCell.imageIV.backgroundColor = UIColor.magenta
            
        case "Anacardiaceae":
            fruitCell.imageIV.backgroundColor = UIColor.lightGray
            
        case "Cucurbitaceae":
            fruitCell.imageIV.backgroundColor = UIColor.systemRed
            
        case "Ebenaceae":
            fruitCell.imageIV.backgroundColor = UIColor.systemGreen
            
        case "Solanaceae":
            fruitCell.imageIV.backgroundColor = UIColor.black
        default:
            print("howdy partner")
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight:CGFloat = CGFloat()

            cellHeight = 60
        
        return cellHeight
    }
    
    
    
}
extension FruityListVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fruit = self.fruitsFilterList[indexPath.row]
        print(fruitList)
        let fruitDetailVC = FruitDetailVC()
        fruitDetailVC.fruit = fruit
        self.present(fruitDetailVC, animated: true)
    }
}
