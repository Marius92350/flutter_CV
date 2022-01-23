import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cv/utils/config.dart';


class AirtableDataFormation {
  String id;
  String createdTime;
  String title;
  String detail;
  String image;

  AirtableDataFormation({
    required this.id,
    required this.createdTime,
    required this.title,
    required this.detail,
    required this.image
  });
}

class AirtableData2 {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/formation",
    {"maxRecords": "10", "view": "Grid view"},
  );
 
  Future<List<AirtableDataFormation>> getFormation() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );
 
    print(res.body);
 
    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];
 
      print(data);
 
      List<AirtableDataFormation> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataFormation(
              id: value['id'],
              createdTime: value['createdTime'],
              title: value['fields']['title'],
              detail: value['fields']['detail'],
              image: value['fields']['image'],
            ),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}

