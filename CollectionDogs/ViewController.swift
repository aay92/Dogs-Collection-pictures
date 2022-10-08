//
//  ViewController.swift
//  CollectionDogs
//
//  Created by Aleksey Alyonin on 08.10.2022.
//

import UIKit

class ViewController: UIViewController {
    private let images: [UIImage] = Array(1 ... 12).map {UIImage(named: String($0))!}
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = createLayout()
        
    }
    private func createLayout()-> UICollectionViewCompositionalLayout {
        
//        item width.fractionalWidth 0.5 половина ширины экраны группы, .fractionalHeight(1) высота предмета в группе
        let item = CompositionLayout.createItem(width: .fractionalWidth(0.5),
                                                height: .fractionalHeight(1),
                                                spacing: 1)
        
        let secondItem = CompositionLayout.createItem(width: .fractionalWidth(1),
                                                    height: .fractionalHeight(1),
                                                    spacing: 1)
//        вертикальная group в основной группе
        let verticalGruop = CompositionLayout.createGroup(alignment: .vertical,
                                                          width: .fractionalWidth(0.5),
                                                          height: .fractionalHeight(1),
                                                          item: secondItem,
                                                          count: 2)
//        group
        let group = CompositionLayout.createGroup(alignment: .horizontal,
                                                  width: .fractionalWidth(1),
                                                  height: .fractionalHeight(0.3),
                                                  items: [item, verticalGruop])
                                                                             
//        section
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(images[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setImage(image: images[indexPath.row])
        return cell
    }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}
