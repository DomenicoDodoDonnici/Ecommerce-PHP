/!\ La cartella dentro XAMPP htdocs se non si desidera modificare il progetto dovrà chiamarsi 'shoppingcart', come configurato di default nel codice

# 🛒 Sito E-commerce realizzato con PHP puro e JavaScript vanilla

Questo progetto è un sito e-commerce costruito senza l'utilizzo di framework. Il mio obiettivo era imparare a programmare un'applicazione funzionale per comprendere i fondamenti della programmazione orientata agli oggetti (OOP) e dell'architettura MVC, configurando al contempo un ambiente di sviluppo relativamente moderno.

## ⚒️ Questo progetto è stato realizzato utilizzando:

- PHP
- JavaScript
- Pacchetti Composer come:
  - philo/laravel-blade come motore di templating
  - PHPMailer: per inviare email
  - Omnipay per gestire i pagamenti tramite API PayPal
- Webpack & Babel
- Sass

## ⚙️Installazione

Se vuoi testare questo progetto sulla tua macchina locale, devi seguire questi passaggi:

1.  **Scarica il codice**
    Puoi scaricare il file .zip o eseguire `git clone https://github.com/DomenicoDodoDonnici/Ecommerce.git`

2.  **Installa le dipendenze**
    Poi, installa tutte le dipendenze eseguendo:
    `npm install` e `composer install`

3.  **Importa il database**
    Vai al tuo gestore di database e importa il file .sql situato in `resources/data/`. Il comando `CREATE DATABASE` è già incluso.

4.  **Aggiorna le variabili d'ambiente**
    Crea un file `.env` e imposta le seguenti variabili:

    ```
        URLROOT
        SECRET_KEY
        ------------------
        DB_HOST
        DB_USER
        DB_PASS
        DB_NAME
        ------------------
        BRAND_EMAIL
        BRAND_EMAIL_PASS
        ------------------
        PAYPAL_EMAIL
        PAYPAL_USERNAME
        PAYPAL_PASSWORD
        PAYPAL_SIGNATURE
        PAYPAL_CLIENT_ID
        PAYPAL_SECRET
    ```

    E cambia l'URL base del progetto in [resources/scripts/CartUI.js] che è impostato per localhost
    **(linee 77 e 116)**.

    Una piccola cosa che potresti voler cambiare o addirittura eliminare è il fuso orario che ho impostato in [public/index.php]

    `date_default_timezone_set('Europe/Rome');`

## 🏆 Obiettivi raggiunti

- [x] Imparare i principi dell'OOP e come applicare l'architettura MVC
- [x] Come lavorare con sessioni e cookie in PHP
- [x] Implementare l'autenticazione degli utenti (accesso, disconnessione, ricordo della sessione, recupero password, ecc.).
- [x] Lavorare con librerie di terze parti
- [x] Praticare JavaScript moderno e trascriverlo usando Webpack e Babel
- [x] Basi del controllo di versione con Git (lavorare con repository, commit, branching e merging).
- [x] Configurare PayPal sandbox
