//
//  DetailViewController.swift
//  CodableSample
//
//  Created by Takahiro Tsuchiya on 2017/11/24.
//  Copyright © 2017 TakahiroTsuchiya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var birthdayLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var emailAddressLabel: UILabel!
    
    var detailInfo: DetailModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailImageView.af_setImage(withURL: URL(string: self.detailInfo.imageUrl)!)
        nameLabel.text = self.detailInfo.first + " " + self.detailInfo.last
        birthdayLabel.text = self.detailInfo.dob
        phoneNumberLabel.text = self.detailInfo.phone
        emailAddressLabel.text = self.detailInfo.email

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Action

    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true) {
        }
    }
}
