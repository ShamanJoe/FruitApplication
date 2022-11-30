//
//  GroupingPageVC.swift
//  PG5601_eksamen
//
//  Created by jonathan solheim on 28/11/2022.
//

import UIKit

class GroupingPageVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var fruitList = [Fruit]()

    var screenSize: CGRect!
       var screenWidth: CGFloat!
       var screenHeight: CGFloat!
    
    var nameArr = [""]
    var familyArr = [String]()
    var genusArr = [String]()
    var orderArr = [String]()
    
    private var collectionView: UICollectionView?
    var sections = [Section]()
    
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
        collectionView.register(GroupingCell.self, forCellWithReuseIdentifier: GroupingCell.identifier)
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)


        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.frame = CGRect(x: 5, y: 5, width: view.frame.size.width - 5, height: view.frame.size.height)
        view.addSubview(collectionView)
       
        
        let anonFunction = { (fetchedFruitList:[Fruit]) in
            DispatchQueue.main.sync{
                self.fruitList = fetchedFruitList
                
                for fruit in self.fruitList {
                    
                    if !self.familyArr.contains(fruit.family){
                        self.familyArr.append(fruit.family)
                    }
                    
                    if !self.genusArr.contains(fruit.genus){
                        self.genusArr.append(fruit.genus)
                    }
                    
                    if !self.orderArr.contains(fruit.order){
                        self.orderArr.append(fruit.order)
                    }
                    

                    self.collectionView?.reloadData()
                }
                
                
                self.sections.append(Section(sectionName: "Families", rowData: self.familyArr))
                self.sections.append(Section(sectionName: "Genus", rowData: self.genusArr))
                self.sections.append(Section(sectionName: "Orders", rowData: self.orderArr))
                

                
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupingCell.identifier, for: indexPath)
        let fruit = sections[indexPath.section].rowData[indexPath.row]
        let family = sections[indexPath.section]
        cell.contentView.layer.masksToBounds = false
        cell.contentView.layer.cornerRadius = 5
        
        
        if family.sectionName == "Families"{
            cell.backgroundColor = UIColor.systemPink
        }
        
        if family.sectionName == "Genus"{
            cell.backgroundColor = UIColor.yellow
        }
        
        if family.sectionName == "Orders"{
            cell.backgroundColor = UIColor.green
        }

        
        guard let collectionViewCell = cell as? GroupingCell else{
            return cell
        }
        collectionViewCell.familyLabel.text = fruit

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FruityListVC()
        let fruit = sections[indexPath.section].rowData[indexPath.row]
        vc.filter = fruit
        navigationController?.pushViewController(vc, animated: true)
        
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
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        }
}


struct Section: Codable {
    var sectionName : String
    var rowData = [String]()
}
