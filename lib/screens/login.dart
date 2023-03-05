import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 25, bottom: 0),
              child: Center(
                child: Column(
                  children: [
                  const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                    child: Text(
                      'VisionaryRX',
                      style: TextStyle(color: Colors.teal, fontSize: 30,fontWeight: FontWeight.bold, fontFamily: 'Alata'),
                    ),
                  ),
                SizedBox(
                      width: 230,
                      height: 180,
                      child: Image.asset('assets/login.png'),
                    ),
                  ],
                ),
              ),
            ),

        const Padding(
              padding: EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 40, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'abc@gmail.com'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password'),
              ),
            ),
            TextButton(
              onPressed: (){
                //Forgot Password Screen
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  //Go to Home page
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    // Your sign up logic goes here
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}