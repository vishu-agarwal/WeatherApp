//
//  Weathervc.swift
//  WeatherAppl
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Weathervc: UIViewController {
    
    private var cityarray = [Details]()
    
    private let serachbar = UISearchBar()
    
    var citynamme = ""
    
    /*
 
     var name = ""
     var region = ""
     var country = ""
     var localtime = ""
     var temp_c = ""
     var id_day : Int
     var cloud : Int
    
     var text = ""
     var icon = ""
 */
    
    private var searching = false

    private let nametxt: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize : 20)
        lbl.textColor = .blue
        
        lbl.text = ""
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private let regiontxt: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize : 20)
        lbl.textColor = .blue
        
        lbl.text = ""
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private let temptxt: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize : 20)
        lbl.textColor = .blue
        
        lbl.text = ""
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private let countrytxt: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize : 20)
        lbl.textColor = .blue
        
        lbl.text = ""
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    
    
    private let localtimetxt: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize : 20)
        lbl.textColor = .blue
        
        lbl.text = ""
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    
    private let daytxt: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize : 52)
        lbl.textColor = .blue
        
        lbl.text = ""
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private let cloudtxt: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize : 20)
        lbl.textColor = .blue
        
        lbl.text = ""
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private let texttxt: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize : 20)
        lbl.textColor = .blue
        
        lbl.text = ""
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private let iconimg: UIImageView = {
        
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        return img
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "WEATHER"
        //  citynamme = UserDefaults.standard.value(forKey: "city") as! String
        view.backgroundColor = .white
         //getData(name : citynamme)
        view.addSubview(serachbar)
        view.addSubview(iconimg)
         view.addSubview(nametxt)
         view.addSubview(cloudtxt)
        view.addSubview(countrytxt)
         view.addSubview(texttxt)
         view.addSubview(daytxt)
         view.addSubview(localtimetxt)
         view.addSubview(temptxt)
         view.addSubview(regiontxt)
        serachbar.delegate = self
        
      
        getData(name : citynamme)
        
    }
    
    private func getData(name: String)
    {
        self.citynamme = name.replacingOccurrences(of: " ", with: " ")
        cityarray = ApiHandler.shared.searchCity(with: name)
        for i in cityarray
        {
            
            texttxt.text = i.current.condition.text
            nametxt.text = i.location.name
            countrytxt.text = i.location.country
            cloudtxt.text = "Cloud : " + String(i.current.cloud)
            localtimetxt.text =  "Time : " + i.location.localtime
            regiontxt.text = i.location.region
            daytxt.text = "Day : " + String(i.current.id_day)
            temptxt.text = "Temprature  : " + i.current.temp_c
            var image = i.current.condition.icon
            image = image.replacingOccurrences(of: "//cdn.weatherapi.com/", with: "")
            iconimg.image = UIImage(named: image)
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        serachbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 80)
        countrytxt.frame = CGRect(x: 20, y: serachbar.bottom + 20, width: view.width  - 40 , height: 40)
        nametxt.frame = CGRect(x: 20, y: countrytxt.bottom + 10, width: view.width  - 40 , height: 40)
        regiontxt.frame = CGRect(x: 20, y: nametxt.bottom + 10, width: view.width  - 40 , height: 40)
        temptxt.frame = CGRect(x: 20, y: regiontxt.bottom + 10, width: view.width  - 40 , height: 40)
        cloudtxt.frame = CGRect(x: 20, y: temptxt.bottom + 10, width: view.width  - 40 , height: 40)
        texttxt.frame = CGRect(x: 20, y: cloudtxt.bottom + 10, width: view.width  - 40 , height: 40)
        daytxt.frame = CGRect(x: 20, y: texttxt.bottom + 10, width: view.width  - 40 , height: 40)
        localtimetxt.frame = CGRect(x: 20, y: daytxt.bottom + 10, width: view.width  - 40 , height: 40)
        iconimg.frame = CGRect(x: 20, y: localtimetxt.bottom + 10, width: view.width  - 40 , height: 40)
        
        
    }

}


extension Weathervc : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
            view.endEditing(true)
            
            searching = true
            getData(name:serachbar.text!)
    
    }
}
