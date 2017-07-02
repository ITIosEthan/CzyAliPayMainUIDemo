//
//  CzyEditViewController.swift
//  CzyAliPayUIDemo
//
//  Created by macOfEthan on 17/6/13.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

import UIKit

class CzyEditViewController: UIViewController , UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    var collection:UICollectionView?
    
    
    // MARK: - 生命周期
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        czyCollectionViewInit()
    }

    func czyCollectionViewInit() -> Void {
        
        let layOut:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layOut.minimumLineSpacing = (kCzyWith-100*3)/4
        layOut.minimumInteritemSpacing = (kCzyWith-100*3)/4
        layOut.sectionInset = UIEdgeInsets.init(top: 0, left: (kCzyWith-100*3)/4, bottom: 0, right: (kCzyWith-100*3)/4)
        
        collection = UICollectionView.init(frame: CGRect.init(x: 0, y: 10, width: kCzyWith, height: kCzyHeight-49), collectionViewLayout: layOut)
        collection?.backgroundColor = UIColor.white
        collection?.delegate = self
        collection?.dataSource = self
        self.view.addSubview(collection!)
        
        collection?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(UICollectionViewCell.self))
        collection?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 5
        }else{
            return 7
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(UICollectionViewCell.self), for: indexPath)

        let lab:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        lab.text = "item = \(indexPath.row)"
        lab.textColor = UIColor.red
        lab.textAlignment = .center

        cell.contentView.addSubview(lab)
        
        cell.backgroundColor = UIColor.lightGray
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            
            let headerView:UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
            
            let headerLab:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kCzyWith, height: 30))
            headerLab.text = "section = \(indexPath.section)"
            headerLab.textAlignment = .center
            headerLab.textColor = UIColor.red
            headerView.addSubview(headerLab)
            
            return headerView
        }else{
        
            let headerView:UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
            
            let headerLab:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kCzyWith, height: 30))
            headerLab.text = "section = \(indexPath.section)"
            headerLab.textAlignment = .center
            headerLab.textColor = UIColor.red
            headerView.addSubview(headerLab)
            
            return headerView
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize.init(width: kCzyWith, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: kCzyWith, height: 0.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: 100, height: 100)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
