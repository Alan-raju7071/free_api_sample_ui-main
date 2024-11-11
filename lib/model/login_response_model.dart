// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Loginresmodel loginresmodelfromjson(String str) =>
 Loginresmodel.fromJson(json.decode(str));



class Loginresmodel {
    String? refresh;
    String? access;
    int? id;
    String? name;
    String? place;
    String? email;

    Loginresmodel({
        this.refresh,
        this.access,
        this.id,
        this.name,
        this.place,
        this.email,
    });

    factory Loginresmodel.fromJson(Map<String, dynamic> json) => Loginresmodel(
        refresh: json["refresh"],
        access: json["access"],
        id: json["id"],
        name: json["name"],
        place: json["place"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "id": id,
        "name": name,
        "place": place,
        "email": email,
    };
}
