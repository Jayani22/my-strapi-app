# Strapi Local Setup – Task 1

## Overview
This task involves setting up Strapi locally, starting the Admin Panel, exploring the project structure and creating a sample content type. The goal is to understand how Strapi works from a developer and platform perspective.

---

## Prerequisites
- Node.js (v18 or v20 recommended)
- npm
- Yarn
- Git

---

## Repository Details
- Strapi Core Repository: https://github.com/strapi/strapi  
- Strapi Application: Created using the official Strapi CLI

> Note: The `strapi/strapi` repository contains the core Strapi framework and is not a directly runnable application.  
> To run Strapi locally, a Strapi application must be generated using the Strapi CLI.

## Setup Steps

### 1. Clone the Strapi Core Repository
````bash
git clone https://github.com/strapi/strapi.git
cd strapi
````
### 2. Prerequisite Verification
````bash
node -v
npm -v
git -v
````
All required tools were available and properly configured.

### 3. Install Dependencies

The Strapi repository uses Yarn workspaces.
Attempting to install dependencies using npm resulted in conflicts, so Yarn was used instead.
````bash
npm install -g yarn
yarn install
````

### 4. Create and Run a Strapi Application

A runnable Strapi application was created using the official Strapi CLI.

````bash
npx create-strapi-app@latest my-strapi-app --quickstart

````
During setup:

- Login and cloud features were skipped.
- Anonymous telemetry was declined.
- SQLite database was configured automatically.

The Admin Panel started successfully after setup.

Admin Panel URL:
http://localhost:1337/admin

### 5. Admin Panel Setup

- Created an Admin user
- Logged in successfully
- Verified that Strapi was running locally

### 6. Create a Sample Content Type

Using the Admin Panel:
- Created a collection type named Article
- Added the following fields:
    Title(Text)
    Description (Rich Text)
- Added a sample entry using Content Manager.

### Outcome
- Strapi Application running successfully on local machine
- Admin Panel Operational
- Sample content type created and tested
- Clear understanding of Strapi framework vs application structure
- Setup steps documented clearly

## Project Structure Overview

After running the Strapi application, I explored the project structure to understand how it is organized.

- `src/`: Contains the main application code, including APIs and content types.
- `config/`: Used for application and environment configuration.
- `database/`: Contains local database-related files.
- `public/`: Stores public assets.
- `node_modules/`: Contains installed dependencies.
- `types/`: Contains TypeScript type definitions.

This helped me understand where the main logic, configuration, and content-related code are placed in a Strapi application.

### Understanding of the Stripe Application 

Before this task, I do not have much knowledge about how Stripe works internally.

After going through the stripe repository, I understood that it is used by Go applications to connect with Stripe and use features like payments and customer management. 

Instead of writing API calls manually, this library provides ready-made functions to work with Stripe services.

I also noticed that the code is properly organized and maintained which shows that it is meant to be used in real production applications. 

This task helped me understand how developers use such libraries in real projects.
