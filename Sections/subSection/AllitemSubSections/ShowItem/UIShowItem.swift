//
//  UIFoodItemView.swift
//  DataBase
//
//  Created by alaa on 8/1/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit
import  MessageUI

class UIShowItem: UIViewController ,UITableViewDataSource,
UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var lblItemFood: UILabel!
   
    @IBOutlet weak var butF: UIButton!
    
    @IBOutlet weak var SlidColl: UICollectionView!
    
    //////////////////VAR///////////////////
        private var AItems = [Actor]()
    
    var name = "" ; var content = ""
    
    var IMAGEiTEM1 = "" ; var IMAGEiTEM2 = "" ;var IMAGEiTEM3 = "" ; var IMAGEiTEM4 = ""
    
        var IMG = UIImage()
    
        var TEL = ""
    
        var FAVFALSE = 0
    
        var scrollingTime = Timer()
    
        var ImgArrayItem:[String] = [""]
    
    ////////////////////END//////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblItemFood.text = name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func BACK(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func btnPhone(_ sender: Any) {
        let url:NSURL = URL(string: "TEL://\(TEL)")! as NSURL
        
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    
   
    @IBAction func butFavorites(_ sender: Any) {
        if(FAVFALSE == 0){
            butF.setImage(#imageLiteral(resourceName: "f1"), for: .normal)
            FAVFALSE = 1
        }else{
            butF.setImage(#imageLiteral(resourceName: "f0"), for: .normal)
            FAVFALSE = 0
        }
        
    }
    
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ShowItemTableViewCell
       
        cell?.TXTCONTENT.text = content
        
      
        return cell!
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellcellSlide", for: indexPath) as! SlideImg
     
        
        var ImgArray:[String] = ["\(IMAGEiTEM1)","\(IMAGEiTEM2)","\(IMAGEiTEM3)","\(IMAGEiTEM4)"]
     
        let ImgURLX = URL(string: ImgArray[indexPath.row])
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: ImgURLX!)
                if let data = data{
                    let Imagex = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.Simg.image = Imagex!
                    }
                }
            }
        
    
        /////SlideShow
        var rowIndex = indexPath.row
        let number = ImgArray.count - 1
        if(rowIndex < number){
            rowIndex = (rowIndex + 1)
        }else{
            rowIndex = 0
        }
        
        
        scrollingTime = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(UIShowItem.StarTimer(thisTimer:)), userInfo: rowIndex, repeats: true)
        return cell
        
    }
    
    
     @objc func StarTimer(thisTimer:Timer)  {
     UIView.animate(withDuration: 1.0, delay: 5, options: .curveLinear, animations: {
     self.SlidColl.scrollToItem(at: IndexPath(row: thisTimer.userInfo! as! Int, section: 0), at: .centeredHorizontally, animated: false)
     }, completion: nil)
     }
 
}
