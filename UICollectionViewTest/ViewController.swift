//
//  ViewController.swift
//  UICollectionViewTest
//
//  Created by haruto.makino on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let models = ["apple", "orange", "banana", "melon", "lemon" ,"apple", "orange", "banana", "melon", "lemon", "apple", "orange", "banana", "melon", "lemon"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func reloadButton(){
        let indexes = collectionView.indexPathsForVisibleItems
        collectionView.reloadItems(at: indexes)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        

        

    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CollectionViewCell
        
        cell.updateConstraints()
        
        cell.button.setTitle("\(models[indexPath.row])", for: .normal)
        cell.backgroundColor = .red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }
    
}
