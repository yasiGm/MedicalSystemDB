# Medical System Database

> **University project.** The database schema for [MedicalSystem](https://github.com/yasiGm/MedicalSystem), built as coursework during my Computer Engineering degree.

## Contents

- `DB_create.sql` — recreates the full schema (tables, primary/foreign keys) for the Medical Office Management System.

The generated `.mdf`/`.ldf` SQL Server data files are not tracked in this repository (they're build output, not source) — run the script against a local SQL Server instance to recreate the database.

## Setup

1. Open the script in SQL Server Management Studio (or `sqlcmd`).
2. Run `DB_create.sql` against your SQL Server instance.
3. Point [MedicalSystem](https://github.com/yasiGm/MedicalSystem)'s connection string at the resulting database.
