//
//  AuthManager.swift
//  Instagram
//
//  Created by Luis Fernando Granda Morales on 1/9/21.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    // MARK: -Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         check if username is available
         check if email is available
         create account
         insert account to database
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate{
                /*
                 create accoiunt
                 insert to database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard  error == nil, result != nil  else{
                        //Firebase auth could not creat acoount
                        completion(false)
                        return
                    }
                    //insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                         if inserted {
                            completion(true)
                            return
                        } else {
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                //either username or email does not exist
                
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            //email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username{
            //username log in
            
            print(username)
        }
    }
}
