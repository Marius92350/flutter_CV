import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv/utils/config.dart';

class AirtableDataExperience {
  String id;
  String title;
  String function;
  String notes;
  String date;
  String logo;
  String createdTime;

  AirtableDataExperience(
      {required this.id,
      required this.title,
      required this.function,
      required this.notes,
      required this.date,
      required this.logo,
      required this.createdTime});
}

class AirtableData3 {
  final Uri urlExperience = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/experience",
    {"maxRecords": "10", "view": "Grid view"},
  );

      Future<List<AirtableDataExperience>> getExperience() async {
    final res = await http.get(
      urlExperience,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataExperience> values = [];
      for (var value in data) {
        values.add(
          AirtableDataExperience(
            id: value['id'],
            title: value['fields']['title'],
            function: value['fields']['function'],
            notes: value['fields']['notes'],
            date: value['fields']['date'],
            logo: value['fields']['logo'][0]['url'],
            createdTime: value['createdTime'],
          ),
        );
      }
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
