//
//  ViewController.swift
//  Sankati_MultiLingualApp
//
//  Created by Sankati,Vignan on 3/15/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var languageTitle:String = "Japanese"
    let languageCode = ["Japanese":"ja", "French":"fr", "Hindi":"hi"]
    
    @IBOutlet weak var toBeTranslatedTextTV: UITextView!
    @IBOutlet weak var languageSC: UISegmentedControl!
    
    @IBOutlet weak var translatedTextTV: UITextView!
    
    @IBAction func languageChanged(sender: AnyObject) {
        let languageIndex:Int = languageSC.selectedSegmentIndex
        
        languageTitle = languageSC.titleForSegmentAtIndex(languageIndex)!
        //languageTitle = titleForSegmentAtIndex(languageIndex)
    }
    
    @IBAction func translation(sender: AnyObject) {
        let encodedString:String = toBeTranslatedTextTV.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let urlString = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160316T201633Z.3edd97cd482f5f99.44412180dddb0c1a07bd7ab38d4a746421932f28&text=\(encodedString)&lang=en-\(languageCode[languageTitle]!)"
        let session = NSURLSession.sharedSession() // lies in between
        session.dataTaskWithURL(NSURL(string: urlString)!, completionHandler: processResults).resume()
    }
    
    
    func processResults(data:NSData?,response:NSURLResponse?,error:NSError?)->Void {
        var jsonData:[String:AnyObject]!
        do {
            try jsonData = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [String:AnyObject] // grab the data
            // we use [AnyObject] because we know that's how the data will be formed
            let translatedStringArray:[AnyObject] = jsonData["text"] as! [String]
            print(translatedStringArray[0])
            dispatch_async(dispatch_get_main_queue()){
                self.translatedTextTV.text = translatedStringArray[0] as! String
            }
            
        }catch {
            print("Something has gone wrong ")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

