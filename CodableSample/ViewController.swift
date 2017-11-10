//
//  ViewController.swift
//  CodableSample
//
//  Created by other on 2017/11/07.
//  Copyright © 2017 TakahiroTsuchiya. All rights reserved.
//

import UIKit
import APIKit
import AlamofireImage

class ViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!

    //MARK: Properties
    var userDatas: [Results]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {

        // Get Datas

        let request = RandomUserAPI()
        
        Session.send(request) { result in
            switch result {

            case .success(let userData):

                self.userDatas = userData.results

                self.userTableView.reloadData()

            case .failure(.responseError(let error)):
                print("error: \(error)")
            case .failure(.connectionError(let error)):
                print("error: \(error)")
            case .failure(.requestError(let error)):
                print("error: \(error)")
            }
        }
    }
}

//MARK:

extension ViewController: UITableViewDelegate {
}

//MARK:

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Stub
        guard (self.userDatas != nil) else {
            return 0
        }
        return (self.userDatas?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userListCell") else {
            //TODO: Stub
            fatalError()
        }

        guard
              let userLogin = self.userDatas?[indexPath.row].login
//            , let registered = self.userDatas?[indexPath.row].registered
            , let picture = self.userDatas?[indexPath.row].picture else {
            return cell
        }

        let username = userLogin.username
        cell.textLabel?.text = "\(username)"

//        cell.detailTextLabel?.text = "registered : \(registered)"

        cell.imageView?.af_setImage(withURL: URL(string: picture.thumbnail)!)

        return cell
    }
}
