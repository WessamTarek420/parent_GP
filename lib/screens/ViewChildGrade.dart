import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/model/SubjectGrade.dart';
import 'package:parent_gp/service/store.dart';

class ViewChildGrade extends StatefulWidget {
  final String email;
  final String childName;

  ViewChildGrade(this.email, this.childName);

  @override
  _ViewChildGradeState createState() => _ViewChildGradeState();
}

class _ViewChildGradeState extends State<ViewChildGrade> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text(widget.childName + "' grades"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadChildGrades(widget.email),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<SubjectGrade> grades = [];
            for (var doc in snapShot.data.documents) {
              var data = doc.data();
              grades.add(
                  SubjectGrade(grade: data['grade'], subject: data['subject']));
            }
            return ListView.builder(
                itemCount: grades.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 60,
                   // color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            grades[index].subject,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[350]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              ("Grade: " + grades[index].grade.toString()) +
                                  (grades[index].subject.toLowerCase() ==
                                          "final exam"
                                      ? "/50"
                                      : "/10"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: Text('loading....'));
          }
        },
      ),
    );
  }
}
