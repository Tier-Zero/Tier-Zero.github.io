import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' as shared;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}
String currentUser;
String baseUrl = "https://logbookzero.azurewebsites.net/api/Logbook/";

loadAsyncData() async {
  final prefs = await shared.SharedPreferences.getInstance(); 
  currentUser = prefs.getString('CurrentUser');
  await getTotalHours(currentUser);
}

class Flight {
  bool isExpanded;
  final DateTime flightDate;
  final String aircraftType;
  final String aircraftRegistration;
  final String position;
  final String fromCode;
  final String toCode;
  Flight(this.isExpanded, this.flightDate, this.aircraftType, this.aircraftRegistration, this.position, this.fromCode, this.toCode);
}

class HoursResponse {
  final String email;
  final String totalHours;
  HoursResponse({this.email, this.totalHours});

  factory HoursResponse.fromJson(Map<String, dynamic> json) {
    return HoursResponse(
      email : json['Email'],
      totalHours: json['TotalHours']
    );
  }
}

getTotalHours(email) async {
  String url = baseUrl + "GetHours/?Email=" + email;

  final response = await http.get(url);
  print(HoursResponse.fromJson(json.decode(response.body[0])));
}

class ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    loadAsyncData();
  }

  List<Flight> flights = <Flight> [
    new Flight(
      false,
      new DateTime(2018, 06, 20),
      "Cessna 172",
      "N421ER",
      "Pilot",
      "KDFW",
      "YYV"
    ),
    new Flight(
      false,
      new DateTime(2018, 05, 24),
      "Cessna 172",
      "N471ER",
      "Pilot",
      "KDFW",
      "KPLC"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Padding(
        padding: EdgeInsets.all(10),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Card(
              elevation: 5,
              child: new Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Cameron Stark",
                      style: new TextStyle(
                        fontSize: 23
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    Text(
                      "Total Hours: ",
                      style: new TextStyle(
                        fontSize: 19
                      ),
                    )
                  ],
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            new Card(
              elevation: 5,
              child: new Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text(
                    //   "Rating and Licenses",
                    //   style: new TextStyle(
                    //     fontSize: 19
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 5)
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: <Widget>[
                    //     Text(
                    //       "Private License"
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 15),
                    //     ),
                    //     Text(
                    //       "Days Remaining"
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            new Card(
              elevation: 5,
              child: new Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: new Column(
                  children: <Widget>[
                    Text(
                      "Recent Flights",
                      style: new TextStyle(
                        fontSize: 19
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                    ),
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          flights[index].isExpanded = !flights[index].isExpanded;
                        });
                      },
                      children: flights.map((Flight flight) {
                        return new ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return new ListTile(
                              title: new Text(
                                flight.aircraftType + " On " + DateFormat.yMd().format(flight.flightDate).toString(),
                                textAlign: TextAlign.left,
                              )
                            );
                          },
                          isExpanded: flight.isExpanded,
                          body: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                flight.position + " for " + flight.aircraftRegistration,
                                style: new TextStyle(
                                  fontSize: 17
                                ),
                              ),
                              Text(
                                flight.fromCode + " to " + flight.toCode,
                                style: new TextStyle(
                                  fontSize: 17
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10)
                              )
                            ],
                          )
                        );
                      }).toList(),
                    )
                  ],
                )
              ),
            )
          ],
        )
      )
    );
  }
}