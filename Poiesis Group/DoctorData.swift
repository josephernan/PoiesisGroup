//
//  DoctorData.swift
//  Poiesis Group
//
//  Created by POLARIS on 11/22/17.
//  Copyright © 2017 psicologosencostarica. All rights reserved.
//

import Foundation
import UIKit

class DoctorData {

    // department name
    // bit index               0             1            2              3          4         5
    let departmentName = [ "individual", "pediatric", "adolescents", "couples", "family", "coaching" ]

    // city name
    // index                 0           1          2          3           4        5              6
    let cityNameList = [ "San Jose", "Cartago", "Heredia", "Alajuela", "Limon", "Guanacaste", "Puntarenas" ]
    
    lazy var doctorDetailList : [DoctorInfo] = {
        var datalist = [DoctorInfo]()
        return datalist
    }()
    
    func doctorList() {
        
        //  -----   1   -----   //
        let doctor1 = DoctorInfo()
        
        doctor1.doctorName = "Dr. Carlos Bonilla"
        doctor1.doctorEmail = "carlosbonilla@gmail.com"
        doctor1.doctorPhoneNumber = "+50687014284"
        doctor1.doctorWhatsApp = "+50687014284"
        doctor1.doctorFacebookId = "536227682"
        doctor1.department = 0b00101001 // "individual, couple, coaching"
        doctor1.doctorCity = "Pinares"
        doctor1.doctorCityIdx = 0 // San Jose
        doctor1.doctorAdress = "Torre Médica, Momentum Pinares, Piso 4, Consultorio C-38. Curridabat, San José, Costa Rica"
        doctor1.doctorPhoto = UIImage(named: "pho1_carlos.jpg")
        doctor1.doctorInfo = "doctor1_detail"
        
        self.doctorDetailList.append(doctor1)
        
        //  -----   2   -----   //
        let doctor2 = DoctorInfo()
        
        doctor2.doctorName = "Dra. Marisol Montero"
        doctor2.doctorEmail = "marisolmonterocarvajal@gmail.com"
        doctor2.doctorPhoneNumber = "+50683269782"
        doctor2.doctorWhatsApp = "+50683269782"
        doctor2.doctorFacebookId = "1075631791"
        doctor2.department = 0b00001111 // "individual, Pediatric, adolescents, couple"
        doctor2.doctorCity = "Pianres"
        doctor2.doctorCityIdx = 0 // San José
        doctor2.doctorAdress = "Torre Médica, Momentum Pinares, Piso 4, Consultorio C-38. Curridabat, San José, Costa Rica"
        doctor2.doctorPhoto = UIImage(named: "pho2_marisol.jpg")
        doctor2.doctorInfo = "doctor2_detail"
        
        self.doctorDetailList.append(doctor2)
        
        //  -----   3   -----   //
        let doctor3 = DoctorInfo()
        
        doctor3.doctorName = "Dr. William Buckley"
        doctor3.doctorEmail = "willbuckley04@gmail.com"
        doctor3.doctorPhoneNumber = "+50689938376"
        doctor3.doctorWhatsApp = "+50689938376"
        doctor3.doctorFacebookId = "618363123"
        doctor3.department = 0b00011111 // "individual, pediatric, adolescents, couple, family"
        doctor3.doctorCity = "Pinares"
        doctor3.doctorCityIdx = 0 // San José
        doctor3.doctorAdress = "Torre Médica, Momentum Pinares, Piso 4, Consultorio C-38. Curridabat, San José, Costa Rica"
        doctor3.doctorPhoto = UIImage(named: "pho3_william.jpg")
        doctor3.doctorInfo = "doctor3_detail"
        
        self.doctorDetailList.append(doctor3)
        
        //  -----   4   -----   //
        let doctor4 = DoctorInfo()
        
        doctor4.doctorName = "Dra. Fernanda Sánchez"
        doctor4.doctorEmail = "dra.mafernandasanchez@gmail.com"
        doctor4.doctorPhoneNumber = "+50683361844"
        doctor4.doctorWhatsApp = "+50683361844"
        doctor4.doctorFacebookId = "100000166461"
        doctor4.department = 0b00111001 // "individual, couple, family, coaching"
        doctor4.doctorCity = "Pinares"
        doctor4.doctorCityIdx = 0 // "San José"
        doctor4.doctorAdress = "Torre Médica, Momentum Pinares, Piso 4, Consultorio C-38. Curridabat, San José, Costa Rica"
        doctor4.doctorPhoto = UIImage(named: "pho4_fernand.jpg")
        doctor4.doctorInfo = "doctor4_detail"
        
        self.doctorDetailList.append(doctor4)
        
        //  -----   5   -----   //
        let doctor5 = DoctorInfo()
        
        doctor5.doctorName = "Dra. Elena Viejo"
        doctor5.doctorEmail = "elenaviejoallende@gmail.com"
        doctor5.doctorPhoneNumber = "+50664316212"
        doctor5.doctorWhatsApp = "+50664316212"
        doctor5.doctorFacebookId = "1443823302"
        doctor5.department = 0b00000111 // "Pediatric, adolescents, individual"
        doctor5.doctorCity = "Escazú"
        doctor5.doctorCityIdx = 0 // "San José"
        doctor5.doctorAdress = "Trejos Monteralegre, Escazú"
        doctor5.doctorPhoto = UIImage(named: "pho5_elena.png")
        doctor5.doctorInfo = "doctor5_detail"
        
        self.doctorDetailList.append(doctor5)
        
        //  -----   6   -----   //
        let doctor6 = DoctorInfo()
        
        doctor6.doctorName = "Dr. Raul Olmedo"
        doctor6.doctorEmail = "raul.olmedo@gmail.com"
        doctor6.doctorPhoneNumber = "+50688988866"
        doctor6.doctorWhatsApp = "+50688988866"
        doctor6.doctorFacebookId = "1596036144"
        doctor6.department = 0b00011111 //  "Pediatric, adolescents, individual, couples, family"
        doctor6.doctorCity = "Escazú"
        doctor6.doctorCityIdx = 0 // "San José"
        doctor6.doctorAdress = "Trejos Monteralegre"
        doctor6.doctorPhoto = UIImage(named: "pho6_raul.png")
        doctor6.doctorInfo = "doctor6_detail"
        
        self.doctorDetailList.append(doctor6)
        
        //  -----   7   -----   //
        let doctor7 = DoctorInfo()
        
        doctor7.doctorName = "Dra. Pamela Peinador"
        doctor7.doctorEmail = "pamelapeinador@gmail.com"
        doctor7.doctorPhoneNumber = "+50688280283"
        doctor7.doctorWhatsApp = "+50688257991"
        doctor7.doctorFacebookId = "357812544659899"
        doctor7.department = 0b00011111 // "Pediatric, adolescents, individual, couples, family"
        doctor7.doctorCity = "Escazú y Sabana"
        doctor7.doctorCityIdx = 0 // "San José"
        doctor7.doctorAdress = "Trejos Montealegre, Escazú y Sabana"
        doctor7.doctorPhoto = UIImage(named: "pho7_pamela.png")
        doctor7.doctorInfo = "doctor7_detail"
        
        self.doctorDetailList.append(doctor7)
        
        //  -----   8   -----   //
        let doctor8 = DoctorInfo()
        
        doctor8.doctorName = "Dra. Carol Ugalde"
        doctor8.doctorEmail = "consulta@psicologosencostarica.com"
        doctor8.doctorPhoneNumber = "+50688257991"
        doctor8.doctorWhatsApp = "+50688257991"
        doctor8.doctorFacebookId = "357812544659899"
        doctor8.department = 0b00011111 // "Pediatric, adolescents, individual, couple, family"
        doctor8.doctorCity = "Centro"
        doctor8.doctorCityIdx = 3 // "Alajuela"
        doctor8.doctorAdress = "Alajuela Centro"
        doctor8.doctorPhoto = UIImage(named: "pho8_alajuela.png")
        doctor8.doctorInfo = "doctor8_detail"
        
        self.doctorDetailList.append(doctor8)
        
        //  -----   9   -----   //
        let doctor9 = DoctorInfo()
        
        doctor9.doctorName = "Dra. Marianela Ulate"
        doctor9.doctorEmail = "consulta@psicologosencostarica.com"
        doctor9.doctorPhoneNumber = "+50688257991"
        doctor9.doctorWhatsApp = "+50688257991"
        doctor9.doctorFacebookId = "357812544659899"
        doctor9.department = 0b00000111 // "Pediatric, adolescents, individual"
        doctor9.doctorCity = "Centro"
        doctor9.doctorCityIdx = 2 // "Heredia"
        doctor9.doctorAdress = "Heredia"
        doctor9.doctorPhoto = UIImage(named: "pho9_marianela.png")
        doctor9.doctorInfo = "doctor9_detail"
        
        self.doctorDetailList.append(doctor9)
        
        //  -----   10   -----   //
        let doctor10 = DoctorInfo()
        
        doctor10.doctorName = "Dra. Xiomara Solorzano"
        doctor10.doctorEmail = "consulta@psicologosencostarica.com"
        doctor10.doctorPhoneNumber = "+50688257991"
        doctor10.doctorWhatsApp = "+50688257991"
        doctor10.doctorFacebookId = "357812544659899/"
        doctor10.department = 0b00111111 // "Pediatric, adolescents, individual, couples, family, coaching"
        doctor10.doctorCity = "Centro"
        doctor10.doctorCityIdx = 1 // "Cartago"
        doctor10.doctorAdress = "Cartago Centro"
        doctor10.doctorPhoto = UIImage(named: "pho10_xiomara.png")
        doctor10.doctorInfo = "doctor10_detail"
        
        self.doctorDetailList.append(doctor10)
        
        //  -----  11   -----   //
        let doctor11 = DoctorInfo()
        
        doctor11.doctorName = "Dra. Yorleny Camacho"
        doctor11.doctorEmail = "consulta@psicologosencostarica.com"
        doctor11.doctorPhoneNumber = "+50688257991"
        doctor11.doctorWhatsApp = "+50688257991"
        doctor11.doctorFacebookId = "357812544659899"
        doctor11.department = 0b00011111  // "Pediatric, adolescents, individual, couple, family"
        doctor11.doctorCity = "Barreal de Heredia"
        doctor11.doctorCityIdx = 2 // "Heredia"
        doctor11.doctorAdress = "Barreal de Heredia"
        doctor11.doctorPhoto = UIImage(named: "emptyperson.png")
        doctor11.doctorInfo = "doctor11_detail"
        
        self.doctorDetailList.append(doctor11)
        
        //  -----  12   -----   //
        let doctor12 = DoctorInfo()
        
        doctor12.doctorName = "Dr. Maykol Solorzano"
        doctor12.doctorEmail = "consulta@psicologosencostarica.com"
        doctor12.doctorPhoneNumber = "+50688257991"
        doctor12.doctorWhatsApp = "+50688257991"
        doctor12.doctorFacebookId = "357812544659899"
        doctor12.department = 0b00011111  // "Pediatric, adolescents, individual, couple, family"
        doctor12.doctorCity = "El Roble"
        doctor12.doctorCityIdx = 3 // "Alajuela"
        doctor12.doctorAdress = "El Roble de Alajuela"
        doctor12.doctorPhoto = UIImage(named: "emptyperson.png")
        doctor12.doctorInfo = "doctor12_detail"
        
        self.doctorDetailList.append(doctor12)
        
        //  -----  13   -----   //
        let doctor13 = DoctorInfo()
        
        doctor13.doctorName = "Dra. Sandra Natalia Venegas Gutiérrez"
        doctor13.doctorEmail = "consulta@psicologosencostarica.com"
        doctor13.doctorPhoneNumber = "+50622715200"
        doctor13.doctorWhatsApp = "+50688257991"
        doctor13.doctorFacebookId = "357812544659899"
        doctor13.department = 0b00011111  // "Pediatric, adolescents, individual, couple, family"
        doctor13.doctorCity = "El Roble"
        doctor13.doctorCityIdx = 5 // "Guanacaste"
        doctor13.doctorAdress = "El Roble de Alajuela"
        doctor13.doctorPhoto = UIImage(named: "emptyperson.png")
        doctor13.doctorInfo = "doctor13_detail"
        
        self.doctorDetailList.append(doctor13)
    
        //  -----  14   -----   //
        let doctor14 = DoctorInfo()
        
        doctor14.doctorName = "Dra. Melissa Soto"
        doctor14.doctorEmail = "consulta@psicologosencostarica.com"
        doctor14.doctorPhoneNumber = "+50622715200"
        doctor14.doctorWhatsApp = "+50688257991"
        doctor14.doctorFacebookId = "357812544659899"
        doctor14.department = 0b00011111  // "Pediatric, adolescents, individual, couple, family"
        doctor14.doctorCity = "El Roble"
        doctor14.doctorCityIdx = 6 // "Puntarenas"
        doctor14.doctorAdress = "El Roble de Alajuela"
        doctor14.doctorPhoto = UIImage(named: "emptyperson.png")
        doctor14.doctorInfo = "doctor14_detail"
        
        self.doctorDetailList.append(doctor14)
        
        //  -----  15   -----   //
        let doctor15 = DoctorInfo()
        
        doctor15.doctorName = "Dr. Alexis Espinoza Morera"
        doctor15.doctorEmail = "consulta@psicologosencostarica.com"
        doctor15.doctorPhoneNumber = "+50622715200"
        doctor15.doctorWhatsApp = "+50688257991"
        doctor15.doctorFacebookId = "357812544659899"
        doctor15.department = 0b00011111  // "Pediatric, adolescents, individual, couple, family"
        doctor15.doctorCity = "El Roble"
        doctor15.doctorCityIdx = 6 // "Puntarenas"
        doctor15.doctorAdress = "El Roble de Alajuela"
        doctor15.doctorPhoto = UIImage(named: "emptyperson.png")
        doctor15.doctorInfo = "doctor15_detail"
        
        self.doctorDetailList.append(doctor15)
        
        //  -----  16   -----   //
        let doctor16 = DoctorInfo()
        
        doctor16.doctorName = "Dra. Carmen Esquivel Vargas"
        doctor16.doctorEmail = "consulta@psicologosencostarica.com"
        doctor16.doctorPhoneNumber = "+50622715200"
        doctor16.doctorWhatsApp = "+50688257991"
        doctor16.doctorFacebookId = "357812544659899"
        doctor16.department = 0b00011111  // "Pediatric, adolescents, individual, couple, family"
        doctor16.doctorCity = "El Roble"
        doctor16.doctorCityIdx = 4 // "Limon"
        doctor16.doctorAdress = "El Roble de Alajuela"
        doctor16.doctorPhoto = UIImage(named: "emptyperson.png")
        doctor16.doctorInfo = "doctor16_detail"
        
        self.doctorDetailList.append(doctor16)
    }
}
