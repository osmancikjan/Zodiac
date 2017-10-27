//
//  ViewController.swift
//  Zodiac
//
//  Created by Jan Osmancik on 26.10.17.
//  Copyright © 2017 Jan Osmancik. All rights reserved.
//

import UIKit
import Foundation
import SafariServices

let zodiacs: [String] = ["Kozoroh", "Vodnar", "Ryby", "Beran", "Byk", "Blizenci", "Rak", "Lev", "Panna", "Vahy", "Stir", "Strelec"]
//[0101,0121,0221,0321,0421,0522,0622,0723,0823,0923,1024,1123,1222] //MMdd
//[0120,0220,0320,0420,0521,0621,0722,0822,0922,1023,1122,1221,1231]

var intDay: Int = 1
var intMon: Int = 1
var strDay: String = ""
var strMon: String = ""
var zodName: String = ""


class ViewController: UIViewController {
    @IBOutlet weak var imgZod: UIImageView!
    @IBOutlet weak var txtZodName: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgZod.isUserInteractionEnabled = true
        imgZod.addGestureRecognizer(tapGestureRecognizer)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let strUrl = "https://www.horoskopy.cz/" + zodName
        let url = URL(string: strUrl)
        let vc = SFSafariViewController(url: url!)
        present(vc, animated: true, completion: nil)
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "dd"
        intDay = Int(dateFormatter.string(from: datePicker.date))!
        dateFormatter.dateFormat = "MM"
        intMon = Int(dateFormatter.string(from: datePicker.date))!
        
        strDay = String(format: "%02d", intDay)
        strMon = String(format: "%02d", intMon)
        
        let strAll = strMon + strDay
        let intAll = Int(strAll)
        print(strAll, " ", intAll!)
        
        if intAll! >= 101 && intAll! <= 120 {
            txtZodName.text = "Kozoroh"
            imgZod.image = #imageLiteral(resourceName: "kozoroh01")
            zodName = "kozoroh"
        }
        if intAll! >= 121 && intAll! <= 220 {
            txtZodName.text = "Vodnář"
            imgZod.image = #imageLiteral(resourceName: "vodnar02")
            zodName = "vodnar"
        }
        if intAll! >= 221 && intAll! <= 320 {
            txtZodName.text = "Ryby"
            imgZod.image = #imageLiteral(resourceName: "ryby03")
            zodName = "ryby"
        }
        if intAll! >= 321 && intAll! <= 420 {
            txtZodName.text = "Beran"
            imgZod.image = #imageLiteral(resourceName: "beran04")
            zodName = "beran"
        }
        if intAll! >= 421 && intAll! <= 521 {
            txtZodName.text = "Býk"
            imgZod.image = #imageLiteral(resourceName: "byk05")
            zodName = "byk"
        }
        if intAll! >= 522 && intAll! <= 621 {
            txtZodName.text = "Blíženci"
            imgZod.image = #imageLiteral(resourceName: "blizenci06")
            zodName = "blizenci"
        }
        if intAll! >= 622 && intAll! <= 722 {
            txtZodName.text = "Rak"
            imgZod.image = #imageLiteral(resourceName: "rak07")
            zodName = "rak"
        }
        if intAll! >= 723 && intAll! <= 822 {
            txtZodName.text = "Lev"
            imgZod.image = #imageLiteral(resourceName: "lev08")
            zodName = "lev"
        }
        if intAll! >= 823 && intAll! <= 922 {
            txtZodName.text = "Panna"
            imgZod.image = #imageLiteral(resourceName: "panna09")
            zodName = "panna"
        }
        if intAll! >= 923 && intAll! <= 1023 {
            txtZodName.text = "Váhy"
            imgZod.image = #imageLiteral(resourceName: "vahy10")
            zodName = "vahy"
        }
        if intAll! >= 1024 && intAll! <= 1122 {
            txtZodName.text = "Štír"
            imgZod.image = #imageLiteral(resourceName: "stir11")
            zodName = "stir"
        }
        if intAll! >= 1123 && intAll! <= 1221 {
            txtZodName.text = "Střelec"
            imgZod.image = #imageLiteral(resourceName: "strelec12")
            zodName = "strelec"
        }
        if intAll! >= 1222 && intAll! <= 1231 {
            txtZodName.text = "Kozoroh"
            imgZod.image = #imageLiteral(resourceName: "kozoroh01")
            zodName = "kozoroh"
        }
    }
}
