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

class TVCell: UITableViewCell {

    @IBOutlet var tView: UIView!
    @IBOutlet var tImage: UIImageView!
    @IBOutlet var tTitle: UILabel!
    @IBOutlet var tAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        tView.layer.cornerRadius = 12
        tImage.layer.cornerRadius = 12
        tView.layer.borderWidth = 1.5
        tView.layer.borderColor = UIColor.systemGray.cgColor
    }
    
}

class ViewController: UIViewController {
    
    let cv_cellIdentifier = "CVCell"
    let tv_cellIdentifier = "TVCell"
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    let cv_courses:[Course] = [
        Course(image: "img1", title: "Gliding 101", author: "Laurent Reiffsteck"),
        Course(image: "img1", title: "Gliding 101", author: "Laurent Reiffsteck"),
        Course(image: "img1", title: "Gliding 101", author: "Laurent Reiffsteck"),
        Course(image: "img1", title: "Gliding 101", author: "Laurent Reiffsteck"),
        Course(image: "img1", title: "Gliding 101", author: "Laurent Reiffsteck")
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.cv_courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tv_cellIdentifier) as! TVCell
        cell.tImage.image = UIImage(named: self.cv_courses[indexPath.row].image)
        cell.tTitle.text = self.cv_courses[indexPath.row].title
        cell.tAuthor.text = self.cv_courses[indexPath.row].author
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103
    }
    
}
