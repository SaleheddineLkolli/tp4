# Utilisation d'une image nginx légère en tant que base
FROM nginx:alpine

# Copie du fichier index.html dans le répertoire de contenu par défaut de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Nginx utilise le port 80 par défaut, il n'est pas nécessaire de l'indiquer explicitement

# Commande pour démarrer Nginx une fois le conteneur lancé
CMD ["nginx", "-g", "daemon off;"]

