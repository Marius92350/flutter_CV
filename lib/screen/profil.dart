///
/// screen/profil.dart
///
import 'package:flutter/material.dart';
 
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
 
import 'package:cv/model/airtable_data_profil.dart';
 
class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AirtableData airtableData = AirtableData();
 
    return SingleChildScrollView(
      padding: EdgeInsets.all(30),
 
      ///
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/bxl-1.jpg'),
              maxRadius: 100,
              backgroundColor: Colors.green,
            ),
          ),
 
          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icoLink(
                FontAwesomeIcons.twitter,
                "https://twitter.com/richnourichnou/",
              ),
              icoLink(
                FontAwesomeIcons.instagram,
                "https://www.instagram.com/marius_vrg/",
              )
            ],
          ),
 
          Container(
            height: 900,
            child: FutureBuilder(
              future: airtableData.getProfil(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<AirtableDataProfil>> snapshot) {
                if (snapshot.hasData) {
                  List<AirtableDataProfil>? values = snapshot.data;
                  return ListView(
                    children: values!
                        .map(
                          (AirtableDataProfil value) => ListTile(
                            leading: Text(
                              value.icon,
                              style:
                                  const TextStyle(fontFamily: 'MaterialIcons'),
                            ),
                            title: Text(value.content),
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
 
Widget icoLink(var _ico, String _url) {
  return GestureDetector(
    onTap: () {
      launch(_url, forceSafariVC: false);
    },
    child: Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      // Change button text when light changes state.
      child: FaIcon(
        _ico,
        color: Colors.black,
        size: 35.0,
      ),
    ),
  );
}