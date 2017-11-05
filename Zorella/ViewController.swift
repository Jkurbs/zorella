//
//  ViewController.swift
//  Zorella
//
//  Created by Kerby Jean on 2017-08-27.
//  Copyright © 2017 Flaint, Inc. All rights reserved.
//

import UIKit
import Hero

//private extension UICollectionView {
//    func indexPathsForElements(in rect: CGRect) -> [IndexPath] {
//        let allLayoutAttributes = collectionViewLayout.layoutAttributesForElements(in: rect)!
//        return allLayoutAttributes.map { $0.indexPath }
//    }
//}


class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var modelCollectionView: UICollectionView!
    
    var models = Model.models
    let numberOfCellsPerRow: CGFloat = 3
    var hidesStatusBar: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelCollectionView.delegate = self
        modelCollectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
        
        if indexPath.section == 0 {
            header.headerLabel.text = "Today"
        } else {
            header.headerLabel.text = "Models"
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return models.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath)
            let videoCollectionView = self.storyboard?.instantiateViewController(withIdentifier: "VideoCollectionView") as! VideoCollectionView
            self.addChildViewController(videoCollectionView)
            videoCollectionView.view.frame = cell.bounds
            cell.addSubview((videoCollectionView.view)!)
            videoCollectionView.didMove(toParentViewController: self)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ModelCell", for: indexPath) as! ModelCell
            cell.configure(model)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        let playerVC = storyboard?.instantiateViewController(withIdentifier: "PlayerVC") as! PlayerVC
        playerVC.model = model
        playerVC.heroModalAnimationType = HeroDefaultAnimationType.selectBy(presenting:.zoom, dismissing:.slide(direction: .up))
        navigationController?.hero_replaceViewController(with: playerVC)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let cellsAcross: CGFloat = 1
            let dim = (collectionView.bounds.width - (cellsAcross - 1)) / cellsAcross
            return CGSize(width: dim, height: dim - 150)
        } else if indexPath.section == 1 {
            let cellsAcross: CGFloat = 4
            let spaceBetweenCells: CGFloat = 1
            let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
            return CGSize(width: dim, height: dim)
        }
        return .zero
    }
}

