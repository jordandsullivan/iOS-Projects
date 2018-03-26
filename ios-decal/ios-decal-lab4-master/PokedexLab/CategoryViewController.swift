//
//  CategoryViewController.swift
//  PokedexLab
//
//  Created by SAMEER SURESH on 2/25/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import UIKit


class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableViewOutlet: UITableView!
    
    var pokemonArray: [Pokemon]?
    var cachedImages: [Int:UIImage] = [:]
    var selectedIndexPath: IndexPath?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let pokemonArray = pokemonArray {
            return pokemonArray.count
        }
        return 0
    }
    
    var img: UIImage!
    var poke: Pokemon!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? TableViewCell
        
        
        if let image = cachedImages[indexPath.row] {
            cell?.Pic.image = image // may need to change this if you named your image view something different!
        } else {
            let url = URL(string: pokemonArray![indexPath.row].imageUrl)!
            let session = URLSession(configuration: .default)
            let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
                if let e = error {
                    print("Error downloading picture: \(e)")
                } else {
                    if let _ = response as? HTTPURLResponse {
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            self.cachedImages[indexPath.row] = image
                            DispatchQueue.main.async {
                                cell?.Pic.image = UIImage(data: imageData) // may need to change this if you named your image view something different!
                            }
                        } else {
                            print("Couldn't get image: Image is nil")
                        }
                    } else {
                        print("Couldn't get response code")
                    }
                }
            }
            downloadPicTask.resume()
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //IndexPath.item
        performSegue(withIdentifier: "CategorytoInfo", sender: nil)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? PokemonInfoViewController {
            //dest. = PokemonInfoViewController
        }
    
        func viewDidLoad() {
            super.viewDidLoad()
            TableViewOutlet.dataSource = self
            TableViewOutlet.delegate = self
    }

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
