//
//  Show.swift
//  Zorella
//
//  Created by Kerby Jean on 2017-08-27.
//  Copyright © 2017 Flaint, Inc. All rights reserved.
//



struct Show {
    
    var model: [Model]
    var title: String
    var name: String
    
    static var shows = [
        Show(model: Model.models, title: "Black and white day", name: "Adonis Bosso"),
        Show(model: Model.models, title: "Some questions", name: "Amandla Stenberg"),
        Show(model: Model.models, title: "What I like", name: "Anais Mali"),
        Show(model: Model.models, title: "Messing around", name: "Imaan Hammam"),
        Show(model: Model.models, title: "Behind the scene", name: "Lucky Blue Smith"),
        Show(model: Model.models, title: "In Paris", name: "Ondria Hardin"),
        Show(model: Model.models, title: "Make up and shoot", name: "Malaika Firth"),
        Show(model: Model.models, title: "Self reflection", name: "Soo Joo Park"),
        Show(model: Model.models, title: "How I do my laundry", name: "Sang Woo Kim")
    ]
}
