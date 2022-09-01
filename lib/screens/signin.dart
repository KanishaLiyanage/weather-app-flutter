import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Dio dio = new Dio();
    const url = "https://weather-flutter-app-rest-api.herokuapp.com";

    Future<void> postData() async {
      var userDetails = {
        "username": "user1",
        "password": "1111111",
      };

      try {
        var postData = await dio.post('$url/users/signin', data: userDetails);
        print(postData);
      } catch (e) {
        print(e);
        print("===");
      }
    }

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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(18),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Enter your username',
                          labelText: 'Username',
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: userPasswordController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(18),
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          hintText: 'Enter your password',
                          labelText: 'password',
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        print(userNameController.text);
                        print(userPasswordController.text);
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
                          "Sign In",
                          style: TextStyle(
                            color: Color.fromARGB(255, 233, 229, 229),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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

class LoginInput extends StatelessWidget {
  LoginInput({
    Key? key,
    required this.label,
    this.suffixx = false,
  }) : super(key: key);
  final String label;
  bool suffixx;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width * 0.90,
      height: 60,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 30),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: suffixx == true
                  ? const Icon(
                      Icons.remove_red_eye_outlined,
                    )
                  : null,
            ),
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF7b7984),
              fontFamily: 'Roboto',
            )),
      ),
    );
  }
}
