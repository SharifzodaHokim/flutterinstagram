import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterinstagram/pages/my_main_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterinstagram/pages/my_splash_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
   var emailContoller = TextEditingController();
  var passwordContoller = TextEditingController();
  var secureStorage = FlutterSecureStorage();
  String emailText = '';
  String passwordText = '';
  String gandaToken='';

  Future logInMethod(String email, String password) async {
    var response = await http.post(Uri.parse("http://65.108.148.136:8085/Account/login"),
        headers: <String, String>{
          'Content-Type': "application/json",
        },
        body: jsonEncode({
          "userName": email,
          "password": password,
        }));

    if (response.statusCode == 200) {
      var tok = json.decode(response.body)['token'];

      // setState(() {
      //   gandaToken = tok;
      // });

      await secureStorage.write(key: 'token', value: tok);
      print(tok);

      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => MyMainPage()),
          (route)=>false
          
          );
    }
  }

  List <Icon>  name  = [
  Icon(Icons.visibility),
  Icon(Icons.visibility_off),
  ];
  List<bool> name1  = [
    true,
    false,
  ];
  int cnt=0;
  void gary(){
    setState(() {
      if(cnt == 1){
        cnt=0;
      }
      else{
        cnt++;
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
         SingleChildScrollView(
           child: Column(
             children: [
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 158,),
                    Center(
                      child: SvgPicture.asset("images/Instagram Logo.svg",fit: BoxFit.cover,),
                    ),
                    SizedBox(height: 39,),
                    Column(
                      children: [
                        TextField(
                          controller: emailContoller,
                          decoration: InputDecoration(
                             fillColor: Color.fromARGB(255, 244, 242, 242),
                              filled: true,
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Color(0xff000000),fontSize: 14,fontWeight: FontWeight.w400),
                           border: OutlineInputBorder(),
                           focusedBorder: OutlineInputBorder(

                           )
                           
                          ),
                        ),
                         SizedBox(height: 12,),
                          TextField(
                           obscureText: name1[cnt],
                            controller: passwordContoller,
                            decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 244, 242, 242),
                              filled: true,
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Color(0xff000000),fontSize: 14,fontWeight: FontWeight.w400),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  gary();
                                },
                                icon: name[cnt]),
                              border: OutlineInputBorder(
                                
                               borderSide: BorderSide(color: Color(0xff000000),width: 0.5),
                                  
                              ),
                              focusedBorder: OutlineInputBorder(),
                            ),
                          ),
                        SizedBox(height: 19,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Forgot password?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff3797EF)),),
                          ],
                        )
                      ],
                       
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {

                                   logInMethod(
                            emailContoller.text, passwordContoller.text);
                  setState(() {
                    emailText = emailContoller.text;
                    passwordText = passwordContoller.text;
                  }
                  
                          );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 343,
                        height: 44,
                        child: Text("Log in",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),),
                        decoration: BoxDecoration(
                          color: Color(0xff3797EF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(height: 37,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('images/Shape.svg'),
                        Text('    Log in with Facebook',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff3797EF)),),
                      ],
                    ),
                    SizedBox(height: 41.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 132,
                          height: 1,
                          color: Colors.grey,
                        ),
                        Text("OR",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff000000)),),
                         Container(
                          width: 132,
                          height: 1,
                         color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 41.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don’t have an account?  ',style: TextStyle(fontSize: 14,fontWeight:FontWeight.w400,color: Color(0xff000000) ),),
                        Text('Sign up.',style: TextStyle(fontSize: 14,fontWeight:FontWeight.w400,color: Colors.blue ),)
                      ],
                    ),
                  
                  ],
                ),
                       ),
                       SizedBox(height: 40,),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(width: 1,color: Colors.grey,))
                    ),
                       child: Text('Instagram от Facebook',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff000000)),),
                  )
             ],
           ),
         ),
      
    );
  }
}
