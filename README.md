# 🎮 Player Activity Database

This project sets up a PostgreSQL server with tables for **players**, **games**, and **scores**.
It uses **Docker** for containerization and **pgAdmin** for database management.

---

## 📂 Project Structure

- `docker-compose.yml` - Defines the Postgres database and pgAdmin containers.
- `schema.sql` - SQL file to create the databse tables.
- `seed.sql` - SQL file to insert test data.
- `queries.sql` - Some prepared queries to extract information from the database.
- `README.md` - This documention!

## ✅ How to Run This Project

1. Make sure Docker and Docker Compose are installed.
2. Open a terminal in the project folder.
3. Start the server in the Docker container using the following command:
    ```
    docker-compose up
    ```
4. Open **pgAdmin** at `localhost:8080` and log in using the credentials in the `docker-compose.yml` file.

---

## Database Tables

- **players** - Stores player information (id, name, join_date).
- **games** - Stores game information (id, title, genre).
- **scores** - Links the players and games tables with scores and play dates.
