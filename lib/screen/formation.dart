	///
/// screen/settings.dart
///
import 'package:cv/model/airtable_data_profil.dart';
import 'package:cv/model/airtable_data_formation.dart';
import 'package:flutter/material.dart';
 
class FormationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final AirtableData2 airtableData2 = AirtableData2();

    return FutureBuilder(
      future: airtableData2.getFormation(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataFormation>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataFormation>? values = snapshot.data;
          return ListView.builder(
            itemCount: values!.length,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(values[index].image),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(values[index].title),
                        Text(values[index].detail)
                      ]))
                ])),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}