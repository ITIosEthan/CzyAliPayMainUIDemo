//
//  CzyCustomTableView.swift
//  CzyAliPayUIDemo
//
//  Created by macOfEthan on 17/6/13.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

import UIKit

class CzyCustomTableView: UITableView , UITableViewDelegate, UITableViewDataSource{

    var mainContentOffset:CGFloat?{
    
        didSet{
        
            self.contentOffset = CGPoint.init(x: 0, y: mainContentOffset!)
        }
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.dataSource = self
        self.delegate = self
        
        // 注销第一响应
        self.isScrollEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusedId:String = "reusedId"
        var cell = tableView.dequeueReusableCell(withIdentifier: reusedId)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reusedId)
        }
        
        cell?.textLabel?.text = "row = \(indexPath.row)"
        
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (kCzyHeight * 2 - 180 - 49) / 20
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
