//
//  CzyMainViewController.swift
//  CzyAliPayUIDemo
//
//  Created by macOfEthan on 17/6/13.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

import UIKit

class CzyMainViewController: UIViewController , UIScrollViewDelegate {

    var mainScrollView:UIScrollView?
    var mainLargeCategoryView:UIView?
    var mainSmallCategoryView:UIView?
    var mainTableView:CzyCustomTableView?
    var topView:UIView?
    var currentOffset:CGFloat? = 0 // 当前偏移量
    
    
    // MARK: - life cycle
    override func viewWillAppear(_ animated: Bool) {
        self.title = "main"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        
        czyCustomInitAliPayMainUI()
    }

    func czyCustomInitAliPayMainUI() -> Void {
        
        mainScrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 64, width: kCzyWith, height: kCzyHeight-64))
        mainScrollView?.delegate = self
        mainScrollView?.contentSize = CGSize.init(width: 0, height: kCzyHeight*2)
        
        // indicator fit
        mainScrollView?.scrollIndicatorInsets = UIEdgeInsets.init(top: 100+80, left: 0, bottom: 0, right: 0)
        self.view.addSubview(mainScrollView!)
        
        topView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kCzyWith, height: 180))
        mainScrollView?.addSubview(topView!)
        
        mainLargeCategoryView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kCzyWith, height: 80))
        mainLargeCategoryView?.backgroundColor = UIColor.black
        //addBtnInView(mainLargeCategoryView)
        topView?.addSubview(mainLargeCategoryView!)
        
        mainSmallCategoryView = UIView.init(frame: CGRect.init(x: 0, y: (mainLargeCategoryView?.frame.maxY)!, width: kCzyWith, height: 100))
        mainSmallCategoryView?.backgroundColor = UIColor.brown
        topView?.addSubview(mainSmallCategoryView!)
        
        // mainTableView height : mainScrollView - 180
        mainTableView = CzyCustomTableView.init(frame: CGRect.init(x: 0, y: (mainSmallCategoryView?.frame.maxY)!, width: kCzyWith, height: kCzyHeight*2-180-49), style: .plain)
        mainScrollView?.addSubview(mainTableView!)
    }
    
      
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offSetY = scrollView.contentOffset.y
        
        print(offSetY)
        
        // 此处小于0是因为mainLargeCategoryView等都是加载scrollView上 因此此时mainLargeCategoryView的有坐标应该减去 contentOffset
        if offSetY < 0 {
            
            mainLargeCategoryView?.frame.origin.y = offSetY
            
            mainSmallCategoryView?.frame.origin.y = (mainLargeCategoryView?.frame.maxY)!
            
            mainTableView?.frame.origin.y = offSetY + 180
            
            mainTableView?.mainContentOffset = offSetY
            
            // 解决下滑太快出现的问题
            topView?.frame.origin.y = 0
            mainLargeCategoryView?.alpha = 1.0
            
        }else{
        
            // 视觉效果 压缩效果
            mainLargeCategoryView?.frame.origin.y = offSetY / 3
            
            mainLargeCategoryView?.alpha = 1 - offSetY / 80
        }
        
        // 导航栏渐变
        self.navigationController?.navigationBar.barTintColor = UIColor.red

        if offSetY > currentOffset!{
            
            self.navigationItem.title = "上滑中..."
            
        }else{
            
            self.navigationItem.title = "下滑中..."
            
        }
        
        currentOffset = offSetY
    }
    
    func addBtnInView(_ view:UIView?) -> Void {
        
        for i in 0..<4{
        
            let btn:CzyBtn = CzyBtn.init(frame: CGRect.init(x: kCzyWith/4*CGFloat(i), y: 0, width: kCzyWith/4, height: 80))
            btn.setTitle("btn\(i)", for: .normal)
            btn.setBackgroundImage(UIImage.init(named: "形状-28-拷贝"), for: .normal)
            view?.addSubview(btn)
        }
        
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
