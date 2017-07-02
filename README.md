# CzyAliPayMainUIDemo

#支付宝首页UI效果：
##嵌套结构：scrollView上放一个继承与UITableView的CzyCustomTableView
###关键点：

    1.设置滚动条在tableView y=0处：
      mainScrollView?.scrollIndicatorInsets = UIEdgeInsets.init(top: 100+80, left: 0, bottom: 0, right: 0)
     
    2.奢侈tableView的高度问整个scrollView的contentSize-topHeight
      mainTableView = CzyCustomTableView.init(frame: CGRect.init(x: 0, y: (mainSmallCategoryView?.frame.maxY)!, width: kCzyWith, height: kCzyHeight*2-180-49), style: .plain)
    
    3.在scrollViewDidScroll里面scrollView向下滑动的时候，设置上边视图frame时，应该是：
      mainLargeCategoryView?.frame.origin.y = offSetY
      此处小于0是因为mainLargeCategoryView等都是加载scrollView上 因此此时mainLargeCategoryView的有坐标应该减去 contentOffset。
      
    4.滑动太快，会出现空隙，解决：
      topView?.frame.origin.y = 0
      mainLargeCategoryView?.alpha = 1.0
      
    5.压缩视觉效果，本质是滑动的时候不1：1的改变frame，这里改变的是frame/3:
      mainLargeCategoryView?.frame.origin.y = offSetY / 3
    
    6.注意有两个可以同方向滑动的滚动视图时，确保当前第一响应者是scrollView：
      CzyCustomTableView：self.isScrollEnabled = false
      
      
#效果图

![image](https://github.com/ITIosEthan/CzyAliPayMainUIDemo/blob/master/%E6%94%AF%E4%BB%98%E5%AE%9D%E9%A6%96%E9%A1%B5UI.gif)
    
    
    
