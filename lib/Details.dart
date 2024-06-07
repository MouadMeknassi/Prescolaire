import 'package:flutter/material.dart';
import 'package:flutter_application_1/Enfant.dart';

class Details extends StatelessWidget {
  Enfant? F;
  Details(Enfant f){super.key ;this.F=f;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail de l'enfant"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("Le Nom de votre enfants est : ${F!.Nom}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 30,),
            Text("Le Prenom de votre enfants est : ${F!.Prenom}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 30,),
            Text("Le date de votre enfants est : ${F!.Date}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 30,),
            Text("Le montant à payer est : ${F!.calculerMontant()}",style: TextStyle(fontSize: 20),),
          ],
          ),
      ),
    );
  }
}