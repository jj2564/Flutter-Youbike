import 'dart:convert';
import 'package:http/http.dart' as http ;

class ApiConnection {
  Future<List<Station>> fetchData(int count) async {
    String url = 'https://data.ntpc.gov.tw/od/data/api/54DDDC93-589C-4858-9C95-18B2046CC1FC?\$format=json&\$top=$count';

    var response = await http.get(url);

    if (response.statusCode == 200 ) {
      print("Get Success");

      List<Station> stationFromJson(String str) => List<Station>.from(json.decode(str).map((x) => Station.fromJson(x)));

      final listStation = stationFromJson(response.body);

      return listStation;
    } else {
      throw Exception('Failed to load post');
    }

  }
}


class Station {
  /// act(場站是否暫停營運)
  final String act;

  /// ar(中文地址)
  final String ar;

  /// aren(英文地址)
  final String aren;

  /// bemp(可還空位數)
  final String bemp;

  /// lat(緯度)
  final String lat;

  /// lng(經度)
  final String lng;

  /// mday(資料更新時間)
  final String mday;

  /// sarea(中文場站區域)
  final String sarea;

  /// sareaen(英文場站區域)
  final String sareaen;

  /// sbi(可借車位數)
  final String sbi;

  /// sna(中文場站名稱)
  final String sna;

  /// snaen(英文場站名稱)
  final String snaen;

  /// sno(站點代號)
  final String sno;

  /// tot(場站總停車格)
  final String tot;

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


