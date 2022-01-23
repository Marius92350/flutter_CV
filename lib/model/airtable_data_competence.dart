import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cv/utils/config.dart';

class AirtableDataCompetence {
  String id;
  String category;
  List<String> skills;

  AirtableDataCompetence({
    required this.id,
    required this.category,
    required this.skills,
  });
}

class AirTableData4 {
  final Uri urlSkill = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/competence",
    {"maxRecords": "500", "view": "Grid view"},
  );

  Future<List<AirtableDataCompetence>> getCompetences() async {
    final res = await http.get(
      urlSkill,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataCompetence> values = [];
      data.forEach(
        (value) {
          dynamic skills = value['fields']['skills'];
          List<String> imageListComp = [];
          skills.forEach((competence) => imageListComp.add(competence['url']));
          return values.add(
            AirtableDataCompetence(
              id: value['id'],
              category: value['fields']['category'],
              skills: imageListComp,
            ),
          );
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
