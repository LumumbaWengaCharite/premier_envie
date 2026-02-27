import 'dart:io';
class convertisseurRomain {
  /// liste des valeurs pour la conversion arab->romain 
  static const List<MapEntry<int,String>>
  valeurs =[
    MapEntry(1000, "M"),
    MapEntry(900, "CM"),
    MapEntry(500, "D"),
    MapEntry(400, "CD"),
    MapEntry(100, "C"),
    MapEntry(90, "XC"),
    MapEntry(50, "L"),
    MapEntry(40, "XL"),
    MapEntry(10, "X"),
    MapEntry(9, "IX"),
    MapEntry(5, "V"),
    MapEntry(4, "IV"),
    MapEntry(1, "I"),
    ];
   /// convertit un entier en chiffre romain 
     static String arabeVersRomain(int nombre ){
      if (nombre <=0||nombre >5000){
        return "Erreur: Le nombre doit etre entre entre 1 et 3999.";
      }
      String resultat="";
      for (var entry in valeurs){
        while (nombre>=entry.key){
          resultat+=entry.value;
          nombre -=entry.key;
        }
      }
        return resultat;

     }
     ///convertit un chiffre romain en entier
     static int romainVersArabe(String romain){
      Map<String, int>dico={
        'I':1,
        'V':5,
        'X':10,
        'L':50,
        'C':100,
        'D':500,
        'M':1000,
      };
      romain=romain.toUpperCase().trim();
      int total=0;
      int precedent=0;

      try {
        for(int i=romain.length-1;i>=0; i--){
          String char=romain[i];
          int actuel = dico[char]!;

          if(actuel<precedent){
            total-=actuel;

          }else{
            total-=actuel;
          }

          precedent=actuel;

        }
        return total;
      }catch (e){
        return-1;
        //caractere invalide
      }
     }
}

void main() {
  print("======================================");
  print("CONVERTISSEUR ARABE<->ROMAIN");
  print("=======================================");
  
  while(true){
    print("\nCchoissez une option :");
    print("1.Arabe->Romain");
    print("2.Romain->Arabe");
    print("Quitte");
    stdout.write("\nVotre choix:");
    String? choix =stdin.readLineSync();
    if(choix=='1'){
      stdout.write("entre un nombre arabe : ");
      String? input=stdin.readLineSync();
      int? num=int.tryParse(input??"");
      if(num != null){
        print("Resultat:${convertisseurRomain.arabeVersRomain(num)}");
      }else{
       print(" erreur: veuillez entrez un nombre entier valide.");
      }
    }
   else if(choix=='2'){
        stdout .write("entrez un nombre romain : ");
       String? chaine = stdin.readLineSync();
       int res =convertisseurRomain.romainVersArabe(chaine?? " ");
       if(res != -1){
       print("erreur:Veuillez entrer un nombre entier invalide.");
      }
    }
  }
}
