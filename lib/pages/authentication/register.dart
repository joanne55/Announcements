import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      //backgroundColor: Colors.brown[100],
      appBar: AppBar(
        //backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sign Up To NYP CCA App"),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          }, icon: Icon(Icons.person), label: Text("Sign In"))
        ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(  
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  //Username Form Field
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? "Please fill in the Email field! ": null,
                    onChanged:(val){
                      setState(()=> email = val);
                    },
                  ),
                  SizedBox(height: 20),
                  //Password Form Field
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val){
                      if(val.isEmpty){
                        return "Please fill in the Password field!";
                      }
                      else if (val.length<6){
                        return "Password should be 6 characters or longer!";
                      }
                      else {
                        return null;
                      }
                    },
                    obscureText: true,
                    onChanged:(val)
                    {
                      setState(()=> password = val);

                    }
                  ),
                  SizedBox(height: 30),
                  Text("Register as Admin"),
                  Switch(
                    value: isAdmin,
                    onChanged: (value) {
                      setState(() {
                        isAdmin = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                  SizedBox(height: 10,),
                  RaisedButton(
                    color: Colors.pink[400],
                    onPressed: () async{
                        //Validate form based on current state
                        if(_formKey.currentState.validate()){
                          setState(() {
                            loading = true;
                          });
                          String role;
                          if(isAdmin == true){
                            role = 'admin';
                          }
                          else{
                            role = 'user';
                          }
                          dynamic result = await _auth.registerAccount(email, password, role);
                          if(result == null){
                            print(email);
                           setState((){ 
                             error = "Please supply a valid email!";
                             loading = false;
                           });
                          }
                        }
                    },
                    child: Text("Register",
                      style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14)
                      )
                  
                ],
              ),
            ),
          ),
        )
    );
  }
}