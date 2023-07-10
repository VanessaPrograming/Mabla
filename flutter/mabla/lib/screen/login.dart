import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../formas/ondaHome.dart';
import '../home.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  void singIn(BuildContext context) {
    // confetti.fire();
    if (_formKey.currentState!.validate()) {
      // Navigate & hide confetti
      Future.delayed(const Duration(milliseconds: 200), () {
        // Navigator.pop(context);
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EntryPoint(),
          ),
        );*/
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child:
      SingleChildScrollView(
        child:
      Container(
      width: 350,
      height: 600,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(55),
      ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height:450,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: pico(),
                        child: Container(
                          color: purple,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                        child: Column(
                            children:[
                              Container(
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.only(bottom: 15),
                                child: Text("INICIA SESIÓN", style: TextStyle(fontSize: 24, fontFamily: "MartianMono", color: Colors.white),),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                width: 280,
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Alias",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Raleway",
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "";
                                            }
                                            return null;
                                          },
                                          style: TextStyle(
                                            color: Colors.white, // Cambia este valor al color deseado
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top:10,left: 10),
                                        child: const Text(
                                          "Clave",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Raleway",
                                              fontSize: 20
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          obscureText: _obscureText,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "";
                                            }
                                            return null;
                                          },
                                          style: TextStyle(
                                            color: Colors.white, // Cambia este valor al color deseado
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                              icon: Icon(
                                                _obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: ElevatedButton.icon(
                                            onPressed: () {
                                              singIn(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color.fromRGBO(255, 115, 28, 9),
                                              minimumSize: const Size(200, 56),
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(25),
                                                  bottomRight: Radius.circular(25),
                                                  bottomLeft: Radius.circular(25),
                                                ),
                                              ),
                                            ),
                                            icon: const Icon(
                                              CupertinoIcons.arrow_right,
                                              color: Color.fromRGBO(255, 205, 163, 9),
                                            ),
                                            label: const Text("SIGN IN", style: TextStyle(fontFamily: "Raleway", fontSize: 25)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]
                        ),
                      )
                      // Text("Hola", style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),)
                    ],
                  ),
                ),

              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset("assets/img/letrasMABLAnaranja.png", width: 200),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text("HABLA CON LAS MANOS", style: TextStyle(fontFamily: "MartianMono", fontSize: 25, color: orange)),
                    )
                  ],
                )
            )
          ],
        )
      )
        )
      )
    );

  }
}

class registro extends StatefulWidget {
  const registro({super.key});

  @override
  State<registro> createState() => _registroState();
}

class _registroState extends State<registro> {
  final _alias= TextEditingController();
  final _nombre= TextEditingController();
  final _apellido= TextEditingController();
  final _telefono= TextEditingController();
  final _correo= TextEditingController();
  final _clave = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  List<dynamic> datos=[];
  Future<void> consultaDatos(body) async{
    final url=Uri.parse('http://192.168.0.9/insertUser');
    final response = await http.post((url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      print('Dato enviado exitosamente a Django, datos: '+body);
    } else {
      print('Error al enviar el dato a Django. Código de estado: ${response.statusCode}'+body);
    }
  }

  @override
  void singIn(BuildContext context) {
    // confetti.fire();
    if (_formKey.currentState!.validate()) {
      final body = json.encode({
        "alias":_alias.text,
        "nombre":_nombre.text,
        "apellido":_apellido.text,
        "telefono":int.parse(_telefono.text),
        "correo":_correo.text,
        "clave":_clave.text,
      });
      consultaDatos(body);
      // Navigate & hide confetti
      Future.delayed(const Duration(milliseconds: 200), () {
        // Navigator.pop(context);
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EntryPoint(),
          ),
        );*/
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
            SingleChildScrollView(
                child:
                Container(
                    width: 400,
                    height: 700,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 550,
                              child: Stack(
                                children: [
                                  ClipPath(
                                    clipper: ondaHome(),
                                    child: Container(
                                      color: purple,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                                    alignment: Alignment.center,
                                    child: Column(
                                        children:[
                                          Container(
                                            alignment: Alignment.topCenter,
                                            margin: EdgeInsets.only(bottom: 35),
                                            child: Text("REGISTRATE", style: TextStyle(fontSize: 25, fontFamily: "MartianMono", color: Colors.white),),
                                          ),
                                          Form(
                                              key: _formKey,
                                              child: Column(
                                                  children: [
                                                    Row(
                                                        children:[
                                                          Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets.only(right: 50),
                                                                    child: const Text(
                                                                      "Nombre",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontFamily: "Raleway",
                                                                          fontSize: 19
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  TextFormField(
                                                                    cursorColor: Colors.white,
                                                                    controller: _nombre,
                                                                    validator: (value) {
                                                                      if (value!.isEmpty) {
                                                                        return "";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    style: TextStyle(
                                                                      color: Colors.white, // Cambia este valor al color deseado
                                                                    ),
                                                                    decoration: InputDecoration(
                                                                      enabledBorder: UnderlineInputBorder(
                                                                        borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                      ),
                                                                      focusedBorder: UnderlineInputBorder(
                                                                        borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                      ),
                                                                  ),
                                                                  )
                                                                ],
                                                              )
                                                          ),
                                                          const SizedBox(width: 10),
                                                          Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets.only(right: 50),
                                                                    child: const Text(
                                                                      "Apellido",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontFamily: "Raleway",
                                                                          fontSize: 19
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  TextFormField(
                                                                    cursorColor: Colors.white,
                                                                    controller: _apellido,
                                                                    validator: (value) {
                                                                      if (value!.isEmpty) {
                                                                        return "";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    style: TextStyle(
                                                                      color: Colors.white, // Cambia este valor al color deseado
                                                                    ),
                                                                    decoration: InputDecoration(
                                                                      enabledBorder: UnderlineInputBorder(
                                                                        borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                      ),
                                                                      focusedBorder: UnderlineInputBorder(
                                                                        borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                      ),
                                                                  ),
                                                                  )
                                                                ],
                                                              )
                                                          ),
                                                        ]
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(top: 30),
                                                      child: Row(
                                                          children:[
                                                            Expanded(
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(top:19, right: 45),
                                                                      child: const Text(
                                                                        "Teléfono",
                                                                        style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "Raleway",
                                                                            fontSize: 19
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    TextFormField(
                                                                      cursorColor: Colors.white,
                                                                      controller: _telefono,
                                                                      validator: (value) {
                                                                        if (value!.isEmpty) {
                                                                          return "";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      style: TextStyle(
                                                                        color: Colors.white, // Cambia este valor al color deseado
                                                                      ),
                                                                      decoration: InputDecoration(
                                                                        enabledBorder: UnderlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                        ),
                                                                        focusedBorder: UnderlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                )
                                                            ),
                                                            const SizedBox(width: 10),
                                                            Expanded(
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(left: 15),
                                                                      child: const Text(
                                                                        "Correo electrónico",
                                                                        style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "Raleway",
                                                                            fontSize: 18
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    TextFormField(
                                                                      cursorColor: Colors.white,
                                                                      controller: _correo,
                                                                      validator: (value) {
                                                                        if (value!.isEmpty) {
                                                                          return "";
                                                                        }
                                                                        else if(!value.contains("@")){
                                                                          return "Correo no válido";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      style: TextStyle(
                                                                        color: Colors.white, // Cambia este valor al color deseado
                                                                      ),
                                                                      decoration: InputDecoration(
                                                                        enabledBorder: UnderlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                        ),
                                                                        focusedBorder: UnderlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                        ),
                                                                    ),
                                                                    )
                                                                  ],
                                                                )
                                                            )
                                                          ]
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(top: 20),
                                                      child:
                                                      Row(
                                                          children:[
                                                            Expanded(
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(left: 15),
                                                                      child: const Text(
                                                                        "Nombre de usuario (Alias)",
                                                                        style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "Raleway",
                                                                            fontSize: 18
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    TextFormField(
                                                                      style: TextStyle(
                                                                        color: Colors.white, // Cambia este valor al color deseado
                                                                      ),
                                                                      cursorColor: Colors.white,
                                                                      controller: _alias,
                                                                      validator: (value) {
                                                                        if (value!.isEmpty) {
                                                                          return "";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration: InputDecoration(
                                                                        enabledBorder: UnderlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                        ),
                                                                        focusedBorder: UnderlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                        ),
                                                                    ),
                                                                    )
                                                                  ],
                                                                )
                                                            ),
                                                            const SizedBox(width: 10),
                                                            Expanded(
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(right: 70, top: 20),
                                                                      child: const Text(
                                                                        "Clave",
                                                                        style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "Raleway",
                                                                            fontSize: 19
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    TextFormField(
                                                                      cursorColor: Colors.white,
                                                                      obscureText: _obscureText,
                                                                      controller: _clave,
                                                                      validator: (value) {
                                                                        if (value!.isEmpty) {
                                                                          return "";
                                                                        }
                                                                        else if(value.length<8){
                                                                          return "Ingrese + de 7 caracteres";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration: InputDecoration(
                                                                        enabledBorder: UnderlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                        ),
                                                                        focusedBorder: UnderlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.white), // Cambia este valor al color deseado
                                                                        ),
                                                                        suffixIcon: IconButton(
                                                                          onPressed: () {
                                                                            setState(() {
                                                                              _obscureText = !_obscureText;
                                                                            });
                                                                          },
                                                                          icon: Icon(
                                                                            _obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: TextStyle(
                                                                      color: Colors.white, // Cambia este valor al color deseado
                                                                    ),
                                                                    ),
                                                                  ],
                                                                )
                                                            )
                                                          ]
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.center,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(top: 5),
                                                        child: ElevatedButton.icon(
                                                          onPressed: () {
                                                            singIn(context);
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color.fromRGBO(255, 115, 28, 9),
                                                            minimumSize: const Size(200, 56),
                                                            shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(10),
                                                                topRight: Radius.circular(25),
                                                                bottomRight: Radius.circular(25),
                                                                bottomLeft: Radius.circular(25),
                                                              ),
                                                            ),
                                                          ),
                                                          icon: const Icon(
                                                            CupertinoIcons.arrow_right,
                                                            color: Color.fromRGBO(255, 205, 163, 9),
                                                          ),
                                                          label: const Text("SIGN UP", style: TextStyle(fontFamily: "Raleway", fontSize: 25)),
                                                        ),
                                                      ),
                                                    )
                                                  ])
                                          )
                                        ]
                                    ),
                                  )
                                  // Text("Hola", style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),)
                                ],
                              ),
                            ),

                          ],
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Image.asset("assets/img/letrasMABLAnaranja.png", width: 200),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: Text("HABLA CON LAS MANOS", style: TextStyle(fontFamily: "MartianMono", fontSize: 25, color: orange)),
                              )
                            ],
                          )
                        )
                      ],
                    )

                )
            )
        )
    );
  }
}

/*
void loginContent(BuildContext context, {required ValueChanged onValue}){
  showGeneralDialog(context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
      return Center(
        child: SingleChildScrollView(
          child: Container(
            height: 720,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(116, 199, 184, 9),
              borderRadius: BorderRadius.circular(40),
            ),
            child: login(),
          ),
        ),
      );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
    // if (anim.status == AnimationStatus.reverse) {
    //   tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
    // } else {
    //   tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
    // }

    tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

    return SlideTransition(
      position: tween.animate(
        CurvedAnimation(parent: anim, curve: Curves.easeInOut),
      ),
      // child: FadeTransition(
      //   opacity: anim,
      //   child: child,
      // ),
      child: child,
    );
  },
  ).then(onValue);
}
*/
