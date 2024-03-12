Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


# Projet DBT Jaffle Shop 

## Vue d'ensemble du projet

Ce projet `dbt-jaffle-shop` est conçu pour illustrer l'utilisation de dbt (Data Build Tool) avec BigQuery, en particulier pour transformer les données du schéma `jaffle_shop`. Il comprend des modèles, des tests, des analyses et des ensembles de données pour enseigner les principes de l'ingénierie analytique.

## Structure du projet

- `models/`: Dossier contenant les modèles dbt qui définissent les transformations des données.
- `analyses/`: Dossier contenant des requêtes analytiques pour explorer les données.
- `tests/`: Dossier incluant des tests pour assurer la qualité des données.
- `seeds/`: Dossier contenant des fichiers CSV à charger comme tables de données de référence.
- `macros/`: Dossier pour les macros SQL réutilisables.
- `snapshots/`: Dossier pour les configurations de snapshot, suivant les modifications des données.

## Configuration du profil dans profiles.yml

Le fichier `profiles.yml` joue un rôle crucial dans la configuration de dbt, contenant les détails nécessaires pour connecter dbt à votre entrepôt de données. Pour des raisons de sécurité, ce fichier n'est pas inclus dans le dossier du projet car il contient des informations sensibles telles que les clés d'accès.

Pour configurer correctement votre projet dbt, vous devez établir un fichier `profiles.yml` dans le dossier `~/.dbt/` sur votre machine. Voici comment procéder :

1. **Créez ou éditez le fichier `profiles.yml`** : Ce fichier doit résider dans le dossier `~/.dbt/` sur votre machine. S'il n'existe pas déjà, vous devrez le créer.

2. **Configurez le profil pour votre projet** : Dans le fichier `profiles.yml`, définissez un profil qui correspond au nom de profil indiqué dans votre `dbt_project.yml`. Si votre `dbt_project.yml` inclut `profile: 'dbt_jaffle_shop'`, vous devriez définir ce profil dans `profiles.yml` comme suit :

   ```yaml
   dbt_jaffle_shop:
     outputs:
       dev:
         type: bigquery
         method: service-account
         project: votre_project_id
         dataset: votre_dataset
         threads: 1
         keyfile: /chemin/vers/votre/fichier_de_cle.json
         timeout_seconds: 300
     target: dev



## Configuration du projet

- Le fichier `dbt_project.yml` définit la configuration globale, incluant les chemins pour les modèles, analyses, tests, etc.

## Modèles de données

- `customers`: Table des clients avec des informations essentielles telles que `id`, `first_name` et `last_name`.

## Instructions d'utilisation

- Utilisez `dbt docs generate` puis `dbt docs serve` pour générer et visualiser la documentation.
- Exécutez `dbt seed` pour charger les données de référence.
- Utilisez `dbt run` pour exécuter les modèles et `dbt test` pour lancer les tests.

Pour traiter les données de `jaffle_shop` avec `dbt-jaffle-shop` dans BigQuery, assurez-vous que votre configuration dbt est établie pour accéder à BigQuery et que vous avez les permissions nécessaires pour lire et transformer les données dans le schéma `jaffle_shop`.

