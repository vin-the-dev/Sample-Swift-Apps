//
//  ViewController.swift
//  samlesocket
//
//  Created by Vineeth Vijayan on 28/07/16.
//  Copyright © 2016 Vineeth Vijayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var _txtMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func btnClicked(sender: AnyObject) {
        
        let client:TCPClient = TCPClient(addr: "10.201.2.90", port: 8001)
//        let client:TCPClient = TCPClient(addr: "10.201.50.11", port: 8888)
        
        let (success, errmsg) = client.connect(timeout: 10)
        
        //Connection successfull
        if success {
            
            //File name
            let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            let documentsDirectory = paths[0]
            let fileName = "\(documentsDirectory)/textfile.txt"
            
            //File Delete if present
            let fileManager = NSFileManager.defaultManager()
            
            if fileManager.fileExistsAtPath(fileName) {
                try! fileManager.removeItemAtPath(fileName)
            }
            
            while true {
                let data = client.read(1024)
                if data == nil {
                    break
                }
                
                //Write or Append to file
                let dataAsNSData = NSData(bytes: data! as [UInt8], length: data!.count)

                try! dataAsNSData.appendToFile(fileName)
                
                if data?.capacity < (1024) {
                    //Close server
                    client.close()
                    break
                }
            }
        }
        else{
            print(errmsg)
        }
    }
    @IBAction func btnSendClicked(sender: AnyObject) {
        
        let client:TCPClient = TCPClient(addr: "10.201.2.90", port: 8002)
        
        let (success, errmsg) = client.connect(timeout: 10)
        
        if success {
            let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            let documentsDirectory = paths[0]
            let fileName = "\(documentsDirectory)/textfile.txt"
            
            let data = NSData(contentsOfFile: fileName)
            
            client.send(data: data!)
            
        }
        else{
            print(errmsg)
        }
        
    }
    
    @IBAction func btnSendMessageClicked(sender: AnyObject) {
        let client:TCPClient = TCPClient(addr: "10.201.2.90", port: 8002)
        
        let (success, errmsg) = client.connect(timeout: 10)
        
        if success {
            client.send(str: _txtMessage.text!)
            client.close()
        }
        else{
            print(errmsg)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func txtMessageDidEndOnExit(sender: AnyObject) {
        self.view.endEditing(true)
    }

}

extension NSData {
    func appendToFile(fileName: String) throws {
        if let fileHandle = NSFileHandle(forWritingAtPath: fileName) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.writeData(self)
        }
        else {
            writeToFile(fileName, atomically: false)
        }
    }
}

