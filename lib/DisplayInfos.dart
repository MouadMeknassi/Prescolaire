import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DisplayInfos extends StatelessWidget {

  final String nom;
  final String prenom;
  final String dateDeNaissance;
  final double total;
  DisplayInfos({required this.nom,required this.prenom,required this.dateDeNaissance,required this.total});

  //const DisplayInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title: Text("Informations de l'enfant",style: TextStyle(fontSize: 14,
          fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
          color: Color.fromARGB(123, 150, 144, 112)),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blueGrey[300],
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text("Le nom de l'enfant : $nom",style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.amberAccent)),
              Text("Le prénom de l'enfant : $prenom",style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.amberAccent)),
              Text("La date de naissance de l'enfant :$dateDeNaissance",style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.amberAccent)),
              Text("Le total est : ${total} MAD",style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.amberAccent))
            ],
          ), 
        ),
      ),
    );
  }
}