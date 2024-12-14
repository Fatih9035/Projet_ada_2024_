WITH Ada.Text_IO,Ada.Integer_Text_IO;
USE Ada.Text_IO,Ada.Integer_Text_IO;

PACKAGE Outils IS


   SUBTYPE T_Mot IS String (1..20);
   PROCEDURE Inscription (Per,Nm: OUT T_Mot);

End Outils;


