//
//  VotingViewController.swift
//  Poker Pointer
//
//  Created by IMCS2 on 3/6/19.
//  Copyright © 2019 123 Apps Studio LLC. All rights reserved.
//

import UIKit

class VotingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    let pointImages: [UIImage] = [UIImage(named: "QuestionMark") as! UIImage, UIImage(named: "Coffee") as! UIImage, UIImage(named: "One") as! UIImage, UIImage(named: "Two") as! UIImage, UIImage(named: "Three") as! UIImage, UIImage(named: "Five") as! UIImage, UIImage(named: "Eight") as! UIImage, UIImage(named: "Thirteen") as! UIImage, UIImage(named: "TwentyOne") as! UIImage, UIImage(named: "ThirtyFour") as! UIImage, UIImage(named: "FiftyFive") as! UIImage, UIImage(named: "EightyNine") as! UIImage]
    
    @IBOutlet weak var VotingTableViewOutlet: UITableView!
    @IBOutlet weak var VotingCollectionViewOutlet: UICollectionView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttendeeCell", for: indexPath) as! AttendeeTableViewCell
        cell.AttendeePointImageview.image = UIImage(named: "QuestionMark") as? UIImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pointImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PointCell", for: indexPath) as! PointCollectionViewCell
        cell.PointImageview.image = pointImages[indexPath.row]
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }

    @IBOutlet weak var NavigationTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
