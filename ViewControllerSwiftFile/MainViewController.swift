//
//  ViewController.swift
//  Tamagotchi
//
//  Created by hoon on 2023/08/04.
//

import UIKit


class MainViewController: UIViewController {
    
    var tamagotchi = DetailTamagotchi()

    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "다마고치 선택하기"
        self.setBackgroundColor()
        
        collectionViewDelegate()
        registerNib()
        configureCollectionViewlayout()
        collectionView.backgroundColor = themeColor
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
        return tamagotchi.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        
        let item = tamagotchi.list[indexPath.item]
        cell.setCell(data: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: PopUpViewController.identifier) as! PopUpViewController
        
        let item = tamagotchi.list[indexPath.item]
        vc.callValue(data: item)
        
        vc.type = CharacterType(rawValue: indexPath.item)
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overFullScreen
        
        present(nav, animated: true)
    }
    
}
