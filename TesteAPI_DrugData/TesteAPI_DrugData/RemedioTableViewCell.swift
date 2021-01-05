//
//  RemedioTableViewCell.swift
//  TesteAPI_DrugData
//
//  Created by Grazi Berti on 05/01/21.
//

import UIKit

class RemedioTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelRemedio: UILabel!
    @IBOutlet weak var labelApresentacao: UILabel!
    
    func setup(produto: Remedio) {
        labelRemedio.text = produto.produto
        labelApresentacao.text = produto.apresentacao
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
