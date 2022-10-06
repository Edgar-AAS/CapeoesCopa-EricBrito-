//
//  WinnersTableViewController.swift
//  CampeosDaCopa
//
//  Created by Edgar Arlindo on 05/10/22.
//

import UIKit

class WinnersTableViewController: UITableViewController {

    private var worldCups = [WorldCup]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorldsCups()
    }
    
    func loadWorldsCups() {
        if let urlPath = Bundle.main.url(forResource: "winners", withExtension: "json") {
            guard let jsonData = try? Data(contentsOf: urlPath) else { return }
            
            do {
                worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return worldCups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let worldCup = worldCups[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WorldCupTableViewCell else { return UITableViewCell() }
        cell.prepare(with: worldCup)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let worldCupVC = segue.destination as? WorldCupViewController else { return }
        if let row = tableView.indexPathForSelectedRow?.row {
            worldCupVC.worldCup = worldCups[row]
        }
    }
}
