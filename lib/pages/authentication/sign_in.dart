import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';


//This is the widget itself
class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

//This is the state object
class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //To determine if we need to show the loading screen or not
  bool loading = false;
  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      //backgroundColor: Colors.brown[100],
      appBar: AppBar(
        //backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sign In To NYP CCA App"),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
              widget.toggleView();
          }, icon: Icon(Icons.person), label: Text("Register"))
        ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(  
            key: _formKey,
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
                SizedBox(height: 20,),
                RaisedButton(
                  color: Colors.pink[400],
                  onPressed: () async{
                       //Validate form based on current state
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.signInAccount(email, password);
                        if(result == null){
                         setState((){
                            error = "Invalid Credentials!";
                            loading = false;
                         });
                        }
                      }
                  },
                  child: Text("Sign In",
                    style: TextStyle(color: Colors.white),
                      ),
                    ),
                      SizedBox(height: 12,),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14)
                    ), 
              ],
            ),
          ),
        )
    );
  }
}

/*
 child: RaisedButton(
            onPressed: ()async{
                dynamic result = await _auth.signInAnon();
                if(result==null){
                  print("error signing in");
                }
                else{
                  print("signed in");
                  print(result);
                }
            },
            child: Text("Sign In Anonymously"),
          ),
*/