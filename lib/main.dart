import 'package:flutter/material.dart';
import 'package:flutter_application_1/CalculerAge.dart';
import 'package:flutter_application_1/CalculerTotal.dart';
import 'package:flutter_application_1/DisplayInfos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController test= TextEditingController();
  TextEditingController test2= TextEditingController();
  TextEditingController test3= TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  bool Transport = false;
  String Date='';
  String Nom='';
  String Prenom='';
  String Convention='';
  double total=0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Préscolaire",style: TextStyle(fontSize: 20),),
                      ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                /////////////////////////////////// Les champs de texte///////////////////////////////////////////////////////////
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                          Container(
                              width: 300,
          
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                              SizedBox(height: 30,),
                                       TextFormField(
                                        controller: test,
                                        validator: (value){
                                          if(value==null || value.isEmpty){
                                            return 'Ce champ ne peut pas être vide';
                                          }
                                          return null;
                                        },
                                    
                                    decoration: InputDecoration(
                                      label: Text("Nom de l'enfant"),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.black
                                        )
                                      )
                                    ),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Nom=value;
                                      print(Nom);
                                    },
                                     ),
                                     SizedBox(height: 30,),
                                          TextFormField(
                                            controller: test2,
                                        validator: (value){
                                          if(value==null || value.isEmpty){
                                            return 'Ce champ ne peut pas être vide';
                                          }
                                          return null;
                                        },
                                    
                                    decoration: InputDecoration(
                                      label: Text("Prénom de l'enfant"),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.black
                                        )
                                      )
                                    ),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Prenom=value;
                                      print(Prenom);
                                    },
                                     ),
                                     SizedBox(height: 30,),
                                  TextFormField(
                                    controller: test3,
                                        validator: (value){
                                          if(value==null || value.isEmpty){
                                            return 'Ce champ ne peut pas être vide';
                                          }
                                          return null;
                                        },
                                    
                                    decoration: InputDecoration(
                                      label: Text("Date de naissance de l'enfant"),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.black
                                        )
                                      )
                                    ),
                                    keyboardType: TextInputType.datetime,
                                    onChanged: (value) {
                                      Date=value;
                                      print(Date);
                                    },
                                     ),
                                ],
                              ),
                            ),
                          )
                             ],
                             ),
                         ),
             /////////////////////////////////// Fin//////////////////////////////////////////////////////////
             /// /////////////////////////////////// Radio///////////////////////////////////////////////////////////
             SizedBox(height: 50,),
             Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Convention : ",style: TextStyle(fontSize: 20),),
                  Text("OCP",style: TextStyle(fontSize: 18),),
                  Radio(
                    value: "OCP", 
                    groupValue: Convention, 
                    onChanged:(val){
                      setState(() {
                        Convention=val!;
                      });
                    }),
                     Text("FM6",style: TextStyle(fontSize: 18),),
                  Radio(
                    value: "FM6", 
                    groupValue: Convention, 
                    onChanged:(val){
                      setState(() {
                        Convention=val!;
                      });
                    }),
                     Text("ONE",style: TextStyle(fontSize: 18),),
                  Radio(
                    value: "ONE", 
                    groupValue: Convention, 
                    onChanged:(val){
                      setState(() {
                        Convention=val!;
                      });
                    }),
                ],
              ),
             ),
              /////////////////////////////////// Fin ///////////////////////////////////////////////////////////
              
              /////////////////////////////////// CheckBox///////////////////////////////////////////////////////////
              SizedBox(height: 30,),
              Container(
                 margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("Transport : ",style: TextStyle(fontSize: 20),),
                    Checkbox(value: Transport, onChanged: (val){
                      setState(() {
                        Transport=val!;
                      });
                    })
                  ],
                ),
              ),
              /////////////////////////////////////// Fin //////////////////////////////////////////////////////
              /////////////////////////////////// Bouton calculer///////////////////////////////////////////////////////////
              SizedBox(height: 30,),
              Container(
          
                child: Builder(
                  builder: (context) {
                    return MaterialButton(
                      color: Colors.grey,
                      child: Text("Calculer",style: TextStyle(fontSize: 20,color: Colors.white)),
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          print(test.text);
                          print(test2.text);
                          print(test3.text);
                    
                          CalculerAge calculerAge = CalculerAge(Date);
                          int age = calculerAge.calculerAge();
                          if (age <= 0 || age > 5) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text("The age must be between 1 and 5."),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }else{
                            print("Age: $age");  
                            CalculerTotal calculerTotal = CalculerTotal();
                            double total = calculerTotal.calculerTotal(Convention,Transport,age, Date);
                            print(total.toString()+'MAD');
                            DateTime dateTime = DateTime.parse(Date);
                            print(dateTime);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DisplayInfos(nom:Nom,prenom: Prenom,dateDeNaissance: Date,total: total)),
                            );
                          }
                        }
                    
                                  
                      });
                  }
                ),
              ),
                /////////////////////////////////// Fin ///////////////////////////////////////////////////////////
                ///
              
                        ],
                        ),
          ),
                       ),
    );
  }
}