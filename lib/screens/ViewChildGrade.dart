import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/model/SubjectGrade.dart';
import 'package:parent_gp/service/store.dart';

class ViewChildGrade extends StatefulWidget {
  final String email;
  final String childName;
  ViewChildGrade(this.email, this.childName) {
    print(email);
  }

  @override
  _ViewChildGradeState createState() => _ViewChildGradeState();
}

class _ViewChildGradeState extends State<ViewChildGrade> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      appBar: AppBar(
        title: Text(widget.childName + "' grades"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadChildGrades(widget.email),
        builder: (context, snapShot) {
          print("eeeror " +
              snapShot.hasData.toString() +
              ' ' +
              snapShot.hasError.toString());

          if (snapShot.hasData) {
            List<SubjectGrade> grades = [];
            print("hasdata ");
            for (var doc in snapShot.data.documents) {
              var data = doc.data();
              print("sssss + " + data['subject']);
              grades.add(
                  SubjectGrade(grade: data['grade'], subject: data['subject']));
            }
            return ListView.builder(
                itemCount: grades.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            grades[index].subject,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            grades[index].grade.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                });
            /*  GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    
                  child: Stack(
                    children: <Widget>[
                     
                      Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: .6,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                 
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              
              itemCount: grades.length,
            );*/
          } else {
            return Center(child: Text('loading....'));
          }
        },
      ),
    );
  }
}
