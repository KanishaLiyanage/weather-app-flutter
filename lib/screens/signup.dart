import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String username = "";
  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Dio dio = new Dio();
    const url = "https://weather-flutter-app-rest-api.herokuapp.com";

    Future<void> postData(uname, uemail, upw) async {
      var userDetails = {"username": uname, "email": uemail, "password": upw};
      print(userDetails);
      try {
        var postData = await dio.post('$url/signup', data: userDetails);
        print(postData);
        Navigator.of(context).pushNamed('/home');
      } catch (e) {
        print(e);
        print("===");
      }
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF413c51),
                ),
              ),
              const SizedBox(height: 20),
              // const Divider(color: Colors.black54, thickness: 0.8, height: 25),
              const SizedBox(height: 25),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Username",
                      ),
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
                    const SizedBox(height: 25),
                    TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value!;
                      },
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      // obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                      ),
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
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () => {
                        if (!_formKey.currentState!.validate())
                          {}
                        else
                          {
                            _formKey.currentState!.save(),
                            print(username),
                            print(email),
                            print(password),
                            postData(username, email, password),
                          }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "Register",
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
            ],
          ),
        ),
      ),
    );
  }
}
