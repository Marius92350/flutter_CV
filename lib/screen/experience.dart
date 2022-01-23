import 'package:cv/model/airtable_data_experience.dart';
import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AirtableData3 airtableData = AirtableData3();
    
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),

      ///
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: FutureBuilder(
                future: airtableData.getExperience(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AirtableDataExperience>> snapshot) {
                  if (snapshot.hasData) {
                    List<AirtableDataExperience>? values = snapshot.data;
                    return ListView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: values!
                          .map<Widget>(
                            (AirtableDataExperience value) => ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(value.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      )),
                                  ),
                                  Wrap(
                                      children: values!
                                              .map<Widget>((e) => Container(
                                                    height: 30,
                                                    width: 30,
                                                    child:
                                                        Image.network(e.logo),
                                                  ))
                                              .toList())
                                ],
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      ),
    );
  }
}
