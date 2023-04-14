//
//  ContentViewController.swift
//  MarryMe
//
//  Created by LC105-21417-02 on 2023/4/11.
//

import Foundation
import UIKit

class ContentViewController: BaseViewController {
    @IBOutlet weak var imageSliderCollectionView: UICollectionView!
    @IBOutlet weak var sliferPageControl: UIPageControl!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var enterTextField: CustomTextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    var imageList: [UIImage?] = []
    var questionList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageList = [
            UIImage(named: "press-after-button"),
            UIImage(named: "press-after-button"),
            UIImage(named: "press-after-button"),
            UIImage(named: "qa"),
            UIImage(named: "qa"),
            UIImage(named: "qa")
        ]
        
        imageSliderCollectionView.delegate = self
        imageSliderCollectionView.dataSource = self
        sliferPageControl.numberOfPages = imageList.count
    }
    
    
    @IBAction func confirmAction(_ sender: Any) {
    }
    
    @IBAction func yesAction(_ sender: Any) {
    }
    
    @IBAction func noAction(_ sender: Any) {
    }
}

extension ContentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let sc = scrollView.contentOffset.x / imageSliderCollectionView.frame.width
        sliferPageControl.currentPage = Int(sc)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    
//    collection
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return imageSliderCollectionView.bounds.size
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = imageSliderCollectionView.dequeueReusableCell(withReuseIdentifier: "imageSliderCell", for: indexPath) as? imageSliderCollectionViewCell {
            cell.imageView.image = imageList[indexPath.row]
//            cell.frame = imageSliderCollectionView.frame
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}
