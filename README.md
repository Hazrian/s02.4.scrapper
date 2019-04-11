
0) créer un fichier .gitignore et le completer avec les fichier qu'on ne veut pas push

1 ) Pour initialiser la gem rspec pour les tests :
        $ rspec --init

1bis) Créer un Gemfile :
    Indiquer les gem nécessaires, la version de ruby, source des gem

2)  Pour créer le Gemfile.lock et installer les gem nécessaires
        $ bundle install

                                    { 3)  Pour tester l'écriture de ton code (à taper dans le dossier avec fichier .rb) :
                                    {    $ rubocop
peut être installé avec le bundle   {
                                    { 4)  Pour utiliser le débugger PRY :
                                    {    require 'pry' en haut de ton programme concerné, puis binding.pry pour exécuter PRY dans ton code.

5)  POUR CACHER SES CLEFS API :
        require 'dotenv'# Appelle la gem Dotenv

        Dotenv.load('.env') # Ceci appelle le fichier .env (situé dans le même dossier que le programme Ruby) grâce à la gem Dotenv, et importe toutes les données enregistrées dans un hash ENV

        # Il est ensuite très facile d'appeler les données du fichier .env, par exemple là je vais afficher le contenu de la clé TWITTER_API_SECRET
        puts ENV['TWITTER_API_SECRET']

        # tout est stocké dans un hash qui s'appelle ENV. Tu peux le regarder en faisant :
        puts ENV
