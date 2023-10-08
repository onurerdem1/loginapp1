import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Screen"),
        backgroundColor: Colors.red,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle,
            color: Colors.red,
            size: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 250,right: 250,top: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                icon: Icon(Icons.mail_sharp,color: Colors.red,),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 250,right: 250,top: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                icon: Icon(Icons.password,color: Colors.red,),
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(height: 20,),
          MaterialButton(
              height: 33,
              minWidth: 110,
              color: Colors.red,
              textColor: Colors.white,
              child: const Text("Login"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()),
                );}
          ),
          const SizedBox(height: 20,),
          MaterialButton(
              height: 33,
              minWidth: 110,
              color: Colors.red,
              textColor: Colors.white,
              child: const Text("Register"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()),
                );}
          ),
        ],
      ),
    );
  }
}

class RegisterPage extends StatelessWidget{
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
        centerTitle: true,
      ),
    );
  }
}
class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
    );
  }
}