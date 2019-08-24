//
//  ViewController.swift
//  DataBase
//
//  Created by alaa on 7/29/18.
//  Copyright © 2018 alaa. All rights reserved.
//

import UIKit



class ViewController:UIViewController ,UITableViewDataSource,
UITableViewDelegate {
    
   

    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var txtTitle: UILabel!
    
    //@IBOutlet weak var SlidColl: UICollectionView!
    
    @IBOutlet weak var Rview: UIView!
    
    
    @IBOutlet weak var txtResult: UILabel!
    
    //////////////VAR/////////////
    var id:String = ""
    
    var name:String = ""
    
   // var valueSubSection:Int = 0
    
    private var AItems = [Actor]()
    /////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtTitle.text = name
        
        DownloadJson()
    }


    func DownloadJson()  {
        let url = URL(string: "http://alhazazi.net/sections.php?subitam=subsectionitam&subSectionID=\(id)")
        
        guard let downloadURL = url else { return }
        
        URLSession.shared.dataTask(with: downloadURL) { (data, URLResponse, error) in
            
            guard let data = data , error == nil , URLResponse != nil
            else {
                print("Something is Error")
                return
            }
            print("downloded")
            
            do {
                let decoder = JSONDecoder()
                let downloadAtors = try decoder.decode(Actors.self, from: data)
                self.AItems = downloadAtors.Items
                DispatchQueue.main.async {
                    if(self.AItems.count == 0){
                        self.Rview.isHidden = false
                        self.tableview.isHidden = true
                        //print("No Items OF Sub Section 11")
                        self.txtResult.text = "No Items"
                    }else{
                        self.Rview.isHidden = true
                        self.tableview.isHidden = false
                        self.tableview.reloadData()
                    }
                }
            } catch {
                print("Error")
            }

        }.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AItems.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell") as? ActorCell else {return UITableViewCell()}
        
       
        if indexPath.row % 2 == 0{
            cell.contentView.backgroundColor = UIColor(red: 0.0, green: 0.2, blue: 0.0, alpha: 0.1)
        }
        
        
        /////Rows
        cell.lblName.text = AItems[indexPath.row].name
        cell.lblDOB.text =  AItems[indexPath.row].content
        cell.txtCost.text = AItems[indexPath.row].cost
    
        
        //txtTitle.text = AItems[indexPath.row].namesubSection
        
        /////Images
        if
            let ImgURL = URL(string: AItems[indexPath.row].pic1){
            
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: ImgURL)
                    if let data = data{
                        let Image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.imgView.image = Image
                        }
                    }
                }
        }
        
       // valueSubSection = 1
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return AItems.count
    }
    
   
    
   /* func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellcellSlide", for: indexPath) as! SlideImg
        
        //////DownLoad Image
        let ImgURLAX = URL(string: AItems[indexPath.row].pic1)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: ImgURLAX!)
            if let data = data{
                let ImageAx = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.Simg.image = ImageAx!
                }
            }
        }
        
        
      
      /////SlideShow
        var rowIndex = indexPath.row
        print(rowIndex)
        let number = AItems.count - 1
        if(rowIndex < number){
            rowIndex = (rowIndex + 1)
        }else{
            rowIndex = 0
        }
        
        scrollingTime = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(ViewController.StarTimer(thisTimer:)), userInfo: rowIndex, repeats: true)
        return cell
        
    }
    
    @objc func StarTimer(thisTimer:Timer)  {
        UIView.animate(withDuration: 1.0, delay: 5, options: .curveLinear, animations: {
            self.SlidColl.scrollToItem(at: IndexPath(row: thisTimer.userInfo! as! Int, section: 0), at: .centeredHorizontally, animated: false)
        }, completion: nil)
    }
    */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ///////SHOW Content
        let stor = storyboard?.instantiateViewController(withIdentifier: "showItem") as? UIShowItem
        
        self.navigationController?.pushViewController(stor!, animated: true)
        
        
        stor?.name = AItems[indexPath.row].name
        stor?.content = AItems[indexPath.row].content
        stor?.IMAGEiTEM1 = AItems[indexPath.row].pic1
        stor?.IMAGEiTEM2 = AItems[indexPath.row].pic2
        stor?.IMAGEiTEM3 = AItems[indexPath.row].pic3
        stor?.IMAGEiTEM4 = AItems[indexPath.row].pic4
       // stor?.IMAGEiTEM1 = ImgArray[0]
       // stor?.IMAGEiTEM2 = ImgArray[1]
        
        //////DownLoad Image
        
        
        /*let ImgURLX = URL(string: ImgArray[1])
       // stor?.IMAGEiTEM = ImgURLX!
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: ImgURLX!)
            if let data = data{
                let Imagex = UIImage(data: data)
                DispatchQueue.main.async {
                    stor?.IMG = Imagex!
                }
            }
        }*/
    }
}

