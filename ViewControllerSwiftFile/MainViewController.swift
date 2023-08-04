//
//  ViewController.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/04.
//

import UIKit

class MainViewController: UIViewController {
    

    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "다마고치 선택하기"
        self.setBackgroundColor()
        
        collectionViewDelegate()
        registerNib()
        configureCollectionViewlayout()
        collectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    func collectionViewDelegate() {
            collectionView.delegate = self
            collectionView.dataSource = self
        }

    func registerNib() {
        let nib = UINib(nibName: MainCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        }
    
    func configureCollectionViewlayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 140)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        layout.minimumLineSpacing = 20
        
        collectionView.collectionViewLayout = layout
    }

}



extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        
        
        
        return cell
    }
    
}
