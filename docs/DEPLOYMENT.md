#### Phase de migration depuis l'ancien serveur
 - [x] Stopper la prod, mais pas la base mysql. [~ 1 min]
 - [x] Faire le backup de la base de données en prod. [~ 20 min]
 - [x] Sauvegarder les fichiers ssl de la prod. [~ 2 min]
 - [x] Mettre à jour le serveur de prod (si possible le scratch complètement pour être sûr de bien reprendre la procédure de déploiment entièrement). [~ 10 min]

 - [x] MAJ aussi pour le serveur slave. [~ 5 min]

#### Une fois tout redémarré et fonctionnel
 - [ ] Exécuter la [mise en production](./MISE-EN-PROD.md) [~ 1 heure]
 - [ ] Configuration ufw pour master et slave [~ 1 min]
```
  ufw enable
  ufw default deny incoming
  ufw logging on
  ufw allow 22
  ufw allow 80
  ufw allow 443
  ufw allow from 172.17.0.0/24
```
 - [ ] Configurer le backup des données (même fichier Drive) [~ 5 min]

**Temps total :** < 2h

#### Phase de test
 - [ ] faire un nmap depuis nos postes sur escarcelle.net pour vérifier les ports ouverts
 - [ ] Aller sur http://escarcelle.net/pdv -> doit afficher le login 
 - [ ] Aller sur https://escarcelle.net/pdv  -> doit afficher le login et ne pas afficher d'erreurs SSL
 - [ ] Se connecter -> doit se connecter correctement
 - [ ] Cliquer sur les utilisateurs -> doit les afficher
 - [ ] Faire une modification des utilisateurs -> doit être appliquée (même après un rafraichissement de la page)
 - [ ] Parcourir les pages -> ne doit pas afficher de pages d'erreurs
 - [ ] Faire un test d'action (ajouter une entrée dans la base et la retirer)
 - [ ] Tester l'envoi de mails (par exemple l'envoi d'un bon de commande à un fournisseur)
 - [ ] Aller sur escarcelle.net/admin -> doit pouvoir se login
 - [ ] Tester la caisse (téléchargement d'une caisse, connexion, synchronisation tickets) -> doit fonctionner
