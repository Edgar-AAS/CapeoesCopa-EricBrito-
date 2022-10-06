//
//  WorldCupTableViewCell.swift
//  CampeosDaCopa
//
//  Created by Edgar Arlindo on 06/10/22.
//

import UIKit

class WorldCupTableViewCell: UITableViewCell {
    @IBOutlet var lbYear: UILabel!
    
    @IBOutlet var ivWinner: UIImageView!
    @IBOutlet var ivVice: UIImageView!
    @IBOutlet var lbWinner: UILabel!
    @IBOutlet var lbVice: UILabel!
    @IBOutlet var lbWinnerScore: UILabel!
    @IBOutlet var lbViceScore: UILabel!
    @IBOutlet var lbCountry: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func prepare(with cup: WorldCup) {
        lbYear.text = String(cup.year)
        ivWinner.image = UIImage(named: cup.winner)
        ivVice.image = UIImage(named: cup.vice)
        lbWinner.text = cup.winner
        lbVice.text = cup.vice
        lbCountry.text = cup.country
        lbWinnerScore.text = cup.winnerScore
        lbViceScore.text = cup.viceScore
    }
}
