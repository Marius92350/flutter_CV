import 'package:cv/model/airtable_data_profil.dart';
import 'package:cv/model/airtable_data_competence.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class CompetenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AirTableData4 airtableDataCompetence = AirTableData4();

    return SingleChildScrollView(
      padding: EdgeInsets.all(30),

      ///
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 1200,
            child: FutureBuilder(
              future: airtableDataCompetence.getCompetences(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<AirtableDataCompetence>> snapshot) {
                if (snapshot.hasData) {
                  List<AirtableDataCompetence>? values = snapshot.data;
                  return ListView(
                    children: values!
                        .map(
                          (AirtableDataCompetence value) => ListTile(
                            leading: Text(value.category),
                            subtitle: Column(children: [
                              for (var imageListComp in value.skills)
                                Image.network(imageListComp)
                            ]),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
