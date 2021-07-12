//
//  ViewController.swift
//  WeatherAppl
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    public var city = ""

    private let myImg: UIImageView = {
        
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        img.image = UIImage(named:"weather")
        
        return img
    }()
    
    private let citytxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter City Name"
        txt.textColor = .purple
        txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        
        return txt
    }()
    
    private let mybtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("CLICK ME !!", for: .normal)
        btn.addTarget(self, action: #selector(searchfunc), for: .touchUpInside)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    @objc func searchfunc(){
        //here save data into userdefaults
       UserDefaults.standard.set(citytxt.text, forKey: "city")
        let vc = Weathervc()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        title = "Weather"
        
        view.addSubview(mybtn)
        view.addSubview(myImg)
        view.addSubview(citytxt)
        //city name
       city = citytxt.text!
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myImg.frame = CGRect(x: 65, y: view.safeAreaInsets.top + 80, width: 250, height: 250)
        citytxt.frame = CGRect (x: 40, y: myImg.bottom + 40, width: view.width - 80, height: 80)
        mybtn.frame = CGRect(x: 40, y: citytxt.bottom + 30, width: view.width - 80, height: 60)
    }

}

