//
//  ViewController.swift
//  DataAsset
//
//  Created by Angelos Staboulis on 8/6/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblJSONFile: UILabel!
    func loadJSONFile()->[String:Any]{
        guard let json = NSDataAsset(name: "JSONFile") else {return [:]}
        var getJSON:[String:Any] = [:]
        do{
            getJSON = try JSONSerialization.jsonObject(with: json.data) as! [String : Any]
        }catch{
            return [:]
        }
        return getJSON
    }
    func convertDictionaryToString(dict:[String:Any])->String{
        var jsonString = String()
        for item in dict{
            jsonString = jsonString + String(describing:item.value)
        }
        return jsonString
    }
    @IBAction func btnJSONFile(_ sender: Any) {
        showJSON()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }


}
extension ViewController{
    func showJSON(){
        lblJSONFile.numberOfLines = 0
        lblJSONFile.lineBreakMode = .byWordWrapping
        lblJSONFile.text = convertDictionaryToString(dict: loadJSONFile())
    }
}
