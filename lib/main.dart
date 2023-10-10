import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';
void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
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
              validator: (value){
                if(value==null || value.isEmpty){
                  return "Please enter your email";
                }
                return null;
              },
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
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please enter your password";
                }
                else return null;
              },
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
    if (_formKey.currentState!.validate()) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    }
          ),
          const SizedBox(height: 20,),
          MaterialButton(
              height: 33,
              minWidth: 110,
              color: Colors.red,
              textColor: Colors.white,
              child: const Text("Register"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()),
                );}
          ),
        ],
      ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget{
   RegisterPage({super.key});
   String emailTemp="e";
   String passwordTemp1="a";
   String passwordTemp2="s";
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  bool isMatched=false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Form(
        key: _formKey,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.app_registration,color: Colors.purple,size: 90,),
        Padding(
          padding: const EdgeInsets.only(left: 250,right: 250,top: 20),
          child: TextFormField(
            controller: emailController,
            onChanged: (value){
              emailTemp=value;
            },
            validator: (value){
              if(value == null || value.isEmpty){
                return "Please enter your email";
              }
              else if(!EmailValidator.validate(value)){
                return "Enter a valid email";
              }
              else return null;
            },
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
            controller: passwordController1,
            onChanged: (value){
              passwordTemp1=value;
            },
            validator: (value){
              if(value == null || value.isEmpty){
                return "Please enter your password";
              }
              else return null;
            },
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
              controller: passwordController2,
              onChanged: (value)async{
                passwordTemp2=value;
              },
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please enter your password";
                }
                else if(passwordController1!=passwordController2){
                  return "Passwords has to match";
                }
                else {
                  isMatched=true;
                  return null;
                }
              },
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
              if (_formKey.currentState!.validate()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              }
            }
        ),
      ]
    ),
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

Future addData(String email,String password)async{
  final SharedPreferences prefs=await SharedPreferences.getInstance();
  await prefs.setString(email, password);
}

Future getData(String email)async{
  String? password;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  password = await prefs.getString(email);
  return password;
}