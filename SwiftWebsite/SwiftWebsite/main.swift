//
//  main.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 09/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

func main() {
	makeIndex()
	makeKurs()
	makeArrangementer()
	makePriser()
//	makePåmleding()
	makeOmOss()
	makeFaq()
	makeStyreverv()
	makeÅrsmøtet2020()
    makeÅrsmøtet2022()
    makeReferatÅrsmøtet2022()
    makeÅrsmøtet2023()
    makeÆrø()
    makeSlottsrock22h()
    
	Website.shared.render()
}
main()
