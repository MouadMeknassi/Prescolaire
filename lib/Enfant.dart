class Enfant {
  String Nom="";
  String Prenom="";
  String Date="";
  String Convention="";
  bool Transport= false;
  Enfant(this.Nom,this.Prenom,this.Date,this.Convention,this.Transport);
  
  int calculerAge(){
    final splitDate = this.Date.split('/');
    final now= DateTime.now();
    int age= (now.year - int.parse(splitDate[2]))*12+(now.month-int.parse(splitDate[1]));
    double aged=age/12;
    age=aged.toInt();
    print(age);
    return age;
  }
  bool EnfantValide(){
    if(this.calculerAge()>5 || this.calculerAge()<0){return false;} else return true;
  }
  double calculerMontant(){
    int age=this.calculerAge();
    double montant=0.0;
    if(this.EnfantValide()){
      if(age<3){
        montant=400;
      }else if (age==3){
        montant=300;
      }else if (age==4){
        montant=400;
      }else if (age==5){
        montant=500;
      }
    }
    if(this.Convention=="OCP" && montant!=0){
      montant=montant-montant*0.6;
    }
    if(this.Convention=="FM6" && montant!=0){
      montant=montant-montant*0.25;
    }
    if(this.Convention=="ONE" && montant!=0){
      montant=montant-montant*0.3;
    }
    if(this.Transport && montant!=0){
      montant=montant+100;
    }
    return montant;
  }

}