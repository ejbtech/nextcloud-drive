# Nextcloud Drive Stack

This repository contains the **Nextcloud Drive** Docker stack configuration, customized and ready for production deployment. It integrates essential services such as a database, caching, and office collaboration.

## 🚀 Features

✅ Nextcloud (latest)  
✅ MariaDB (database)  
✅ Redis (caching)  
✅ Collabora Online (document editing)  
✅ Traefik reverse proxy with automatic Let's Encrypt SSL  
✅ Persistent storage volumes  
✅ Easy environment variable configuration via `.env`  
✅ Optimized for production deployments

---

## 🛠️ Requirements

- Docker Engine ≥ 20.x
- Docker Compose ≥ 2.x
- Domain name pointed to your server
- Open ports:
  - 80 (HTTP)
  - 443 (HTTPS)

---

## ⚙️ Stack Overview

| Service       | Purpose                    | Notes                       |
|---------------|----------------------------|-----------------------------|
| nextcloud     | Main web application       | Runs behind Traefik         |
| mariadb       | Database backend           | Persistent data storage     |
| redis         | Caching and transactions   | Improves performance        |
| collabora     | Document editing suite     | Optional but integrated     |
| traefik       | Reverse proxy + SSL        | Handles Let's Encrypt certs |

---

## 📦 How to Deploy

1. Clone this repository:

    ```bash
    git clone https://github.com/ejbtech/nextcloud-drive.git
    cd nextcloud-drive
    ```

2. Create your `.env` file from the example:

    ```bash
    cp .env.example .env
    ```

    Edit values for:
    - Domain name
    - Database credentials
    - Redis password
    - Nextcloud admin user/password

3. Start the stack:

    ```bash
    docker compose up -d
    ```

4. Access Nextcloud:

    ```
    https://yourdomain.com
    ```

---

## 🗃️ Data Persistence

All critical data is stored in Docker volumes:
- Nextcloud config and data
- MariaDB database files
- Redis data
- Collabora configuration (if applicable)

---

## 📝 Customization

- Update images or versions in `docker-compose.yml` as needed.
- Modify Traefik labels for custom routing.
- Adjust resource limits in Compose for production.

---

## 🛡️ Security Notes

✅ Enable strong Nextcloud admin credentials  
✅ Secure MariaDB and Redis passwords  
✅ Keep images updated for security patches  
✅ Set proper file permissions on volumes  
✅ Consider using a firewall to restrict access

---

## 📄 License

This project is licensed under the MIT License.

---

## 🙌 Author

**Eric Bouvier (EJB Technology Support, LLC)**  
[ejbtechsupport.com](https://ejbtechsupport.com)


