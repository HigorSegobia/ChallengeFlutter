import 'package:desafio_flutter/constants.dart';
import 'package:desafio_flutter/screens/home/home.dart';
import 'package:desafio_flutter/screens/login/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final ValueChanged<String> onChanged;
  final textController = TextEditingController();

  LoginScreen({Key key, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Container(
                      height: size.height * 0.4,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: SvgPicture.asset('assets/login.svg')),
                  TextFieldContainer(
                    child: TextFormField(
                      controller: textController,
                      onChanged: onChanged,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person, color: whiteColor),
                          hintText: 'Login',
                          hintStyle: TextStyle(color: whiteColor),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFieldContainer(
                      child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.number,
                    onChanged: onChanged,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Senha",
                        hintStyle: TextStyle(
                          color: whiteColor,
                        ),
                        icon: Icon(
                          Icons.lock,
                          color: whiteColor,
                        ),
                        border: InputBorder.none),
                  )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                      ),
                      onPressed: () {
                        if (textController.text == 'admin' &&
                            passwordController.text == '123456') {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => HomePage(),
                            ),
                            (route) => false,
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Usuário ou Senha inválido'),
                                    content:
                                        Text('Verifique os dados digitados'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ));
                        }
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
