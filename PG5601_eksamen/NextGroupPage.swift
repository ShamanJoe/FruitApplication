//
//  NextGroupPage.swift
//  PG5601_eksamen
//
//  Created by jonathan solheim on 30/11/2022.
//

import UIKit

class NextGroupPage: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var fruitList = [Fruit]()
    var fruitList1 = [Fruit]()
    var fruitList2 = [Fruit]()
    var fruitList3 = [Fruit]()
    var fruitList4 = [Fruit]()
    
    var fruitList5 = [Fruit]()
    var fruitList6 = [Fruit]()
    var fruitList7 = [Fruit]()
    var fruitList8 = [Fruit]()
    var fruitList9 = [Fruit]()
    var fruitList10 = [Fruit]()
    var fruitList11 = [Fruit]()
    var fruitList12 = [Fruit]()
    var fruitList13 = [Fruit]()
    var fruitList14 = [Fruit]()
    var fruitList15 = [Fruit]()
    var fruitList16 = [Fruit]()
    var fruitList17 = [Fruit]()
    var fruitList18 = [Fruit]()
    var fruitList19 = [Fruit]()
    var fruitList20 = [Fruit]()
    var fruitList21 = [Fruit]()
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var filetr = ""
    
    var nameArr = [""]
    var familyArr = [String]()
    var genusArr = [String]()
    var orderArr = [String]()
    
    private var collectionView: UICollectionView?
    var sections = [GroupSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: (view.frame.size.width/2) - 12, height: (view.frame.size.height/4))
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.frame = CGRect(x: 5, y: 5, width: view.frame.size.width - 5, height: view.frame.size.height)
        view.addSubview(collectionView)
        
        
        let anonFunction = { (fetchedFruitList:[Fruit]) in
            DispatchQueue.main.sync{
                self.fruitList = fetchedFruitList
                
                for fruit in self.fruitList {
                    
                    if self.filetr == fruit.family{
                        self.title = self.filetr
                        self.fruitList1.append(fruit)
                    }else if self.filetr == fruit.genus{
                        self.title = self.filetr
                        self.fruitList1.append(fruit)
                    }else if self.filetr == fruit.order{
                        self.title = self.filetr
                        self.fruitList1.append(fruit)
                    }
                    
                    self.collectionView?.reloadData()
                }
                
                self.sections.append(GroupSection(sectionName: "", rowData: self.fruitList1))
                
                self.collectionView?.reloadData()
            }
        }
        FruitAPI.shared.fetchFruitlist(onCompletion: anonFunction)
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].rowData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        let fruit = sections[indexPath.section].rowData[indexPath.row]
        let family = sections[indexPath.section]
        cell.contentView.layer.masksToBounds = false
        cell.contentView.layer.cornerRadius = 5
        
        switch fruit.family {
        case "Rosaceae":
            cell.backgroundColor = UIColor.lightGray

        case "Myrtaceae":
            cell.backgroundColor = UIColor.red

        case "Actinidiaceae":
            cell.backgroundColor = UIColor.green

        case "Passifloraceae":
            cell.backgroundColor = UIColor.yellow

        case "Lauraceae":
            cell.backgroundColor = UIColor.cyan

        case "Musaceae":
            cell.backgroundColor = UIColor.orange

        case "Cactaceae":
            cell.backgroundColor = UIColor.systemCyan

        case "Grossulariaceae":
            cell.backgroundColor = UIColor.systemMint

        case "Malvaceae":
            cell.backgroundColor = UIColor.systemPink

        case "Moraceae":
            cell.backgroundColor = UIColor.systemTeal

        case "Vitaceae":
            cell.backgroundColor = UIColor.purple

        case "Rutaceae":
            cell.backgroundColor = UIColor.systemIndigo

        case "Ericaceae":
            cell.backgroundColor = UIColor.brown

        case "Sapindaceae":
            cell.backgroundColor = UIColor.systemGray

        case "Caricaceae":
            cell.backgroundColor = UIColor.systemGray6

        case "Bromeliaceae":
            cell.backgroundColor = UIColor.darkGray

        case "Lythraceae":
            cell.backgroundColor = UIColor.magenta

        case "Anacardiaceae":
            cell.backgroundColor = UIColor.lightGray

        case "Cucurbitaceae":
            cell.backgroundColor = UIColor.systemRed

        case "Ebenaceae":
            cell.backgroundColor = UIColor.systemGreen

        case "Solanaceae":
            cell.backgroundColor = UIColor.systemBlue
        default:
            print("howdy partner")
        }
        
        
        guard let collectionViewCell = cell as? CollectionViewCell else{
            return cell
        }
        collectionViewCell.familyLabel.text = fruit.family
        collectionViewCell.genusLabel.text = fruit.genus
        collectionViewCell.orderLabel.text = fruit.order
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FruityListVC()
        let fruit = sections[indexPath.section].rowData[indexPath.row]
        vc.filter = fruit.family
        self.present(vc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: SectionHeader.identifier)
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
        let fruit = sections[indexPath.section]
        sectionHeader.label.text = fruit.sectionName
        return sectionHeader
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width * 0.08, height: collectionView.frame.width * 0.08)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
}


struct GroupSection: Codable {
    var sectionName : String
    var rowData = [Fruit]()
}
