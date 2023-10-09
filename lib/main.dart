import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  State<LoginScreen> createState()=> _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Screen"),
        backgroundColor: Colors.red,
      ),
      body:  Form(
    key: _formKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle,
            color: Colors.red,
            size: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 250,right: 250,top: 20),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.red),
                border: OutlineInputBorder(),
                icon: Icon(Icons.mail_sharp,color: Colors.red,),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 250,right: 250,top: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.red),
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
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.app_registration,color: Colors.purple,size: 90,),
        Padding(
          padding: const EdgeInsets.only(left: 250,right: 250,top: 20),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.purple),
              border: OutlineInputBorder(),
              icon: Icon(Icons.mail_sharp,color: Colors.purple,),
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(left: 250,right: 250,top: 20),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.purple),
              border: OutlineInputBorder(),
              icon: Icon(Icons.password,color: Colors.purple,),
            ),
            obscureText: true,
          ),
        ),
          Padding(padding: const EdgeInsets.only(left: 250,right: 250,top: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Confirm Password",
                labelStyle: TextStyle(color: Colors.purple),
                border: OutlineInputBorder(),
                icon: Icon(Icons.password,color: Colors.purple,),
              ),
              obscureText: true,
            ),
          ),
        const SizedBox(height: 20,),
        MaterialButton(
            height: 33,
            minWidth: 110,
            color: Colors.purple,
            textColor: Colors.white,
            child: const Text("Register"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()),
              );}
        ),
      ]
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