//
//  VeriModel.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//


import Foundation

// MARK: - Veriler
struct VeriModel: Codable {
    let data: [Veri]
    let banner_id: String?
    let banner_show: Bool?
    let gecis_id: String
    let kac_defada_gosterilsin: Int
}

// MARK: - Datum
struct Veri: Codable {
    let icon: String
    let baslik: String
    let icerik: String
}
