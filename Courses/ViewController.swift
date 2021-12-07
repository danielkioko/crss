//
//  ViewController.swift
//  Courses
//
//  Created by Andrickson Coste on 12/7/21.
//

import UIKit

struct Course {
    var image: String
    var title: String
    var author: String
}

class CVCell: UICollectionViewCell {
    
    @IBOutlet var cView: UIView!
    @IBOutlet var cImage: UIImageView!
    @IBOutlet var cTitle: UILabel!
    @IBOutlet var cAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cView.layer.cornerRadius = 12
        cImage.layer.cornerRadius = 12
    }
    
}

class ViewController: UIViewController {
    
    let cv_cellIdentifier = "CVCell"
    
    let cv_courses:[Course] = [
        Course(image: "img1", title: "Gliding 101", author: "Laurent Reiffsteck"),
        Course(image: "img1", title: "Gliding 101", author: "Laurent Reiffsteck"),
        Course(image: "img1", title: "Gliding 101", author: "Laurent Reiffsteck"),
        Course(image: "img1", title: "Gliding 101", author: "Laurent Reiffsteck"),
        Course(image: "img1", title: "Gliding 101", author: "Laurent Reiffsteck"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cv_courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cv_cellIdentifier, for: indexPath) as! CVCell
        cell.cImage.image = UIImage(named: self.cv_courses[indexPath.row].image)
        cell.cTitle.text = self.cv_courses[indexPath.row].title
        cell.cAuthor.text = self.cv_courses[indexPath.row].author
        return cell
    }
    
}

