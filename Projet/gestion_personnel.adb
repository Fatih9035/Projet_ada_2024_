WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_Io,Outils;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_Io,Outils;

PACKAGE BODY Gestion_Personnel IS


-------------------------------------------Initialisation des donn�es du personnel --------------------------------------------

   PROCEDURE Inscrit (
         T: IN OUT T_Personnel) IS

   BEGIN

      T(1).Prenom(1..7):="Thierry";
      T(1).Nom(1..9):="La Fronde";
      T(1).Identifiant:=1;
      T(1).Fonction:=False;
      T(1).dispo:=True;
      T(1).Nbre_Actes:=2;

      T(2).Prenom(1..6):="Ars�ne";
      T(2).Nom(1..5):="Lupin";
      T(2).Identifiant:=2;
      T(2).Fonction:=True;
      T(2).dispo:=True;
      T(2).Nbre_Actes:=2;

      T(3).Prenom(1..4):="Mary";
      T(3).Nom(1..7):="Poppins";
      T(3).Identifiant:=3;
      T(3).Fonction:=False;
      T(3).dispo:=True;
      T(3).Nbre_Actes:=2;

      T(4).Prenom(1..5):="Marie";
      T(4).Nom(1..9):="Curie";
      T(4).Identifiant:=2;
      T(4).Fonction:=True;
      T(4).dispo:=True;
      T(4).Nbre_Actes:=2;

      T(5).Prenom(1..7):="Phil�as";
      T(5).Nom(1..9):="Fog";
      T(5).Identifiant:=5;
      T(5).Fonction:=False;
      T(5).dispo:=True;
      T(5).Nbre_Actes:=4;

END inscrit;

 -------------------------------Fonction pour verifier les homonymie -------------------------------

   FUNCTION Recherche (
      T: T_Personnel;
         Pr,Nm: T_Mot:=(OTHERS => ' ')) Return Integer IS

      Entier: Integer:= -1;

   BEGIN
      FOR I IN T'RANGE LOOP
         IF T(I).Present AND T(I).Nom= Nm AND T(I).Prenom= PR THEN
            Entier := I;
            EXIT;
         END IF;
      END LOOP;
      RETURN(Entier);
      END Recherche;

-----------------------Procedure d'affichage du Personnel ------------------------------

   PROCEDURE Visu_Personnel (
         T : IN  T_Personnel) IS

   BEGIN
      FOR I IN T'RANGE LOOP
         IF T(I).Present =True THEN
            Put(T(I).Nom);
            New_Line;
            Put(T(I).Prenom);
            New_Line;
            Put("identifiant: ");
            Put(T(I).Identifiant);New_Line;
            Put("Quelle est sa fonction: ");
            IF T(I).Fonction = True THEN
               Put("Analyste");
            ELSE
               Put("Preleveur");
            END IF;New_Line;
            Put("Nombre d'acte r�aliser: ");
            Put(T(I).Nbre_Actes);New_Line;
         END IF;
      END LOOP;
         End Visu_Personnel;

   ------------------------------------------- Visualisation de tout le personnel   -------------------------------------------


   PROCEDURE Visu_Total( T: IN T_Personnel) IS

   BEGIN

      FOR I IN T'RANGE LOOP
         IF T(I).Indispo THEN
            Visu_Personnel(T(I));
         END IF;
      END LOOP;

   END Visu_Total;



   ------------------------------------Procedure Inscription personnel   ------------------------------------




   PROCEDURE Inscription (T: OUT T_Personnel) IS

      RP:Charactere;
      pass:Boolean:=False;


   BEGIN
      Put_Line("Inscription d'un nouveau personnel");New_Line;
      IF Recherche (Pr,Nm)/=-1 THEN
         Put_Line("Erreur, Un employer est deja enregistrer avec ce nom");
      ELSE
         FOR I IN T'RANGE LOOP
            IF T(I).Dispo=False THEN
               Pass:=True;

            END IF;
            ENd loop;
            End IF;New_line;


      Put_Line("Saisisez la fonction de l'employer, A ou P ?");
      loop
         GEt(Rp);Skip_Line;
         CASE
                  To_Upper(RP) IS
            WHEN "A" =>
               T(I).Fonction:=True;
               Put("c'est une Analyste");
               EXIT;
            WHEN "P"=>
               T(I).Fonction:=False;
               Put("c'est un preleveur");
               Exit;
               WHEN OTHERS=>
               Put("Choissiez uniquement A ou P");New_Line;
         END CASE;
      END LOOP;
      End Inscription;


   ------------------------------------ Procedre de d�sinscription   ------------------------------------


      PROCEDURE Desinscription (
         T: IN OUT T_Personnel;
            Pr,Nm:T_Mot :=(OTHERS=>' '))IS

 Begin
            FOR I IN T'RANGE LOOP

      IF Recherche (Pr,Nm)/=-1 THEN
         Put_Line("Erreur, pas d'employer avec ce nom");
               ELSE
                  Recherche (Pr,Nm):=I Ans T(I).Dispo THEN
                  Archive_Personnel(Tp(I));
                  T(I).Prenom:=(OTHERS=>' ');
                  T(I).Nom:=(OTHERS=>' ');
                  T(I).Nbre_Actes:=0;
                  T(I).Dispo:=False;


       END LOOP;
       End IF;
         END Desinscription;












   End Gestion_personnel;


