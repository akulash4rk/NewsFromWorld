//
//  Country.swift
//  NewsFromWorld
//
//  Created by Владислав Баранов on 17.05.2024.
//

import Foundation
import UIKit
//
//let countryList : [String : String] = ["Afghanistan" : "af"]
//

var currentCountry = ""

struct CountryList {
    let countryName: String
    let countryCode: String
    var countryImage: UIImage?
    var isPicked: Bool?

    init(countryName: String, countryCode: String, isPicked: Bool? = false) {
        self.countryName = countryName
        self.countryCode = countryCode
        self.isPicked = isPicked
    }

    mutating func loadFlagImage() async {
        self.countryImage = await loadImage(for: countryCode)
    }

    private func loadImage(for countryCode: String) async -> UIImage? {
        guard let url = URL(string: "https://ipdata.co/flags/\(countryCode).png") else {
            return nil
        }
        do {
            let (imageData, _) = try await URLSession.shared.data(from: url)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image: \(error)")
            return nil
        }
    }
}


var arrayOfAllCountries : [CountryList] = [
    CountryList.init(countryName:"Afghanistan", countryCode: "af"),
    CountryList.init(countryName:"Albania", countryCode: "al"),
    CountryList.init(countryName:"Algeria", countryCode: "dz"),
    CountryList.init(countryName:"Andorra", countryCode: "ad"),
    CountryList.init(countryName:"Angola", countryCode: "ao"),
    CountryList.init(countryName:"Argentina", countryCode: "ar"),
    CountryList.init(countryName:"Armenia", countryCode: "am"),
    CountryList.init(countryName:"Australia", countryCode: "au"),
    CountryList.init(countryName:"Austria", countryCode: "at"),
    CountryList.init(countryName:"Azerbaijan", countryCode: "az"),
    CountryList.init(countryName:"Bahamas", countryCode: "bs"),
    CountryList.init(countryName:"Bahrain", countryCode: "bh"),
    CountryList.init(countryName:"Bangladesh", countryCode: "bd"),
    CountryList.init(countryName:"Barbados", countryCode: "bb"),
    CountryList.init(countryName:"Belarus", countryCode: "by"),
    CountryList.init(countryName:"Belgium", countryCode: "be"),
    CountryList.init(countryName:"Belize", countryCode: "bz"),
    CountryList.init(countryName:"Benin", countryCode: "bj"),
    CountryList.init(countryName:"Bermuda", countryCode: "bm"),
    CountryList.init(countryName:"Bhutan", countryCode: "bt"),
    CountryList.init(countryName:"Bolivia", countryCode: "bo"),
    CountryList.init(countryName:"Bosnia", countryCode: "ba"),
    CountryList.init(countryName:"Botswana", countryCode: "bw"),
    CountryList.init(countryName:"Brazil", countryCode: "br"),
    CountryList.init(countryName:"Brunei", countryCode: "bn"),
    CountryList.init(countryName:"Bulgaria", countryCode: "bg"),
    CountryList.init(countryName:"Burkina", countryCode: "bf"),
    CountryList.init(countryName:"Burundi", countryCode: "bi"),
    CountryList.init(countryName:"Cambodia", countryCode: "kh"),
    CountryList.init(countryName:"Cameroon", countryCode: "cm"),
    CountryList.init(countryName:"Canada", countryCode: "ca"),
    CountryList.init(countryName:"Cape", countryCode: "cv"),
    CountryList.init(countryName:"Cayman", countryCode: "ky"),
    CountryList.init(countryName:"Central", countryCode: "cf"),
    CountryList.init(countryName:"Chad", countryCode: "td"),
    CountryList.init(countryName:"Chile", countryCode: "cl"),
    CountryList.init(countryName:"China", countryCode: "cn"),
    CountryList.init(countryName:"Colombia", countryCode: "co"),
    CountryList.init(countryName:"Comoros", countryCode: "km"),
    CountryList.init(countryName:"Congo", countryCode: "cg"),
    CountryList.init(countryName:"Cook", countryCode: "ck"),
    CountryList.init(countryName:"Costa", countryCode: "cr"),
    CountryList.init(countryName:"Croatia", countryCode: "hr"),
    CountryList.init(countryName:"Cuba", countryCode: "cu"),
    CountryList.init(countryName:"Cyprus", countryCode: "cy"),
    CountryList.init(countryName:"Czech", countryCode: "cz"),
    CountryList.init(countryName:"Denmark", countryCode: "dk"),
    CountryList.init(countryName:"Djibouti", countryCode: "dj"),
    CountryList.init(countryName:"Dominica", countryCode: "dm"),
    CountryList.init(countryName:"Dominican", countryCode: "do"),
    CountryList.init(countryName:"DR", countryCode: "cd"),
    CountryList.init(countryName:"Ecuador", countryCode: "ec"),
    CountryList.init(countryName:"Egypt", countryCode: "eg"),
    CountryList.init(countryName:"El", countryCode: "sv"),
    CountryList.init(countryName:"Equatorial", countryCode: "gq"),
    CountryList.init(countryName:"Eritrea", countryCode: "er"),
    CountryList.init(countryName:"Estonia", countryCode: "ee"),
    CountryList.init(countryName:"Eswatini", countryCode: "sz"),
    CountryList.init(countryName:"Ethiopia", countryCode: "et"),
    CountryList.init(countryName:"Fiji", countryCode: "fj"),
    CountryList.init(countryName:"Finland", countryCode: "fi"),
    CountryList.init(countryName:"France", countryCode: "fr"),
    CountryList.init(countryName:"French", countryCode: "pf"),
    CountryList.init(countryName:"Gabon", countryCode: "ga"),
    CountryList.init(countryName:"Gambia", countryCode: "gm"),
    CountryList.init(countryName:"Georgia", countryCode: "ge"),
    CountryList.init(countryName:"Germany", countryCode: "de"),
    CountryList.init(countryName:"Ghana", countryCode: "gh"),
    CountryList.init(countryName:"Greece", countryCode: "gr"),
    CountryList.init(countryName:"Grenada", countryCode: "gd"),
    CountryList.init(countryName:"Guatemala", countryCode: "gt"),
    CountryList.init(countryName:"Guinea", countryCode: "gn"),
    CountryList.init(countryName:"Guyana", countryCode: "gy"),
    CountryList.init(countryName:"Haiti", countryCode: "ht"),
    CountryList.init(countryName:"Honduras", countryCode: "hn"),
    CountryList.init(countryName:"Hong", countryCode: "hk"),
    CountryList.init(countryName:"Hungary", countryCode: "hu"),
    CountryList.init(countryName:"Iceland", countryCode: "is"),
    CountryList.init(countryName:"India", countryCode: "in"),
    CountryList.init(countryName:"Indonesia", countryCode: "id"),
    CountryList.init(countryName:"Iran", countryCode: "ir"),
    CountryList.init(countryName:"Iraq", countryCode: "iq"),
    CountryList.init(countryName:"Ireland", countryCode: "ie"),
    CountryList.init(countryName:"Israel", countryCode: "il"),
    CountryList.init(countryName:"Italy", countryCode: "it"),
    CountryList.init(countryName:"Ivory", countryCode: "ci"),
    CountryList.init(countryName:"Jamaica", countryCode: "jm"),
    CountryList.init(countryName:"Japan", countryCode: "jp"),
    CountryList.init(countryName:"Jersey", countryCode: "je"),
    CountryList.init(countryName:"Jordan", countryCode: "jo"),
    CountryList.init(countryName:"Kazakhstan", countryCode: "kz"),
    CountryList.init(countryName:"Kenya", countryCode: "ke"),
    CountryList.init(countryName:"Kiribati", countryCode: "ki"),
    CountryList.init(countryName:"Kosovo", countryCode: "xk"),
    CountryList.init(countryName:"Kuwait", countryCode: "kw"),
    CountryList.init(countryName:"Kyrgyzstan", countryCode: "kg"),
    CountryList.init(countryName:"Laos", countryCode: "la"),
    CountryList.init(countryName:"Latvia", countryCode: "lv"),
    CountryList.init(countryName:"Lebanon", countryCode: "lb"),
    CountryList.init(countryName:"Lesotho", countryCode: "ls"),
    CountryList.init(countryName:"Liberia", countryCode: "lr"),
    CountryList.init(countryName:"Libya", countryCode: "ly"),
    CountryList.init(countryName:"Liechtenstein", countryCode: "li"),
    CountryList.init(countryName:"Lithuania", countryCode: "lt"),
    CountryList.init(countryName:"Luxembourg", countryCode: "lu"),
    CountryList.init(countryName:"Macau", countryCode: "mo"),
    CountryList.init(countryName:"Macedonia", countryCode: "mk"),
    CountryList.init(countryName:"Madagascar", countryCode: "mg"),
    CountryList.init(countryName:"Malawi", countryCode: "mw"),
    CountryList.init(countryName:"Malaysia", countryCode: "my"),
    CountryList.init(countryName:"Maldives", countryCode: "mv"),
    CountryList.init(countryName:"Mali", countryCode: "ml"),
    CountryList.init(countryName:"Malta", countryCode: "mt"),
    CountryList.init(countryName:"Marshall", countryCode: "mh"),
    CountryList.init(countryName:"Mauritania", countryCode: "mr"),
    CountryList.init(countryName:"Mauritius", countryCode: "mu"),
    CountryList.init(countryName:"Mexico", countryCode: "mx"),
    CountryList.init(countryName:"Micronesia", countryCode: "fm"),
    CountryList.init(countryName:"Moldova", countryCode: "md"),
    CountryList.init(countryName:"Monaco", countryCode: "mc"),
    CountryList.init(countryName:"Mongolia", countryCode: "mn"),
    CountryList.init(countryName:"Montenegro", countryCode: "me"),
    CountryList.init(countryName:"Morocco", countryCode: "ma"),
    CountryList.init(countryName:"Mozambique", countryCode: "mz"),
    CountryList.init(countryName:"Myanmar", countryCode: "mm"),
    CountryList.init(countryName:"Namibia", countryCode: "na"),
    CountryList.init(countryName:"Nauru", countryCode: "nr"),
    CountryList.init(countryName:"Nepal", countryCode: "np"),
    CountryList.init(countryName:"Netherland", countryCode: "nl"),
    CountryList.init(countryName:"New", countryCode: "nc"),
    CountryList.init(countryName:"New", countryCode: "nz"),
    CountryList.init(countryName:"Nicaragua", countryCode: "ni"),
    CountryList.init(countryName:"Niger", countryCode: "ne"),
    CountryList.init(countryName:"Nigeria", countryCode: "ng"),
    CountryList.init(countryName:"North", countryCode: "kp"),
    CountryList.init(countryName:"Norway", countryCode: "no"),
    CountryList.init(countryName:"Oman", countryCode: "om"),
    CountryList.init(countryName:"Pakistan", countryCode: "pk"),
    CountryList.init(countryName:"Palau", countryCode: "pw"),
    CountryList.init(countryName:"Palestine", countryCode: "ps"),
    CountryList.init(countryName:"Panama", countryCode: "pa"),
    CountryList.init(countryName:"Papua", countryCode: "pg"),
    CountryList.init(countryName:"Paraguay", countryCode: "py"),
    CountryList.init(countryName:"Peru", countryCode: "pe"),
    CountryList.init(countryName:"Philippines", countryCode: "ph"),
    CountryList.init(countryName:"Poland", countryCode: "pl"),
    CountryList.init(countryName:"Portugal", countryCode: "pt"),
    CountryList.init(countryName:"Puerto", countryCode: "pr"),
    CountryList.init(countryName:"Qatar", countryCode: "qa"),
    CountryList.init(countryName:"Romania", countryCode: "ro"),
    CountryList.init(countryName:"Russia", countryCode: "ru"),
    CountryList.init(countryName:"Rwanda", countryCode: "rw"),
    CountryList.init(countryName:"Samoa", countryCode: "ws"),
    CountryList.init(countryName:"San", countryCode: "sm"),
    CountryList.init(countryName:"Saudi", countryCode: "sa"),
    CountryList.init(countryName:"Senegal", countryCode: "sn"),
    CountryList.init(countryName:"Serbia", countryCode: "rs"),
    CountryList.init(countryName:"Seychelles", countryCode: "sc"),
    CountryList.init(countryName:"Sierra", countryCode: "sl"),
    CountryList.init(countryName:"Singapore", countryCode: "sg"),
    CountryList.init(countryName:"Slovakia", countryCode: "sk"),
    CountryList.init(countryName:"Slovenia", countryCode: "si"),
    CountryList.init(countryName:"Solomon", countryCode: "sb"),
    CountryList.init(countryName:"Somalia", countryCode: "so"),
    CountryList.init(countryName:"South", countryCode: "za"),
    CountryList.init(countryName:"South", countryCode: "kr"),
    CountryList.init(countryName:"Spain", countryCode: "es"),
    CountryList.init(countryName:"Sri", countryCode: "lk"),
    CountryList.init(countryName:"Sudan", countryCode: "sd"),
    CountryList.init(countryName:"Suriname", countryCode: "sr"),
    CountryList.init(countryName:"Sweden", countryCode: "se"),
    CountryList.init(countryName:"Switzerland", countryCode: "ch"),
    CountryList.init(countryName:"Syria", countryCode: "sy"),
    CountryList.init(countryName:"Taiwan", countryCode: "tw"),
    CountryList.init(countryName:"Tajikistan", countryCode: "tj"),
    CountryList.init(countryName:"Tanzania", countryCode: "tz"),
    CountryList.init(countryName:"Thailand", countryCode: "th"),
    CountryList.init(countryName:"Timor-Leste", countryCode: "tl"),
    CountryList.init(countryName:"Togo", countryCode: "tg"),
    CountryList.init(countryName:"Tonga", countryCode: "to"),
    CountryList.init(countryName:"Trinidad", countryCode: "tt"),
    CountryList.init(countryName:"Tunisia", countryCode: "tn"),
    CountryList.init(countryName:"Turkey", countryCode: "tr"),
    CountryList.init(countryName:"Turkmenistan", countryCode: "tm"),
    CountryList.init(countryName:"Tuvalu", countryCode: "tv"),
    CountryList.init(countryName:"Uganda", countryCode: "ug"),
    CountryList.init(countryName:"Ukraine", countryCode: "ua"),
    CountryList.init(countryName:"United", countryCode: "ae"),
    CountryList.init(countryName:"United", countryCode: "gb"),
    CountryList.init(countryName:"United", countryCode: "us"),
    CountryList.init(countryName:"Uruguay", countryCode: "uy"),
    CountryList.init(countryName:"Uzbekistan", countryCode: "uz"),
    CountryList.init(countryName:"Vanuatu", countryCode: "vu"),
    CountryList.init(countryName:"Vatican", countryCode: "va"),
    CountryList.init(countryName:"Venezuela", countryCode: "ve"),
    CountryList.init(countryName:"Vietnam", countryCode: "vi"),
    CountryList.init(countryName:"World", countryCode: "wo"),
    CountryList.init(countryName:"Yemen", countryCode: "ye"),
    CountryList.init(countryName:"Zambia", countryCode: "zm"),
    CountryList.init(countryName:"Zimbabwe", countryCode: "zw"),
]

var arrayOfAvaibleCountries : [CountryList] = []
//
//var someData = """
//Afghanistan    af
//Albania    al
//Algeria    dz
//Andorra    ad
//Angola    ao
//Argentina    ar
//Armenia    am
//Australia    au
//Austria    at
//Azerbaijan    az
//Bahamas    bs
//Bahrain    bh
//Bangladesh    bd
//Barbados    bb
//Belarus    by
//Belgium    be
//Belize    bz
//Benin    bj
//Bermuda    bm
//Bhutan    bt
//Bolivia    bo
//Bosnia And Herzegovina    ba
//Botswana    bw
//Brazil    br
//Brunei    bn
//Bulgaria    bg
//Burkina fasco    bf
//Burundi    bi
//Cambodia    kh
//Cameroon    cm
//Canada    ca
//Cape Verde    cv
//Cayman Islands    ky
//Central African Republic    cf
//Chad    td
//Chile    cl
//China    cn
//Colombia    co
//Comoros    km
//Congo    cg
//Cook islands    ck
//Costa Rica    cr
//Croatia    hr
//Cuba    cu
//Cyprus    cy
//Czech republic    cz
//Denmark    dk
//Djibouti    dj
//Dominica    dm
//Dominican republic    do
//DR Congo    cd
//Ecuador    ec
//Egypt    eg
//El Salvador    sv
//Equatorial Guinea    gq
//Eritrea    er
//Estonia    ee
//Eswatini    sz
//Ethiopia    et
//Fiji    fj
//Finland    fi
//France    fr
//French polynesia    pf
//Gabon    ga
//Gambia    gm
//Georgia    ge
//Germany    de
//Ghana    gh
//Greece    gr
//Grenada    gd
//Guatemala    gt
//Guinea    gn
//Guyana    gy
//Haiti    ht
//Honduras    hn
//Hong kong    hk
//Hungary    hu
//Iceland    is
//India    in
//Indonesia    id
//Iran    ir
//Iraq    iq
//Ireland    ie
//Israel    il
//Italy    it
//Ivory Coast    ci
//Jamaica    jm
//Japan    jp
//Jersey    je
//Jordan    jo
//Kazakhstan    kz
//Kenya    ke
//Kiribati    ki
//Kosovo    xk
//Kuwait    kw
//Kyrgyzstan    kg
//Laos    la
//Latvia    lv
//Lebanon    lb
//Lesotho    ls
//Liberia    lr
//Libya    ly
//Liechtenstein    li
//Lithuania    lt
//Luxembourg    lu
//Macau    mo
//Macedonia    mk
//Madagascar    mg
//Malawi    mw
//Malaysia    my
//Maldives    mv
//Mali    ml
//Malta    mt
//Marshall Islands    mh
//Mauritania    mr
//Mauritius    mu
//Mexico    mx
//Micronesia    fm
//Moldova    md
//Monaco    mc
//Mongolia    mn
//Montenegro    me
//Morocco    ma
//Mozambique    mz
//Myanmar    mm
//Namibia    na
//Nauru    nr
//Nepal    np
//Netherland    nl
//New caledonia    nc
//New zealand    nz
//Nicaragua    ni
//Niger    ne
//Nigeria    ng
//North korea    kp
//Norway    no
//Oman    om
//Pakistan    pk
//Palau    pw
//Palestine    ps
//Panama    pa
//Papua New Guinea    pg
//Paraguay    py
//Peru    pe
//Philippines    ph
//Poland    pl
//Portugal    pt
//Puerto rico    pr
//Qatar    qa
//Romania    ro
//Russia    ru
//Rwanda    rw
//Samoa    ws
//San Marino    sm
//Saudi arabia    sa
//Senegal    sn
//Serbia    rs
//Seychelles    sc
//Sierra Leone    sl
//Singapore    sg
//Slovakia    sk
//Slovenia    si
//Solomon Islands    sb
//Somalia    so
//South africa    za
//South korea    kr
//Spain    es
//Sri Lanka    lk
//Sudan    sd
//Suriname    sr
//Sweden    se
//Switzerland    ch
//Syria    sy
//Taiwan    tw
//Tajikistan    tj
//Tanzania    tz
//Thailand    th
//Timor-Leste    tl
//Togo    tg
//Tonga    to
//Trinidad and tobago    tt
//Tunisia    tn
//Turkey    tr
//Turkmenistan    tm
//Tuvalu    tv
//Uganda    ug
//Ukraine    ua
//United arab emirates    ae
//United kingdom    gb
//United states of america    us
//Uruguay    uy
//Uzbekistan    uz
//Vanuatu    vu
//Vatican    va
//Venezuela    ve
//Vietnam    vi
//World    wo
//Yemen    ye
//Zambia    zm
//Zimbabwe    zw
//"""
//
//let test = """
//{"status":"success","totalResults":435574,"results":[{"article_id":"5b20e0126f8cf2df5030677844941fe7","title":"IМ‡ki cМ§ocuk kaza kurbanД±","link":"https://www.sabah.com.tr/yasam/iki-cocuk-kaza-kurbani-6951255","keywords":["son 24 saat"],"creator":null,"video_url":null,"description":"BurdurвЂ™un Bucak ilcМ§esinde kavsМ§akta 18 MayД±s tarihinde kamyonetle cМ§arpД±sМ§an ve agМ†Д±r yalanan motosiklet suМ€ruМ€cuМ€suМ€ Mehmet Sefa SayД±n (13) ile arkada oturan arkadasМ§Д± Bayram Sezgin (13) kaldД±rД±ldД±klarД± hastanede...DevamД± icМ§in tД±klayД±nД±z","content":"ONLY AVAILABLE IN PAID PLANS","pubDate":"2024-05-23 07:49:00","image_url":"https://iasbh.tmgrup.com.tr/381894/752/395/0/328/786/741?u=https://isbh.tmgrup.com.tr/sbh/2024/05/23/iki-cocuk-kaza-kurbani-1716450464836.jpg","source_id":"sabah","source_priority":37530,"source_url":"https://www.sabah.com.tr","source_icon":"https://i.bytvi.com/domain_icons/sabah.png","language":"turkish","country":["turkey"],"category":["top"],"ai_tag":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment_stats":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","ai_region":"ONLY AVAILABLE IN CORPORATE PLANS","ai_org":"ONLY AVAILABLE IN CORPORATE PLANS"},{"article_id":"c2f07828570ee1d5d6024349d4141c7f","title":"IМ‡stanbul'un kirasД± en pahalД± ilcМ§esi 51 bin 591 TL ile SarД±yer oldu!","link":"https://emlakkulisi.com.tr/istanbulun-kirasi-en-pahali-ilcesi-51-bin-591-tl-ile-sariyer-oldu/801995","keywords":null,"creator":null,"video_url":null,"description":"IМ‡stanbul'da kirasД± en yuМ€ksek ve en duМ€sМ§uМ€k olan ilcМ§eler belli oldu. Kirada en pahalД± ilcМ§e SarД±yer olurken, kirasД± en duМ€sМ§uМ€k ilcМ§e de ArnavutkoМ€y oldu. Peki vatandasМ§lar kiralarla ilgili neler soМ€yledi? IМ‡sМ§te o paylasМ§Д±m ve gelen yorumlar...","content":"ONLY AVAILABLE IN PAID PLANS","pubDate":"2024-05-23 07:49:00","image_url":"https://cdn.emlakkulisi.com.tr/resim/orjinal/Njc1ODkwND-istanbulun-kirasi-en-pahali-ilcesi-51-bin-591-tl-ile-sariyer-oldu.jpg","source_id":"emlakkulisi","source_priority":2070312,"source_url":"https://emlakkulisi.com","source_icon":"https://i.bytvi.com/domain_icons/emlakkulisi.png","language":"turkish","country":["turkey"],"category":["business"],"ai_tag":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment_stats":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","ai_region":"ONLY AVAILABLE IN CORPORATE PLANS","ai_org":"ONLY AVAILABLE IN CORPORATE PLANS"},{"article_id":"df00069ab1377738f218a7944845159d","title":"Goa man becomes worldвЂ™s first triple amputee to climb Mt Everest Base Camp","link":"https://www.news9live.com/sports/others-sports/goa-man-becomes-worlds-first-triple-amputee-to-climb-mt-everest-base-camp-2547163","keywords":["other sports"],"creator":["Sparsh Vyas"],"video_url":null,"description":"Kaushik lost his both limbs below his knees and a hand aged 9 after an unfortunate electrocution accident in Haryana.","content":"ONLY AVAILABLE IN PAID PLANS","pubDate":"2024-05-23 07:49:00","image_url":"https://images.news9live.com/wp-content/uploads/2024/05/Tinkesh-Kaushik-1.jpg","source_id":"news9live","source_priority":193096,"source_url":"https://www.news9live.com","source_icon":"https://i.bytvi.com/domain_icons/news9live.png","language":"english","country":["india"],"category":["top"],"ai_tag":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment_stats":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","ai_region":"ONLY AVAILABLE IN CORPORATE PLANS","ai_org":"ONLY AVAILABLE IN CORPORATE PLANS"},{"article_id":"b2627f216bc2c68882f22418b297aeb3","title":"MetaHomes Merayakan Seni dan Inovasi dengan Seniman Lukisan Cahaya Terkemuka, Roy Wang","link":"https://www.globenewswire.com/fr/news-release/2024/05/23/2887036/0/id/MetaHomes-Merayakan-Seni-dan-Inovasi-dengan-Seniman-Lukisan-Cahaya-Terkemuka-Roy-Wang.html","keywords":null,"creator":null,"video_url":null,"description":"DUBAI, Uni Emirat Arab, May 23, 2024 (GLOBE NEWSWIRE) -- Pada 18 Mei 2024, MetaHomes mendapatkan kehormatan untuk berpartisipasi dalam acara kreasi melukis dengan cahaya berskala besar \"Chinese Dragon\", yang diselenggarakan oleh seniman lukisan cahaya terkemuka, Roy Wang, di Dubai. Kolaborasi ini menambahkan sentuhan budaya Tiongkok ke lanskap seni Dubai yang semarak, sehingga semakin memperkuat komitmen MetaHomes terhadap integrasi dan inovasi budaya.","content":"ONLY AVAILABLE IN PAID PLANS","pubDate":"2024-05-23 07:49:00","image_url":null,"source_id":"globenewswire_fr","source_priority":21323,"source_url":"https://www.globenewswire.com/fr","source_icon":"https://i.bytvi.com/domain_icons/globenewswire_fr.jpg","language":"english","country":["france"],"category":["entertainment"],"ai_tag":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment_stats":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","ai_region":"ONLY AVAILABLE IN CORPORATE PLANS","ai_org":"ONLY AVAILABLE IN CORPORATE PLANS"},{"article_id":"699f42638bd3838c0a5b3e2c0bd26b12","title":"SrusМЊila se pozornica na predizbornom skupu u Meksiku. 9 mrtvih, meД‘u njima dijete","link":"https://www.index.hr/vijesti/clanak/srusila-se-pozornica-na-predizbornom-skupu-u-meksiku-9-mrtvih-medju-njima-dijete/2567361.aspx","keywords":["vijesti"],"creator":null,"video_url":null,"description":"NAJMANJE devet osoba je poginulo, a oko 50 ih je ozlijeД‘eno nakon sМЊto se srusМЊila pozornica na predizbornom skupu u Meksiku.","content":"ONLY AVAILABLE IN PAID PLANS","pubDate":"2024-05-23 07:49:00","image_url":"https://bucket.index.hr/b/index/4a0de4db-2577-4783-9a68-e78037bdc9a5.jpg","source_id":"index_hr","source_priority":52503,"source_url":"https://www.index.hr","source_icon":"https://i.bytvi.com/domain_icons/index_hr.png","language":"croatian","country":["croatia"],"category":["world"],"ai_tag":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment_stats":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","ai_region":"ONLY AVAILABLE IN CORPORATE PLANS","ai_org":"ONLY AVAILABLE IN CORPORATE PLANS"},{"article_id":"5d6100008d211c1c5f2f81aebe795c5e","title":"MetaHomes аёўаёЃаёўа№€аё­аё‡аё‡аёІаё™аёЁаёґаёҐаё›аё°а№ЃаёҐаё°аё™аё§аё±аё•аёЃаёЈаёЈаёЎаёЈа№€аё§аёЎаёЃаё±аёљаё„аёёаё“ Roy Wang аёЁаёґаёҐаё›аёґаё™аё™аё±аёЃаё§аёІаё”аё аёІаёћаё”а№‰аё§аёўа№ЃаёЄаё‡аёЉаё·а№€аё­аё”аё±аё‡аёЈаё°аё”аё±аёља№‚аёҐаёЃ","link":"https://www.globenewswire.com/fr/news-release/2024/05/23/2887036/0/th/MetaHomes-%E0%B8%A2%E0%B8%81%E0%B8%A2%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B8%87%E0%B8%B2%E0%B8%99%E0%B8%A8%E0%B8%B4%E0%B8%A5%E0%B8%9B%E0%B8%B0%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%99%E0%B8%A7%E0%B8%B1%E0%B8%95%E0%B8%81%E0%B8%A3%E0%B8%A3%E0%B8%A1%E0%B8%A3%E0%B9%88%E0%B8%A7%E0%B8%A1%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B8%84%E0%B8%B8%E0%B8%93-Roy-Wang-%E0%B8%A8%E0%B8%B4%E0%B8%A5%E0%B8%9B%E0%B8%B4%E0%B8%99%E0%B8%99%E0%B8%B1%E0%B8%81%E0%B8%A7%E0%B8%B2%E0%B8%94%E0%B8%A0%E0%B8%B2%E0%B8%9E%E0%B8%94%E0%B9%89%E0%B8%A7%E0%B8%A2%E0%B9%81%E0%B8%AA%E0%B8%87%E0%B8%8A%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%94%E0%B8%B1%E0%B8%87%E0%B8%A3%E0%B8%B0%E0%B8%94%E0%B8%B1%E0%B8%9A%E0%B9%82%E0%B8%A5%E0%B8%81.html","keywords":null,"creator":null,"video_url":null,"description":"аё”аё№а№„аёљ аёЄаё«аёЈаё±аёђаё­аёІаё«аёЈаё±аёља№Ђаё­аёЎаёґа№ЂаёЈаё•аёЄа№Њ, May 23, 2024 (GLOBE NEWSWIRE) -- а№ѓаё™аё§аё±аё™аё—аёµа№€ 18 аёћаё¤аё©аё аёІаё„аёЎ 2024 MetaHomes аёЈаё№а№‰аёЄаё¶аёЃа№Ђаё›а№‡аё™а№ЂаёЃаёµаёўаёЈаё•аёґаё­аёўа№€аёІаё‡аёўаёґа№€аё‡аё—аёµа№€а№„аё”а№‰а№Ђаё‚а№‰аёІаёЈа№€аё§аёЎаё‡аёІаё™аёЄаёЈа№‰аёІаё‡аёЄаёЈаёЈаё„а№Њаё аёІаёћаё§аёІаё”аё”а№‰аё§аёўа№ЃаёЄаё‡аё„аёЈаё±а№‰аё‡а№ѓаё«аёЌа№€ \"Chinese Dragon\" аё‹аё¶а№€аё‡аё€аё±аё”аё‚аё¶а№‰аё™а№ѓаё™аё”аё№а№„аёља№‚аё”аёўаё„аёёаё“ Roy Wang аёЁаёґаёҐаё›аёґаё™аё™аё±аёЃаё§аёІаё”аё аёІаёћаё”а№‰аё§аёўа№ЃаёЄаё‡аёЉаё·а№€аё­аё”аё±аё‡аёЈаё°аё”аё±аёља№‚аёҐаёЃ аё„аё§аёІаёЎаёЈа№€аё§аёЎаёЎаё·аё­аё„аёЈаё±а№‰аё‡аё™аёµа№‰а№„аё”а№‰аёўаёЃаёЈаё°аё”аё±аёљаё„аё§аёІаёЎаёЄаё±аёЎаёћаё±аё™аёа№Њаё‚аё­аё‡аё§аё±аё’аё™аёаёЈаёЈаёЎаё€аёµаё™а№ѓаё«а№‰аёЃаё±аёљаё аё№аёЎаёґаё—аё±аёЁаё™а№Њаё—аёІаё‡аёЁаёґаёҐаё›аё°аё­аё±аё™аёЎаёµаёЉаёµаё§аёґаё•аёЉаёµаё§аёІаё‚аё­аё‡аё”аё№а№„аёљ аё‹аё¶а№€аё‡аё•аё­аёЃаёўа№‰а№ЌаёІаё„аё§аёІаёЎаёЎаёёа№€аё‡аёЎаё±а№€аё™аё‚аё­аё‡ MetaHomes а№ѓаё™аёЃаёІаёЈаёљаё№аёЈаё“аёІаёЃаёІаёЈаё”а№‰аёІаё™аё§аё±аё’аё™аёаёЈаёЈаёЎа№ЃаёҐаё°аё™аё§аё±аё•аёЃаёЈаёЈаёЎ","content":"ONLY AVAILABLE IN PAID PLANS","pubDate":"2024-05-23 07:49:00","image_url":null,"source_id":"globenewswire_fr","source_priority":21323,"source_url":"https://www.globenewswire.com/fr","source_icon":"https://i.bytvi.com/domain_icons/globenewswire_fr.jpg","language":"thai","country":["france"],"category":["entertainment"],"ai_tag":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment_stats":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","ai_region":"ONLY AVAILABLE IN CORPORATE PLANS","ai_org":"ONLY AVAILABLE IN CORPORATE PLANS"},{"article_id":"d273a3046b7cc19d86f3fddddf224d41","title":"SogМ†an fiyatlarД± tarlada 5 liraya duМ€sМ§tuМ€","link":"https://www.haber16.com/sogan-fiyatlari-tarlada-5-liraya-dustu/1456129/","keywords":null,"creator":null,"video_url":null,"description":"TuМ€rkiye'nin turfanda sogМ†an ihtiyacД±nД±n oМ€nemli bir boМ€luМ€muМ€nuМ€ karsМ§Д±layan Adana'da sogМ†anД±n hasadД± suМ€rerken tarlada kilogram fiyatД± 5-6 liraya kadar duМ€sМ§tuМ€.","content":"ONLY AVAILABLE IN PAID PLANS","pubDate":"2024-05-23 07:49:00","image_url":"https://www.haber16.com/images/genel/detayfoto_1.jpg?v=2023040500200720230613030833","source_id":"haber16","source_priority":6562448,"source_url":"https://www.haber16.com","source_icon":"https://i.bytvi.com/domain_icons/haber16.png","language":"turkish","country":["turkey"],"category":["business"],"ai_tag":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment_stats":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","ai_region":"ONLY AVAILABLE IN CORPORATE PLANS","ai_org":"ONLY AVAILABLE IN CORPORATE PLANS"},{"article_id":"631ebf2cbdce8d274fa59f5abc00a471","title":"РћРіР»СЏРґ СЃРµР·РѕРЅСѓ Р§РµР»СЃС–: РЅРµ РІСЃРµ С‚Р°Рє РѕРґРЅРѕР·РЅР°С‡РЅРѕ С‚Р° С„Р°РЅС‚Р°СЃС‚РёС‡РЅР° РіСЂР° РљРѕСѓР»Р° РџР°Р»РјРµСЂР°","link":"https://football.ua/fiction/531636-ogljad-sezonu-chelsi-ne-vse-tak-odnoznachno-ta-fantastichna-gra-koula-palmera.html","keywords":["С„СѓС‚Р±РѕР»"],"creator":null,"video_url":null,"description":"Р”Рѕ РІР°С€РѕС–М€ СѓРІР°РіРё РјР°С‚РµСЂС–Р°Р» СЃС‚РѕСЃРѕРІРЅРѕ РІРёСЃС‚СѓРїС–РІ Р§РµР»СЃС– Сѓ СЃРµР·РѕРЅС–-2023/24.","content":"ONLY AVAILABLE IN PAID PLANS","pubDate":"2024-05-23 07:49:00","image_url":"https://s.ill.in.ua/i/news/136x91/531/531636.jpg","source_id":"football_ua","source_priority":216792,"source_url":"https://football.ua","source_icon":"https://i.bytvi.com/domain_icons/football_ua.png","language":"ukrainian","country":["ukraine"],"category":["top"],"ai_tag":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment_stats":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","ai_region":"ONLY AVAILABLE IN CORPORATE PLANS","ai_org":"ONLY AVAILABLE IN CORPORATE PLANS"},{"article_id":"baf7c250d84b5053a94f431cfcdc2687","title":"EskisМ§ehir, Bursa, KuМ€tahya ve Bilecik dikkat bu uyarД± sizin icМ§in! DuМ€n geldi buguМ€n hala devam ediyor... Yetkililer olasД± olumsuzluklara karsМ§Д± uyardД±","link":"https://www.tv100.com/eskisehir-bursa-kutahya-ve-bilecik-dikkat-bu-uyari-sizin-icin-dun-geldi-bugun-hala-devam-ediyor-yetkililer-olasi-olumsuzluklara-karsi-uyardi-haber-756342","keywords":null,"creator":null,"video_url":null,"description":"EskisМ§ehir, Bursa ve Bilecik dikkat bu uyarД± sizin icМ§in. Meteoroloji 3. BoМ€lge MuМ€duМ€rluМ€gМ†uМ€ tarafД±ndan verilen resmi uyarД±nД±n ardД±ndan boМ€lgede etkili olan sМ§iddetli sagМ†anak yagМ†mur buguМ€n ve yarД±nda etkisini goМ€stermeye devam edecek. Yetkililer olasД± bir olumsuzlugМ†a karsМ§Д± oМ€nemle uyardД±.","content":"ONLY AVAILABLE IN PAID PLANS","pubDate":"2024-05-23 07:49:00","image_url":"https://i.tv100.com/2/150/84/storage/files/images/2024/05/23/votrlhjtrkihj-oi1a_cover.jpg","source_id":"tv100","source_priority":1254654,"source_url":"https://www.tv100.com","source_icon":"https://i.bytvi.com/domain_icons/tv100.png","language":"turkish","country":["turkey"],"category":["top"],"ai_tag":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment_stats":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","ai_region":"ONLY AVAILABLE IN CORPORATE PLANS","ai_org":"ONLY AVAILABLE IN CORPORATE PLANS"},{"article_id":"71c3abd50bacabd818d6d09e9651fba3","title":"1 milyon yД±llД±k kafatasД±nД±n gizemi cМ§oМ€zuМ€lduМ€... 'Ejderha adam' fenomeni nedir?","link":"https://www.cumhuriyet.com.tr/bilim-teknoloji/1-milyon-yillik-kafatasinin-gizemi-cozuldu-ejderha-adam-fenomeni-2209664","keywords":null,"creator":null,"video_url":null,"description":"Bilim insanlarД±, CМ§in'de bulunan antik kafataslarД±nД±n gizemini cМ§oМ€zduМ€. Bir cМ§ift kafatasД±nД±n ardД±ndan bir milyon yД±llД±k bir hikaye cМ§Д±ktД±.","content":"ONLY AVAILABLE IN PAID PLANS","pubDate":"2024-05-23 07:49:00","image_url":"https://www.cumhuriyet.com.tr/Archive/2024/5/23/2209664/kapak_104903.jpg","source_id":"cumhuriyet","source_priority":40733,"source_url":"https://www.cumhuriyet.com.tr","source_icon":"https://i.bytvi.com/domain_icons/cumhuriyet.png","language":"turkish","country":["turkey"],"category":["top"],"ai_tag":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","sentiment_stats":"ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS","ai_region":"ONLY AVAILABLE IN CORPORATE PLANS","ai_org":"ONLY AVAILABLE IN CORPORATE PLANS"}],"nextPage":"1716450540824257133"}
//"""
