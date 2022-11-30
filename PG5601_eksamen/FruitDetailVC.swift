//
//  FruitDetailPage.swift
//  PG5601_eksamen
//
//  Created by jonathan solheim on 20/11/2022.
//

import UIKit

class FruitDetailVC: UIViewController{
    var fruit: Fruit?
    
    let nameLabel = UILabel()
    let genusLabel = UILabel()
    let familyLabel = UILabel()
    let orderLabel = UILabel()
    let idLabel = UILabel()
    let carbLabel = UILabel()
    let proteinLabel = UILabel()
    let fatLabel = UILabel()
    let caloriesLabel = UILabel()
    let sugarLabel = UILabel()
    let dividerLabel = UILabel()
    let sugarWarningLabel = UILabel()
    let dismissButton = UIButton()
    let colorView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupdata()
        setupLabel()
        setupDismissButton()
        view.backgroundColor = .white
        colorView.layer.zPosition = -1
        
        if (fruit?.nutritions.sugar)! > 10{
            sugarWarningLabel.text = "This contains over 10 of sugar!!!"
            animatedBackground()
        }
    }
    
    func animatedBackground(){
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options:[.repeat, .autoreverse], animations: {
            self.colorView.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }, completion:{
            (completed : Bool) -> Void in
            UIView.animate(withDuration: 1.0, delay: 0.0, options:[.repeat, .autoreverse], animations: {
                self.colorView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
               }, completion:nil)
        })
       
    }

    
    func setupLabel(){
        view.addSubview(nameLabel)
        view.addSubview(genusLabel)
        view.addSubview(familyLabel)
        view.addSubview(orderLabel)
        view.addSubview(idLabel)
        view.addSubview(carbLabel)
        view.addSubview(proteinLabel)
        view.addSubview(fatLabel)
        view.addSubview(caloriesLabel)
        view.addSubview(sugarLabel)
        view.addSubview(dividerLabel)
        view.addSubview(sugarWarningLabel)
        
        view.addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        colorView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        //General infromation about selected fruit
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        
        genusLabel.translatesAutoresizingMaskIntoConstraints = false
        genusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        genusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        genusLabel.font = UIFont(name: "Verdana", size: 14)
        
        familyLabel.translatesAutoresizingMaskIntoConstraints = false
        familyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        familyLabel.topAnchor.constraint(equalTo: genusLabel.bottomAnchor).isActive = true
        familyLabel.font = UIFont(name: "Verdana", size: 14)
        
        orderLabel.translatesAutoresizingMaskIntoConstraints = false
        orderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderLabel.topAnchor.constraint(equalTo: familyLabel.bottomAnchor).isActive = true
        orderLabel.font = UIFont(name: "Verdana", size: 14)
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        idLabel.topAnchor.constraint(equalTo: orderLabel.bottomAnchor).isActive = true
        idLabel.font = UIFont(name: "Verdana", size: 14)
        
        //Nutrition information divider
        dividerLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dividerLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor).isActive = true
        dividerLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        
        //Nutrition information
        carbLabel.translatesAutoresizingMaskIntoConstraints = false
        carbLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        carbLabel.topAnchor.constraint(equalTo: dividerLabel.bottomAnchor).isActive = true
        carbLabel.font = UIFont(name: "Verdana", size: 14)
        
        proteinLabel.translatesAutoresizingMaskIntoConstraints = false
        proteinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        proteinLabel.topAnchor.constraint(equalTo: carbLabel.bottomAnchor).isActive = true
        proteinLabel.font = UIFont(name: "Verdana", size: 14)
        
        fatLabel.translatesAutoresizingMaskIntoConstraints = false
        fatLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fatLabel.topAnchor.constraint(equalTo: proteinLabel.bottomAnchor).isActive = true
        fatLabel.font = UIFont(name: "Verdana", size: 14)
        
        caloriesLabel.translatesAutoresizingMaskIntoConstraints = false
        caloriesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        caloriesLabel.topAnchor.constraint(equalTo: fatLabel.bottomAnchor).isActive = true
        caloriesLabel.font = UIFont(name: "Verdana", size: 14)
        
        sugarLabel.translatesAutoresizingMaskIntoConstraints = false
        sugarLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sugarLabel.topAnchor.constraint(equalTo: caloriesLabel.bottomAnchor).isActive = true
        sugarLabel.font = UIFont(name: "Verdana", size: 14)
        
        sugarWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        sugarWarningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sugarWarningLabel.topAnchor.constraint(equalTo: sugarLabel.bottomAnchor).isActive = true
        sugarWarningLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        
    }
    
    func setupdata(){
        if let fruit = fruit{
            nameLabel.text = fruit.name
            genusLabel.text = "Genus : \(fruit.genus)"
            familyLabel.text = "Family : \(fruit.family)"
            orderLabel.text = "Order : \(fruit.order)"
            dividerLabel.text = "Nutritional value"
            
            let id = fruit.id
            let idString = String(id)
            idLabel.text = "ID : \(idString)"
            
            let carbs = fruit.nutritions.carbohydrates
            let carbString = String(carbs)
            carbLabel.text = "Carbohydrates : \(carbString)"
            
            let protein = fruit.nutritions.protein
            let proteinString = String(protein)
            proteinLabel.text = "Proteins : \(proteinString)"
            
            let fat = fruit.nutritions.fat
            let fatString = String(fat)
            fatLabel.text = "Fat : \(fatString)"
            
            let calories = fruit.nutritions.calories
            let calorieString = String(calories)
            caloriesLabel.text = "Calories : \(calorieString)"
            
            let sugar = fruit.nutritions.sugar
            let sugarString = String(sugar)
            sugarLabel.text = "Sugar : \(sugarString)"
        }
    }
    
    func setupDismissButton(){
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        dismissButton.setTitle("Tilbake",for: .normal)
        dismissButton.setTitleColor(UIColor.black, for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
    
    @objc func dismissAction(){
        self.dismiss(animated: true)
        print("was dismissed")
    }
}
