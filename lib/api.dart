import 'dart:convert';
import 'package:http/http.dart' as http ;

class ApiConnection {
  Future<List<Station>> fetchData() async {
    String url = 'https://data.ntpc.gov.tw/od/data/api/54DDDC93-589C-4858-9C95-18B2046CC1FC?\$format=json&\$top=2';

    var response = await http.get(url);

    if (response.statusCode == 200 ) {
      print("Get Success");

      List<Station> stationFromJson(String str) => List<Station>.from(json.decode(str).map((x) => Station.fromJson(x)));

      final listStation = stationFromJson(response.body);

      final s1 = listStation[0];

      print(s1.sna);

      return listStation;
    } else {
      throw Exception('Failed to load post');
    }

  }

}



class Station {
  String sno;
  String sna;
  String tot;
  String sbi;
  String sarea;
  String mday;
  String lat;
  String lng;
  String ar;
  String sareaen;
  String snaen;
  String aren;
  String bemp;
  String act;

  Station({
    this.sno,
    this.sna,
    this.tot,
    this.sbi,
    this.sarea,
    this.mday,
    this.lat,
    this.lng,
    this.ar,
    this.sareaen,
    this.snaen,
    this.aren,
    this.bemp,
    this.act,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
    sno: json["sno"],
    sna: json["sna"],
    tot: json["tot"],
    sbi: json["sbi"],
    sarea: json["sarea"],
    mday: json["mday"],
    lat: json["lat"],
    lng: json["lng"],
    ar: json["ar"],
    sareaen: json["sareaen"],
    snaen: json["snaen"],
    aren: json["aren"],
    bemp: json["bemp"],
    act: json["act"],
  );

  Map<String, dynamic> toJson() => {
    "sno": sno,
    "sna": sna,
    "tot": tot,
    "sbi": sbi,
    "sarea": sarea,
    "mday": mday,
    "lat": lat,
    "lng": lng,
    "ar": ar,
    "sareaen": sareaen,
    "snaen": snaen,
    "aren": aren,
    "bemp": bemp,
    "act": act,
  };
}


