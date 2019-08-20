//
//  VotingViewController.swift
//  Poker Pointer
//
//  Created by IMCS2 on 3/6/19.
//  Copyright © 2019 123 Apps Studio LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class VotingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    var name: [String] = []
    var datafromSession:String = ""
    var datafromJoin:String = ""

    
    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!
    var sendingValue = [String]()
    var keyArray:[String] = []
    let pointImages: [UIImage] = [UIImage(named: "QuestionMark") as! UIImage, UIImage(named: "Coffee") as! UIImage, UIImage(named: "One") as! UIImage, UIImage(named: "Two") as! UIImage, UIImage(named: "Three") as! UIImage, UIImage(named: "Five") as! UIImage, UIImage(named: "Eight") as! UIImage, UIImage(named: "Thirteen") as! UIImage, UIImage(named: "TwentyOne") as! UIImage, UIImage(named: "ThirtyFour") as! UIImage, UIImage(named: "FiftyFive") as! UIImage, UIImage(named: "EightyNine") as! UIImage]
    let array = ["?","coffee","1","2","3", "5","8","13","21","34","55", "89"]
    
    @IBOutlet weak var VotingTableViewOutlet: UITableView!
    @IBOutlet weak var VotingCollectionViewOutlet: UICollectionView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sendingValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? joinTableViewCell
        print(datafromSession)
        cell?.leftLabel?.text = sendingValue[indexPath.row]
        DispatchQueue.main.async {
            if self.name.isEmpty{
                print("nil")
            }else{
                cell?.rightLabel?.text = self.name[indexPath.row]
                tableView.reloadData()
            }
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pointImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PointCell", for: indexPath) as! PointCollectionViewCell
        cell.PointImageview.image = pointImages[indexPath.row]
        print(pointImages)
        return cell
    }
    
    @IBOutlet weak var NavigationTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDataFromFirebase()
        setTitle()
        connectTableView()
        connectCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func connectTableView(){
        self.VotingTableViewOutlet.register(UINib(nibName: "AttendeeTableViewCell", bundle: nil), forCellReuseIdentifier: "AttendeeCell")
    }
    
    func connectCollectionView(){
        self.VotingCollectionViewOutlet.register(UINib(nibName: "PointCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PointCell")
    }
    
    func setTitle(){
        NavigationTitle.title = String(s.getSessionKey())
    }
    
    //select that cell which the row is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        name = [array[indexPath.row]]
        print(name)
        ref = Database.database().reference().child(key!)
        ref.childByAutoId().child("key").setValue(name)
        tableView.reloadData()
    }
    func fetchDataFromFirebase(){
        //accessing value=
        if datafromSession.isEmpty !=  true{
            ref = Database.database().reference().child(datafromSession)
        }else{
            ref = Database.database().reference().child(datafromJoin)
        }
        // ref.child("names")
        ref.observe(.value){(snapshot: DataSnapshot) in
            self.sendingValue.removeAll()
            for nameValue in snapshot.children{
                let snapshotContent = nameValue as? DataSnapshot
                let namedata = snapshotContent?.value as? NSDictionary
                self.sendingValue.append(namedata?.value(forKey: "name") as! String)
                self.tableView.reloadData()
            }
        }
    }
    @IBOutlet weak var labelText: UILabel!
    
    
    
}
