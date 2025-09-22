# AgriTrust Connect 🌱

![Salesforce DX](https://img.shields.io/badge/Built%20with-Salesforce%20DX-orange.svg)
![Status: In Development](https://img.shields.io/badge/Status-In%20Development-green.svg)
![TCS SmartBridge](https://img.shields.io/badge/Program-TCS%20SmartBridge-blueviolet)

A Salesforce-powered ecosystem digitizing the agricultural value chain for transparency, sustainability, and profitability. This platform connects smallholder farmers, agronomists, and corporate buyers to build a more efficient and equitable food system.

---

## Table of Contents

1.  [Problem Statement](#problem-statement)
2.  [Our Solution](#our-solution)
3.  [Key Features (Phase 1)](#key-features-phase-1)
4.  [Technology Stack](#technology-stack)
5.  [Getting Started](#getting-started)
6.  [Repository Structure](#repository-structure)
7.  [Project Context](#project-context)

---

## Problem Statement

Smallholder farmers, particularly in regions like Anantapur, face significant challenges including limited access to scientific advice, opaque supply chains, and unfair pricing. This leads to reduced profitability and high post-harvest losses. Simultaneously, corporate buyers struggle with inconsistent quality and a lack of traceability needed to meet modern ESG (Environmental, Social, Governance) standards.

---

## Our Solution

**AgriTrust Connect** is a holistic platform built on Salesforce that addresses these challenges by creating a single source of truth.

* **For Farmers:** A simple, mobile-first interface to receive data-driven advice and gain direct access to markets.
* **For Agronomists:** A powerful tool to manage a portfolio of farms, track data, and provide timely, scalable support.
* **For Buyers:** A transparent portal to procure produce with complete traceability from farm to fork, ensuring quality and sustainability.

---

## Key Features (Phase 1)

* 🌾 **Farm & Crop Cycle Management:** A 360-degree view of all farms, plots, and activities from sowing to harvest.
* 📱 **Farmer Mobile Portal:** A simplified Experience Cloud portal for farmers to log activities and view personalized advisories.
* 🤖 **Automated Advisories:** Record-triggered flows that provide timely alerts for pest control, irrigation, and other critical tasks.
* 🔗 **Supply Chain Traceability:** Custom objects that create an immutable ledger, tracking produce from the specific plot it was grown on to the final buyer.
* 📊 **Analytics & Dashboards:** Real-time dashboards for regional managers to monitor crop yields, agronomist performance, and supply chain efficiency.
* 🌦️ **Weather API Integration:** Asynchronous Apex callouts to a weather API to generate proactive weather alerts.

---

## Technology Stack

* **Core Platform:** Salesforce Lightning Platform
* **UI:** Lightning Web Components (LWC) & Experience Cloud
* **Backend Logic:** Apex (Triggers, Schedulable, Asynchronous)
* **Automation:** Salesforce Flow & Approval Processes
* **DevOps:** Salesforce DX, VS Code, Git & GitHub

---

## Getting Started

Follow these instructions to get a copy of the project up and running in your own Salesforce environment for development and testing purposes.

### Prerequisites

* [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)
* [Visual Studio Code](https://code.visualstudio.com/) with the [Salesforce Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode)
* A Salesforce Developer Edition Org or a Sandbox

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/agritrust-connect.git](https://github.com/your-username/agritrust-connect.git)
    cd agritrust-connect
    ```

2.  **Authorize your Salesforce Org:**
    ```bash
    sfdx auth:web:login --setalias my-dev-org --instanceurl [https://login.salesforce.com](https://login.salesforce.com)
    ```

3.  **Deploy the source code to your org:**
    ```bash
    sfdx force:source:deploy --targetusername my-dev-org --sourcepath force-app
    ```

4.  **Assign Permission Sets:**
    ```bash
    sfdx force:user:permset:assign --targetusername my-dev-org --permsetname Agronomist
    ```
    *(Note: Permission set names are examples and will be defined during development.)*

---

## Project Context

This project is being developed as part of the **TCS SmartBridge** program. It serves as a practical application of Salesforce development and architecture skills to solve a real-world challenge in the AgriTech sector.






## Phase 2: Org Setup & Configuration – AgriTrust Connect

This section captures all configuration and org setup tasks completed under Phase 2.

---

### Salesforce Dev Org Setup & Connection

- Developer Edition org created, user credentials confirmed  
- VS Code + Salesforce CLI (SFDX) setup, repo connected to the org

---

### Company Profile & Organization Settings

- Company Name: AgriTrust Connect Pvt. Ltd  
- Default Locale: English (India)  
- Default Time Zone: (GMT+05:30) IST  
- Currency: INR  

---

### Business Hours & Holidays

- Business Hours: Mon-Sat, 9:00 AM – 6:00 PM  
- Holidays configured: (list the holidays you added, e.g. Diwali, Independence Day, Pongal, etc.)

---

### Fiscal Year

- Standard Fiscal Year used  
- Fiscal Year start month: April  

---

### Users & Licenses

- Admin User created  
- Farmer user created  
- Extension Officer user created  
- Buyer user created  

---

### Roles, Profiles & Permission Sets

- Roles established: Admin, Farmer, Extension Officer, Supplier, Buyer, Government Officer  
- Profiles created: Admin profile (full access), Farmer profile, Extension Officer profile, Buyer profile, Supplier profile  
- Permission Sets added: “Weather Data Access”, “Financial Data Access”  

---

### Security & Access

- Org-Wide Defaults (OWD) set: Farmer records private; Crop/Advisory records (as per parent or restricted)  
- Sharing rules configured: Farmer records shared with their assigned Extension Officer  
- Login / password policies: Admin login access, field-level security set for sensitive fields  

---

### Dev & Deployment Basics

- Org used for both development & testing (no separate sandbox)  
- Version control: Setup via GitHub repo  
- Metadata deployments handled through VS Code + SFDX commands  

---
