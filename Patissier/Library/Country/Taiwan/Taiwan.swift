//
//  Taiwan.swift
//  Patissier
//
//  Created by Roy Hsu on 14/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - Taiwan

// Reference: http://campus4.ncku.edu.tw/wwwmenu/program/net/zip.htm

public struct Taiwan: Country {

    // MARK: Property

    public let code = "886"

    public let cities: [City] = [
        TaipeiCity(),
        KeelungCity(),
        LienchiangCounty(),
        NewTaipeiCity(),
        YilanCounty(),
        HsinchuCity(),
        HsinchuCounty(),
        TaoyuanCity(),
        MiaoliCounty(),
        TaichungCity(),
        ChanghuaCounty(),
        NantouCounty(),
        ChiayiCity(),
        ChiayiCounty(),
        YunlinCounty(),
        TainanCity(),
        KaohsiungCity(),
        PenghuCounty(),
        KinmenCounty(),
        PingtungCounty(),
        TaitungCounty(),
        HualienCounty()
    ]

    public var capitalCity: City { return cities.first { $0.isCapital }! }

}
