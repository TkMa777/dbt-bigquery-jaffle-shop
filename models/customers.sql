-- Création une table temporaire customers avec les données sélectionnées sur les clients
with customers as (
    select id,               -- sélection de l'identifiant du client
           first_name,       -- sélection du prénom du client
           last_name         -- sélection du nom de famille du client
    from dbt-tutorial.jaffle_shop.customers  -- de la table customers dans le schéma jaffle_shop
),

-- Création une table temporaire orders avec les données sélectionnées sur les commandes
orders as (
    select id,
           user_id,
           order_date,
           status
    from `dbt-tutorial`.jaffle_shop.orders
),

-- Création une table temporaire customer_orders pour agréger les données sur les commandes de chaque client
customer_orders as (
    select
        user_id,
        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(id) as number_of_orders
    from orders
    group by user_id
),

-- Requête finale, combinant les informations sur les clients et leurs commandes
final as (
    select
        customers.id,                          -- sélection de l'identifiant du client
        customers.first_name,                  -- sélection du prénom du client
        customers.last_name,                   -- sélection du nom de famille du client
        customer_orders.first_order,           -- sélection de la date de la première commande du client
        customer_orders.most_recent_order,     -- sélection de la date de la dernière commande du client
        customer_orders.number_of_orders       -- sélection du nombre de commandes du client
    from customers
    left join customer_orders                 -- join gauche entre les tables
    on customers.id = customer_orders.user_id -- condition de join : l'identifiant du client dans customers correspond au user_id dans customer_orders
)

-- Sélection de touts les données de la table finale
select * from final
