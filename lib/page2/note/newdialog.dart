import 'package:flutter/material.dart';
import 'package:Google_Sheet_with_Flutter/page2/note/note.dart';
import 'package:Google_Sheet_with_Flutter/page2/note/date.dart';

class AddUserDialog2 {
  final teName = TextEditingController();
  final teEmail = TextEditingController();
  final teAge = TextEditingController();
  final teMobile = TextEditingController();
  User user;
  @override


  Widget buildAboutDialog(BuildContext context,
      AddUserCallback2 _myHomePageState, bool isEdit, User user) {
    if (user != null) {
      this.user = user;
      teName.text = user.name;
      teEmail.text = user.email;
      teAge.text = user.age;
      teMobile.text = user.mobile;
    }
    new Container(
        child: Text(isEdit ? 'Edit detail!' : 'Add new user!'),
    );
    new Container(
      child: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTextField("Name", teName),
            getTextField("Email", teEmail),
            getTextField("Age", teAge),
            getTextField("Mobile", teMobile),
            new GestureDetector(
              onTap: () => onTap(isEdit, _myHomePageState, context),
              child: new Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: getAppBorderButton(isEdit ? "Edit" : "Add",
                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = new Padding(
      padding: const EdgeInsets.all(5.0),
      child: new TextFormField(
        controller: inputBoxController,
        decoration: new InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );

    return loginBtn;
  }

  Widget getAppBorderButton(String buttonLabel, EdgeInsets margin) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        border: Border.all(color: const Color(0xFF28324E)),
        borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
      ),
      child: new Text(
        buttonLabel,
        style: new TextStyle(
          color: const Color(0xFF28324E),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
    return loginBtn;
  }

  User getData(bool isEdit) {
    return new User(isEdit ? user.id : "", teName.text, teEmail.text,
        teAge.text, teMobile.text);
  }

  onTap(bool isEdit, AddUserCallback2 _myHomePageState, BuildContext context) {
    if (isEdit) {
      _myHomePageState.update(getData(isEdit));
    } else {
      _myHomePageState.addUser(getData(isEdit));
    }

    Navigator.of(context).pop();

  }
}
//Call back of user dashboad
abstract class AddUserCallback2 {
  void addUser(User user);

  void update(User user);
}
