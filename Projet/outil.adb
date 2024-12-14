WITH Ada.Text_IO,Ada.Integer_Text_IO,ada.Characters.Handling;
USE Ada.Text_IO,Ada.Integer_Text_IO,Ada.Characters.Handling;

PACKAGE BODY Outil IS

   PROCEDURE Inscription (Per,Nm: out T_mot) is
   K:Integer;
      Ok: Boolean:=True;

   BEGIN


      loop
          Put("Saisissez le nom de l'employer: ");
         Get_Line(Nm,K);
         Ok := True;
      Nm:=(others =>' ');

         -- Mettre les lettres en majuscule --
         Nm := To_upper(Nm);
         FOR I IN Nm'RANGE LOOP
            CASE Nm(I) IS
               WHEN 'A'..'Z' =>
                  NULL;
               WHEN 'a'..'z' =>
                  NULL;
               WHEN ' ' =>
                  EXIT;
         -- Le prenom peut contenir des " - " si il est entouré par des lettres --
               WHEN '-' =>
                  IF ((I = Nm'First) OR ELSE (I = Nm'Last)) OR ELSE ((Nm(I-1) = '-') OR ELSE (
                           Nm(I+1) = ' ')) THEN
                     Ok := False;
                     EXIT;
                  END IF;
         -- Le prenom peut contenir des " ' " si il est entouré par des lettres --
               WHEN ''' =>
                  IF ((I = Nm'First) OR ELSE (I =Nm'Last)) OR ELSE ((Nm(I-1) = ''') OR ELSE (
                           Nm(I+1) = ' ')) THEN
                     Ok := False;
                     EXIT;
                  END IF;
               WHEN OTHERS =>
                  Ok := False;
                  EXIT;
            END CASE;
         END LOOP;
         EXIT WHEN Ok = True;
         Put_Line ("commander impossible, erreur");
      END LOOP;

            LOOP
         Put("Saisissez le prenom de l'employer: ");
         Get_Line(Per,K);
         Ok := True;
      Per:=(OTHERS =>' ');
         -- Mettre les lettres en majuscule --
         Per := To_upper(Per);
         FOR I IN Per'RANGE LOOP
            CASE Per(I) IS
               WHEN 'A'..'Z' =>
                  NULL;
               WHEN 'a'..'z' =>
                  NULL;
               WHEN ' ' =>
                  EXIT;
         -- Le prenom peut contenir des " - " si il est entouré par des lettres --
               WHEN '-' =>
                  IF ((I = Per'First) OR ELSE (I = Per'Last)) OR ELSE ((Per(I-1) = '-') OR ELSE (
                           Per(I+1) = ' ')) THEN
                     Ok := False;
                     EXIT;
                  END IF;
         -- Le prenom peut contenir des " ' " si il est entouré par des lettres --
               WHEN ''' =>
                  IF ((I = Per'First) OR ELSE (I =Per'Last)) OR ELSE ((Per(I-1) = ''') OR ELSE (
                           Per(I+1) = ' ')) THEN
                     Ok := False;
                     EXIT;
                  END IF;
               WHEN OTHERS =>
                  Ok := False;
                  EXIT;
            END CASE;
         END LOOP;
         EXIT WHEN Ok = True;
         Put_Line ("commander impossible, erreur");
      END LOOP;
      Put_Line("Nom et prenom de l'enployer enregistre");
   END Inscription;

   PROCEDURE Desinscription (

      Pr: T_Mot:=(OTHERS => ' ');
      Ins: Integer;

      BEGIN
         Inscription(Pr,Nm);
         Ins:= Cherche(I,Pr,Nm)

            IF Ins=-1 THEN
            Put("Aucune inscription à ce nom");
         ELSE
            For


End Outil;



