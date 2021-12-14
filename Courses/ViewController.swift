//
//  ViewController.swift
//  Courses
//
//  Created by Andrickson Coste on 12/7/21.
//

import UIKit
import Firebase
import FirebaseDatabase

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
    
    /**
     
     Create a function to upload to "courses" in FB
     
     - imageURL, title, author, content(nil/not mandatory)
     
     Temporary function & button, Hardcode data to upload to firebase
     
     Create the function to get the data & populate collectionView and tableView
     
     
     
     
     */
    
    @IBAction func UploadButton(_ sender: UIButton) {
        uploadToDB()
    }
    
    
    @IBAction func fetchData(_ sender: UIButton) {
        let storageRef = Storage.storage().reference(withPath: "Images/8C3DCC28-0F34-4C6B-BD58-59AFB07D3510.jpg")
        storageRef.getData(maxSize: 4 * 1024 * 1024) { data, error in
            if let error = error {
                print("there's an error\(error.localizedDescription)")
                return
            }
            if let data = data{
                
            }
        }
    }
    
    func uploadToDB() {
        var ref:DatabaseReference = Database.database().reference()

        let course:[String:Any] = [
            "imgURL": "string here",
            "title": "string here",
            "author": "string here"
        ]
        
        let keyValue:String = ref.child("courses").childByAutoId().key!
        
        ref.child("courses").child(keyValue).setValue(course)
        
        let randomID = UUID.init().uuidString
        let uploadRef = Storage.storage().reference(withPath: "Images/\(randomID).jpg")
        let imageData = UIImage(named: "img1")!.jpegData(compressionQuality: 0.75)
        let uploadMetadata = StorageMetadata.init()
        uploadMetadata.contentType = "image/jpeg"

        uploadRef.putData(imageData!, metadata: uploadMetadata) {(downloadMetadata, error) in
            if let error = error{
                print("error\(error.localizedDescription)")
                return
            }
            print("Put is complete and i got this back: \(String(describing: downloadMetadata))")
        }
    }
    
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
