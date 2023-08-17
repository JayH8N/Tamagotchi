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
        self.setBackgroundColor()
        self.title = "다마고치 선택하기"
        collectionViewDelegate()
        registerNib()
        configureCollectionViewlayout()
        collectionView.backgroundColor = themeColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let titleBool = UserDefaults.standard.bool( forKey: ForKey.changeCharacter.rawValue)
        print("1")
        if titleBool == false {
            self.title = "다마고치 선택하기"
        } else {
            self.title = "다마고치 변경하기"
        }
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
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
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
        let popUpView = self.storyboard?.instantiateViewController(withIdentifier: PopUpViewController.identifier) as! PopUpViewController

        let item = tamagotchi.list[indexPath.item]
        popUpView.callValue(data: item)

        popUpView.type = CharacterType(rawValue: indexPath.item)


        popUpView.modalPresentationStyle = .overFullScreen
        present(popUpView, animated: true)
    }
    
}

extension MainViewController: ReusableIdentifier {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
