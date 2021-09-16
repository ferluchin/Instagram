//
//  HomeViewController.swift
//  Instagram
//
//  Created by Luis Fernando Granda Morales on 31/8/21.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
        /*
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("Failed to sign out")
        }
         */
    }
    private func handleNotAuthenticated() {
        //Check auth Status
        
        if Auth.auth().currentUser == nil {
            //Show Log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
        
    }
 
}

