import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'home.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String username = "";
  String useremail = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  Dio dio = new Dio();
  var url = "https://weather-flutter-app-rest-api.herokuapp.com";

  Future<void> postData(uname, uemail, pw) async {
    var userDetails = {"username": uname, "password": pw};
    print(userDetails);
    try {
      var postData = await dio.post('$url/users/signin', data: userDetails);
      if (postData.statusCode == 200) {
        print(postData);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              userName: uname,
              userEmail: uemail,
            ),
          ),
        );
        //Navigator.of(context).pushNamed('/home');
        final snackBar = SnackBar(
          content: const Text('User authenticated.'),
          backgroundColor: (Colors.blue),
          action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {},
            textColor: Colors.white,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print(e);
      print("Invalid username or password!");
      final snackBar = SnackBar(
        content: const Text('Invalid username or password!'),
        backgroundColor: (Colors.red),
        action: SnackBarAction(
          label: 'dismiss',
          onPressed: () {},
          textColor: Colors.white,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFe6e9f1),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 80),
                    Text(
                      "Hello Again!",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF413c51),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Welcome back you've \n been missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7b7984),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(18),
                                prefixIcon: Icon(Icons.person),
                                hintText: 'Enter your username',
                                labelText: 'Username',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter username';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                username = value!;
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(18),
                                prefixIcon: Icon(Icons.mail_outline_rounded),
                                hintText: 'Enter your email',
                                labelText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                useremail = value!;
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18),
                                prefixIcon: Icon(Icons.lock_outline_rounded),
                                hintText: 'Enter your password',
                                labelText: 'password',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                password = value!;
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () => {
                              if (!_formKey.currentState!.validate())
                                {}
                              else
                                {
                                  _formKey.currentState!.save(),
                                  print(username),
                                  print(password),
                                  print(useremail),
                                  postData(username, useremail, password),
                                }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.80,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 233, 229, 229),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    Container(
                      child: Text(
                        "Or continue with ",
                        style: TextStyle(
                          color: const Color(0xFF413c51),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/icons/facebookicon.png'),
                        ),
                        const SizedBox(width: 40),
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/icons/appleicon.png'),
                        ),
                        const SizedBox(width: 40),
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/icons/googleicon.png'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't you have an account? ",
                            style: TextStyle(
                              color: const Color(0xFF413c51),
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                            child: const Text(
                              'Register now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
