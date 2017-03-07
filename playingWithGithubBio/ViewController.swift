//
//  ViewController.swift
//  playingWithGithubBio
//
//  Created by Johann Kerr on 3/7/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GithubApiClient.updateBio("This is a super cool bio") {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

