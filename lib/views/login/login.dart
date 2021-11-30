import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/home/homeScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  double screenHeight, screenWidth;

  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  String validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter email address';
    } else if (!regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }

  String validatePassword(String value) {
    // RegExp regex =
    //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    //

    RegExp regex =
    RegExp(r'^(?=.*?[0-9]).{5,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  loginValidation() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_emailAddressController.text.trim().toString() ==
              'vidhi.m1@gmail.com' &&
          _passwordController.text.trim().toString() == '123456') {
        Fluttertoast.showToast(msg: 'login successfully!');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => homeScreen(),
          ),
        );
      } else {
        Fluttertoast.showToast(msg: 'Invalid email or password');
      }
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text('Login with Email'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    child: TextFormField(
                      validator: validateEmail,
                      controller: _emailAddressController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: TextFormField(
                      validator: validatePassword,
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      //This will obscure text dynamically
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        fillColor: Colors.grey,
                        filled: true,
                        hintText: 'Password',
                        // Here is key idea
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ButtonTheme(
                      height: 50.0,
                      minWidth: screenWidth,
                      child: RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.green),
                        ),
                        child: Text('Login'),
                        onPressed: () => loginValidation(),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
