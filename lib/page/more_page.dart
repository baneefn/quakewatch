import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  late String studentName;
  late String studentID;
  late String studyProgramID;
  late double studentGPA;

  // Add controllers for TextFormFields
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController programIDController = TextEditingController();
  TextEditingController gpaController = TextEditingController();

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentID(id) {
    this.studentID = id;
  }

  getStudyProgramID(programID) {
    this.studyProgramID = programID;
  }

  getStudentGPA(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  // Update TextFormFields controllers with retrieved data
  updateTextFields(Map<String, dynamic> data) {
    nameController.text = data["studentName"];
    idController.text = data["studentID"];
    programIDController.text = data["studyProgramID"];
    gpaController.text = data["studentGPA"].toString();
  }

  createData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(studentName);

    // create Map

    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };

    documentReference.set(students).whenComplete(() {
      print("$studentName created");
    });
  }

  Future<void> readData() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(studentName);

    var datasnapshot = await documentReference.get();

    if (datasnapshot.exists) {
      Map<String, dynamic> data = datasnapshot.data() as Map<String, dynamic>;

      // Update TextFormFields controllers with retrieved data
      updateTextFields(data);

      print(data["studentName"]);
      print(data["studentID"]);
      print(data["studyProgramID"]);
      print(data["studentGPA"]);
    } else {
      print("Data tidak ditemukan");
    }
  }

  updateData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(studentName);

    // create Map

    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };

    documentReference.set(students).whenComplete(() {
      print("$studentName updated");
    });
  }

  deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(studentName);

    documentReference.delete().whenComplete(() {
      print("$studentName deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More '),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.deepPurple,
        onTap: (value) {
          if (value == 0) {
            context.goNamed('status');
          } else if (value == 1) {
            context.goNamed('more');
          } else if (value == 2) {
            context.goNamed('profile');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_outlined),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'More',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.amber,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      // Set style for text color
                      labelStyle: TextStyle(color: Colors.white),
                      // Set style for input text color
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (String name) {
                      getStudentName(name);
                    },
                    style: TextStyle(color: Colors.white), // Set text color
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Student ID",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      // Set style for text color
                      labelStyle: TextStyle(color: Colors.white),
                      // Set style for input text color
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (String id) {
                      getStudentID(id);
                    },
                    style: TextStyle(color: Colors.white), // Set text color
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Study Program ID",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      // Set style for text color
                      labelStyle: TextStyle(color: Colors.white),
                      // Set style for input text color
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (String programID) {
                      getStudyProgramID(programID);
                    },
                    style: TextStyle(color: Colors.white), // Set text color
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "GPA",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      // Set style for text color
                      labelStyle: TextStyle(color: Colors.white),
                      // Set style for input text color
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (String gpa) {
                      getStudentGPA(gpa);
                    },
                    style: TextStyle(color: Colors.white), // Set text color
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        createData();
                      },
                      child: Text("Create"),
                    ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.blue,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(16),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     readData();
                    //   },
                    //   child: Text("Read"),
                    // ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        updateData();
                      },
                      child: Text("Update"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        deleteData();
                      },
                      child: Text("Delete"),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Expanded(
                        child: Text("Name",
                            style: TextStyle(
                                fontSize: 15, color: Colors.limeAccent)),
                      ),
                      Expanded(
                        child: Text("Student ID",
                            style: TextStyle(
                                fontSize: 15, color: Colors.limeAccent)),
                      ),
                      Expanded(
                        child: Text("Program ID",
                            style: TextStyle(
                                fontSize: 15, color: Colors.limeAccent)),
                      ),
                      Expanded(
                        child: Text("GPA",
                            style: TextStyle(
                                fontSize: 15, color: Colors.limeAccent)),
                      )
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("MyStudents")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          QueryDocumentSnapshot<Object?> documentSnapshot =
                              snapshot.data!.docs[index];
                          return Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(documentSnapshot["studentName"],
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["studentID"],
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["studyProgramID"],
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Expanded(
                                child: Text(
                                    documentSnapshot["studentGPA"].toString(),
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          );
                        },
                      );
                    } else {
                      return Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
