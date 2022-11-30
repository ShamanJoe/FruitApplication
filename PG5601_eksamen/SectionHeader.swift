import UIKit


class SectionHeader: UICollectionReusableView {
    
    static let identifier = "header"
    
     var label: UILabel = {
         let label: UILabel = UILabel()
         label.textColor = .black
         label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
         label.sizeToFit()
         return label
     }()

     override init(frame: CGRect) {
         super.init(frame: frame)

         label.frame = CGRect(x: 0, y: 0, width: 120, height: 20)
         addSubview(label)

         label.translatesAutoresizingMaskIntoConstraints = false
         label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
         label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
         label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

