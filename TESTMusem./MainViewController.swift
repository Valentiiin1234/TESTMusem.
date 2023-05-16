//
//  MainVC.swift
//  TESTMusem.
//
//  Created by Mac on 13.03.2023.
//
import UIKit


class MainViewController: UITableViewController {
    
    @IBOutlet var prevPage: UIBarButtonItem!
    @IBOutlet var nextPage: UIBarButtonItem!
    
    private var page = 0
    private var objects: [ArtObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorColor = .black
        tableView.bounces = true
        fetchObjects()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        guard let detailVC = segue.destination as? DetailViewController else {return}
        detailVC.object = objects[indexPath.row]
    }
    
    @IBAction func fetchNextPage(_ sender: Any) {
        page += 1
        fetchObjects()
        tableView.setContentOffset(CGPoint(x: 0, y: -100), animated: true)
        
    }
    
    @IBAction func fetchPrevPage(_ sender: Any) {
        page -= 1
        fetchObjects()
        tableView.setContentOffset(CGPoint(x: 0, y: -100), animated: true)

    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "cell",
                for: indexPath
            ) as? ObjectCell
        else {
            return UITableViewCell()
        }
        
        let object = objects[indexPath.row]
        cell.configure(with: object)
        
        return cell
    }
}

// MARK: - Networking
extension MainViewController {
    private func fetchObjects() {
        NetworkManager.shared.fetch(Model.self, from: Link.museum.rawValue + "\(page)") { [weak self] result in
            switch result {
            case .success(let info):
                self?.objects = info.artObjects
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
