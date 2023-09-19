import 'package:amazon_clone/Screens/LoginScreen.dart';
import 'package:amazon_clone/Widgets/Utils.dart';
import 'package:amazon_clone/resources/authentication_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.19,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/amazon_logo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.56,
                  width: MediaQuery.of(context).size.width * 0.83,
                  decoration: const BoxDecoration(
                    color: Color(0xFFffffff),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.1, // soften the shadow
                        spreadRadius: 0.1, //extend the shadow
                        offset: Offset(
                          0.0,
                          0.0,
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 8, 0, 8),
                            child: Text(
                              "Sign-Up",
                              style: TextStyle(fontSize: 33),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text("Name",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.055,
                        width: MediaQuery.of(context).size.width * 0.69,
                        child: TextFormField(
                          controller: namecontroller,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text("Address",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.055,
                        width: MediaQuery.of(context).size.width * 0.69,
                        child: TextFormField(
                          controller: addresscontroller,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.055,
                          width: MediaQuery.of(context).size.width * 0.69,
                          child: TextFormField(
                            controller: emailcontroller,
                            decoration: const InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                border: OutlineInputBorder()),
                          )),
                      const SizedBox(
                        height: 11,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.055,
                          width: MediaQuery.of(context).size.width * 0.69,
                          child: TextFormField(
                            controller: passwordcontroller,
                            obscureText: true,
                            decoration: const InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                border: OutlineInputBorder()),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                            onPressed: () async {
                              String output =
                                  await authenticationMethods.signUpUser(
                                      name: namecontroller.text.toString(),
                                      address: addresscontroller.text.toString(),
                                      email: emailcontroller.text.toString(),
                                      password: passwordcontroller.text.toString());

                              if (output == "Success") {
                                //functions
                                Utils().showSnackBar(context: context, content: output);
                              } else {
                                //error feedback
                                Utils().showSnackBar(context: context, content: output);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                primary: Colors.yellow),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          primary: Colors.grey),
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.black),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
