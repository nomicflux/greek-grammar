{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module Text.Greek.Mounce.NounFirstDeclension where

import Text.Greek.Grammar
import Text.Greek.Mounce.Morphology
import Text.Greek.Mounce.Quote

firstDeclensionNouns :: [Cited NounCategory]
firstDeclensionNouns = 
  [ mounce §§ ["n-1a"] $
    [nounCategory| 
      Feminine nouns with stems ending in εα, ια, or ρα and a genitive in ας
           sg: pl:
      nom: α   αι
      gen: ας  ων
      dat: ᾳ   αις
      acc: αν  ας
      voc: α   αι
      lemmas:
        Ἅννα Εὕα Ἱεροσόλυμα Ἰωάνα Ἰωάννα Μάρθα Νύμφα Ῥεβέκκα στοά
        ἀγαθοποιΐα ἀγγελία ἄγκυρα ἁγνεία ἄγνοια
        ἀγνωσία ἀγορά ἄγρα ἀγρυπνία ἀγωνία
        ἀδιαφθορία ἀδικία ἀηδία ἀθανασία ἀιματεκχυσία
        αἰσχρολογία αἰτία αἰχμαλωσία ἀκαθαρσία ἀκαταστασία
        ἀκρασία ἀκρίβεια ἀκροβυστία ἀλαζονεία ἀλεκτοροφωνία
        ἀλήθεια ἀμαρτία ἀναίδεια ἀναλογία ἀνεγκλησία
        ἀνθρακιά Ἅννα ἄνοια ἀνομία ἀντιλογία
        ἀντιμισθία Ἀντιόχεια ἀπείθεια ἀπιστία ἀποκαραδοκία
        Ἀπολλωνία ἀπολογία ἀπορία ἀποστασία ἀποτομία
        ἀπουσία Ἀπφία ἀπώλεια ἀρά Ἀραβία
        ἀρεσκεία Ἁριμαθαία ἀσέβεια ἀσέλγεια ἀσθένεια
        Ἀσία ἀσιτία ἀσφάλεια ἀσωτία ἀτιμία
        Ἀττάλεια αὐτάρκεια ἀφειδία ἀφθαρσία ἀφθονία
        ἀφθορία Ἀχαΐα βασιλεία Βέροια Βηθαβαρά
        Βηθανία βία Βιθυνία βλασφημία βοήθεια
        Γαλατία Γαλιλαία Γαλλία γενεά γενεαλογία
        γερουσία Γόμορρα γυμνασία γωνία Δαλματία
        δειλία δεισιδαιμονία διακονία διάνοια διασπορά
        διαφθορά διγαμία διδασκαλία διερμηνεία διετία
        δικαιοκρισία διχοστασία δοκιμασία δουλεία δυσεντερία
        δυσφημία δωρεά δωροφορία ἐγκράτεια ἐθελοθρησκία
        εἰδέα εἰδωλολατρία εἰλικρίνεια ἐκκλησία ἐκτένεια
        ἐλαία ἐλαφρία ἐλευθερία ἐμπορία ἐνέδρα
        ἐνέργεια ἔννοια ἐξουσία ἐπαγγελία ἐπαρχεία
        ἐπιείκεια ἐπιθυμία ἐπικουρία ἐπιμέλεια ἐπίνοια
        ἐπιποθία ἐπιτιμία ἐπιφάνεια ἐπιχορηγία ἐργασία
        ἐρημία ἐριθεία ἑρμηνεία ἑσπέρα ἑτοιμασία
        Εὕα εὐγλωττία εὐγλωττία εὐδία εὐδοκία
        εὐεργεσία εὐκαιρία εὐλάβεια εὐλογία εὔνοια
        Εὐοδία εὐοχία εὐποιΐα εὐπορία εὐπρέπεια
        εὐσέβεια εὐτραπελία εὐφημία εὐχαριστία εὐωδία
        εὐωχία ἐφημερία ἔχθρα ζευκτηρία ζημία
        ἡγεμονία ἡλικία ἡμέρα ἡσυχία θεά
        θεοσέβεια θεραπεία Θεσσαλία θεωρία θήρα
        θρησκεία θύρα θυσία ἰδέα Ἰδουμαία
        ἱερατεία Ἱεροσόλυμα ἱκετηρία Ἰουδαία Ἰουλία
        Ἰταλία Ἰωάνα Ἰωάννα καθέδρα Καισάρεια
        κακία κακοήθεια κακοπάθεια κακοπαθία καλοκαγαθία
        Καππαδοκία καραδοκία καρδία καταλαλιά κατάρα
        κατηγορία κατήφεια κατοικία Κεγχρεαί κειρία
        κενοδοξία κενοφωνία κεραία κιθάρα Κιλικία
        Κλαυδία κληρονομία κλισία κοιλία κοινωνία
        κολακεία κολυμβήθρα κολωνία κοπρία κουστωδία
        κυβεία κυρία λαλιά Λαοδίκεια Λασαία
        Λασέα λατρεία λειτουργία Λέκτρα λέπρα
        λίτρα λογεία λογομαχία λοιδορία Λυδία
        Λυκαονία Λυκία Λύστρα λυχνία μαγεία
        μαθήτρια Μακεδονία μακροθυμία μαλακία μανία
        Μάρθα Μαρία μαρτυρία ματαιολογία μεθοδεία
        μεσημβρία Μεσοποταμία μετάνοια μετοικεσία μήτρα
        μισθαποδοσία μνεία μοιχεία Μυσία μωρία
        μωρολογία νεομηνία νηστεία νομοθεσία νοσσιά
        νουθεσία νουμηνία Νύμφα ξενία ὁδοιπορία
        οἰκετεία οἰκία οἰκοδομία οἰκονομία οἰνοφλυγία
        ὀλιγοπιστία ὁλοκληρία ὁμιλία ὁμολογία ὀπτασία
        ὀπώρα ὀργυιά ὁρκωμοσία ὁροθεσία οὐρά
        οὐσία ὀφθαλμοδουλία ὀψία παιδεία παλιγγενεσία
        Παμφυλία πανοπλία πανουργία παραγγελία παραμυθία
        παρανομία παραφρονία παραχειμασία παρηγορία παρθενία
        παροικία παροιμία παρουσία παρρησία πατριά
        πεῖρα πενθερά Πέραια περικεφαλαία περισσεία
        περιστερά πέτρα πήρα πιθανολογία πικρία
        Πισιδία πλατεῖα πλεονεξία πλευρά πληροφορία
        ποία πολιτεία πολυλογία πολυπλήθεια πονηρία
        πορεία πορία πορνεία πορφύρα πραγματεία
        πρασιά πραϋπάθεια πρεσβεία προθεσμία προθυμία
        πρόνοια προσδοκία προσφορά προσωπολημψία προσωποληψία
        προφητεία πρωΐα πρωτοκαθεδρία πρωτοκλισία πτωχεία
        πυρά ῥᾳδιουργία Ῥεβέκκα ῥομφαία ῥυπαρία
        Σαμάρεια Σαμαρία Σάρρα σειρά Σελεύκεια
        σκηνοπηγία σκιά σκληροκαρδία σκοτία σοφία
        Σπανία σπορά στεῖρα στενοχωρία στοά
        στρατεία στρατιά συγγένεια συγκυρία συκομορέα
        συμποσία συμφωνία συνήθεια συνοδία συνορία
        συντέλεια συντυχία συνωμοσία Σύρα Ευρία
        σωτηρία ταλαιπωρία τεκνογονία τιμωρία τριετία
        τροχιά τρυμαλία ὑδρία υἱοθεσία ὑπερηφανία
        ὑπόνοια φαντασία φαρμακεία φθορά Φιλαδέλφεια
        φιλαδελφία φιλανθρωπία φιλαργυρία φιλία φιλονεικία
        φιλοξενία φιλοσοφία Φρυγία φυτεία χαρά
        χήρα χρεία χρηστολογία χώρα ψευδομαρτυρία
        ὥρα ὠφέλεια
      |]
  , mounce §§ ["n-1b"] $
    [nounCategory| 
      Feminine nouns with stems ending in η and a genitive in ης
           sg: pl:
      nom: η   αι
      gen: ης  ων
      dat: ῃ   αις
      acc: ην  ας
      voc: η   αι
      lemmas:
        Ἀβιληνή ἀγαθωσύνη ἀγάπη ἀγέλη ἁγιωσύνη
        ἀγκάλη ἀγωγή ἀδελφή αἰσχύνη ἀκοήἀλόη 
        ἀμοιβή ἀναβολή ἀνάγκη ἀναστροφή ἀνατολή 
        ἀνοχή ἀξίνη ἀπαρχή ἀπάτη ἀπειλή 
        ἀποβολή ἀπογραφή ἀποδοχή ἀποθήκη ἀποστολή 
        ἀρετή ἁρπαγή ἀρχή ἀστραπή ἀσχημοσύνη
        αὐγή αὐλή ἁφή ἀφορμή ἀφροσύνη 
        βελόνη Βερνίκη βοή βολή βοτάνη 
        βουλή βροντή βροχή γαλήνη γενετή
        γνώμη γραφή δαπάνη Δέρβη δέσμη
        διαθήκη διαπαρατριβή διαστολή διαταγή διατροφή
        διδαχή δικαιοσύνη δίκη δοκιμή δούλη
        δοχή ραχμή δυσμή ἐγκοπή εἰρήνη
        ἐκβολή ἐκδοχή ἐκκοπή ἐκλογή ἐλεημοσύνη
        ἐμπαιγμονή ἐμπλοκή ἐντολή ἐντροπή ἐξοχή
        ἑορτή ἐπεισαγωγή ἐπιβουλή ἐπιγραφή ἐπιλησμονή
        ἐπισκοπή ἐπιστήμη ἐπιστολή ἐπιστροφή ἐπισυναγωγή
        ἐπιταγή ἐπιτροπή Εὐνίκη εὐσχημοσύνη εὐφροσύνη
        εὐχή ζύμη ζωή ζώνη ἡδονή
        θέρμη Θεσσαλονίκη θήκη ἱερωσύνη Ἰόππη
        καλάμη Κανδάκη καταβολή καταδίκη καταλλαγή 
        καταστολή καταστροφή κατατομή κεφαλή Κλαύδη
        κλίνη κλοπή κοίτη Κολασσαί Κολοσσαί
        κόμη κοπή κραιπάλη κραυγή Κρήτη
        κριθή κρύπτη Κυρήνη κώμη λήθη
        Λιβύη λίμνη λόγχη λύπη Μαγδαληνή
        μάμμη μάχη μεγαλωσύνη μέθη Μελίτη
        μετοχή μηλωτή Μιτυλήνη μνήμη μομφή
        μονή μορφή νεφέλη νίκη νομή
        νύμφη ὀδύνη ὀθόνη οἰκοδομή οἰκουμένη
        ὁμίχλη ὀπή ὀργή ὁρμή ὁσμή
        ὀφειλή παιδίσκη πάλη παραβολή παραδιατριβή
        παραθήκη παρακαταθήκη παρακοή παραλλαγή παρασκευή
        παραφροσύνη παρεμβολή πέδη πεισμονή πεντηκοστή
        Πέργη περιοχή περιτομή πηγή πλάνη
        πληγή πλησμονή πλοκή πνοή ποίμνη
        πόρνη προκοπή προσαγωγή προσευχή προσκοπή
        πυγμή πύλη ῥέδη ῥιπή Ῥόδη
        ῥοπή ῥύμη Ῥώμη σαγήνη Σαλμώνη
        Σαλώμη Σαμοθρᾴκη σαργάνη σελήνη σιγή
        σκάφη σκευή σκηνή σπουδή σταφυλή
        στέγη στιγμή στολή συγγνώμη συναγωγή
        συνδρομή συνοχή Συντύχη συστροφή σφαγή
        σχολή σωφροσύνη ταβέρναι ταπεινοφροσύνη ταραχή
        ταφή τελευτή τέχνη τιμή τροπή
        τροφή τρυφή ὕλη ὑπακοή ὑπερβολή
        ὑπεροχή ὑπομονή ὑποστολή ὑποταγή φάτνη
        φήμη φιάλη φίλη Φοίβη Φοινίκη
        φυγή φυλακή φυλή φωνή χλόη 
        χολή ψυχή ᾠδή
      |]
  , mounce §§ ["n-1c"] $
    [nounCategory|
      Feminine nouns with stems ending in α (where the preceding letter is not ε, ι, or ρ) and a genitive in ης
           sg: pl:
      nom: α   αι
      gen: ης  ων
      dat: ῃ   αις
      acc: αν  ας
      voc: α   αι
      lemmas:
        Ἀθῆναι ἄκανθα βασίλισσα γάγγραινα Γάζα
        γάζα γέεννα γλῶσσα δόξα Δρούσιλλα 
        ἐπιοῦσα ἔχιδνα θάλασσα Θέκλα θέρμα
        θύελλα μάχαιρα μεμβράνα μέριμνα πλήμμυρα
        Πρίσκα Πρίσκιλλα πρύμνα πρῷρα πτέρνα
        ῥίζα Σάπφιρα Σμύρνα σμύρνα Σουσάννα
        σπεῖρα Συράκουσαι Συροφοινίκισσα τράπεζα Τρύφαινα
        Τρυφῶσα Φοινίκισσα χάλαζα
      |]
 , mounce §§ ["n-1d"] $
   [nounCategory| 
     Masculine nouns with stems ending in α(ς) and a genitive in ου
          sg: pl:
     nom: ας  αι
     gen: ου  ων
     dat: ᾳ   αις
     acc: αν  ας
     voc: α   αι
     lemmas:
       Ἀδρίας Αἰνέας Ἀμασίας Ἁνανίας Ἀνδρέας
       Βαραχίας Ἑζεκίας Ζαχαρίας Ἠλίας Ἠσαΐας
       Ἰερεμίας Ἰεχονίας Ἰωνάθας Ἰωσίας Λυσανίας
       Λυσίας Μαθθίας Ματθίας Ματταθίας Μεσσίας
       μητραλῴας νεανίας Ὀζίας Οὐρίας Οχοζίας
       πατραλῴας πατρολῴας Σιμαίας
       βορρᾶς
     |] -- added βορρᾶς following the footnote on n-1h
 , mounce §§ ["n-1e"] $
   [nounCategory| 
     Masculine nouns with stems ending in α(ς) and a genitive in α
          sg: pl:
     nom: ας  *
     gen: α   *
     dat: ᾳ   *
     acc: αν  *
     voc: α   *
     lemmas:
       Ἀγρίππας Ἅννας Ἀντιπᾶς Ἁρέτας Ἀρτεμᾶς
       Βαραββᾶς Βαριωνᾶς Βαρναβᾶς βαρσαββᾶς βαρσαββᾶς 
       βορρᾶς Δημᾶς Ἐλύμας Ἐπαφρᾶς Ἑρμᾶς Θευδᾶς 
       Θωμᾶς Ἰούδας Ἰουνιᾶς Ἰωνᾶς Καϊάφας 
       Κηφᾶς Κλεοπᾶς Κλωπᾶς κορβανᾶς Λουκᾶς
       μαμωνᾶς Νυμφᾶς Ὀλυμπᾶς Παρμενᾶς Πατροβᾶς 
       Σατανᾶς Σίλας Σκευᾶς Στεφανᾶς χουζᾶς   
     |]
 , mounce §§ ["n-1f"] $
   [nounCategory|
     Masculine nouns with stems ending in η(ς) and a genitive in ου
          sg: pl:
     nom: ης  αι
     gen: ου  ων
     dat: ῃ   αις
     acc: ην  ας
     voc: α   αι
     lemmas:
       ᾅδης ἀδικοκρίτης ἀκροατής ἀνδραποδιστής ἀποστάτης
       Ἀρεοπαγίτης ἀρσενοκοίτης ἀρχιλῃστής ἀρχιτελώνης Ἀσιάρχης
       αὐλητής αὐτόπτης βαπτιστής βασανιστής βιαστής
       βουλευτής Γαλάτης γνώστης γογγυστής δανειστής
       δανιστής δεσμώτης δεσπότης διερμηνευτής δικαστής
       διώκτης δότης δυνάστης ἐθνάρχης εἰδωλολάτρης
       ἑκατοντάρχης Ἐλαμίτης Ἑλληνιστής ἐμπαίκτης ἐξορκιστής
       ἐπενδύτης ἐπιθυμητής ἐπιστάτης ἐπόπτης ἐργάτης
       ἑρμηνευτής εὐαγγελιστής εὐεργέτης Εὐφράτης ἐφευρετής
       ζηλωτής Ἡρῴδης θεριστής Ἰαμβρῆς Ἰάννης
       ἰδιώτης Ἱεροσολυμίτης Ἰορδάνης Ἰσκαριώτης Ἰσραηλίτης
       Ἰωάννης καθηγητής Κανανίτης καρδιογνώστης καταφρονητής
       κερματιστής κλέπτης κοδράντης κολλυβιστής κριτής
       κτίστης κυβερνήτης Λευίτης λῃστής λυτρωτής
       μαθητής μαργαρίτης μεριστής μεσίτης μετρητής
       μιμητής μισθαποδότης ναύτης Νικολαΐτης Νινευίτης
       νομοθέτης ξέστης οἰκέτης οἰκοδεσπότης οἰνοπότης
       ὀλεθρευτής ὀλοθρευτής ὀφειλέτης παιδευτής παραβάτης
       πατριάρχης πλανήτης πλεονέκτης πλήκτης ποιητής
       πολιτάρχης πολίτης πρεσβύτης προδότης προσαίτης 
       προσκυνητής προσωπολήμπτης προσωπολήπτης προφήτης πρωτοστάτης
       σαλπιστής Σαμαρίτης Σκύθης στασιαστής στρατιώτης
       στρατοπεδάρχης συζητητής συμμαθητής συμμιμητής συμπολίτης
       συμφυλέτης συνηλικιώτης συντεχνίτης συστασιαστής τελειωτής
       τελώνης τετράρχης τετραάρχης τεχνίτης τιμιότης
       τολμητής τραπεζίτης ὑβριστής ὑπηρέτης ὑποκριτής
       φαιλόνης φελόνης φρεναπάτης χάρτης χρεοφειλέτης
       χρεωφειλέτης ψευδοπροφήτης ψεύστης ψιθυριστής
    |]
 , mounce §§ ["n-1g"] $
   [nounCategory| 
     Masculine nouns with stems ending in η(ς) and a genitive in η
          sg: pl:
     nom: ης  *
     gen: η   *
     dat: ῃ   *
     acc: η   *
     voc: η   *
     lemmas:
       Μανασσῆς Ἰωσῆς
    |]   
 , mounce §§ ["n-1h(a)"] $
   [nounCategory|
     First declension contract nouns
          sg: pl:
     nom: α   αι
     gen: ας  ων
     dat: ᾳ   αις
     acc: αν  ας
     voc: α   αι
     lemmas:
       μνᾶ
    |]
 , mounce §§ ["n-1h(b)"] $
   [nounCategory| 
     First declension contract nouns
          sg: pl:
     nom: η   αι
     gen: ης  ων
     dat: ῃ   αις
     acc: ην  ας
     voc: η   αι
     lemmas:
       συκῆ γῆ
    |]
 , mounce §§ ["n-1h(c)"] $
   [nounCategory| 
     First declension contract nouns
          sg: pl:
     nom: ης  αι
     gen: ου  ων
     dat: ῃ   αις
     acc: ην  ας
     voc: η   αι
     lemmas:
       Απελλῆς Ἑρμῆς
    |] -- removed βορρᾶς from here and put in n-1d according to his footnote
 ]
