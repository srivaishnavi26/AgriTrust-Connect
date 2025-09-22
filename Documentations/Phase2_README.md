# Phase 2: Org Setup & Configuration

[cite_start]This document summarizes all setup and configuration tasks completed during Phase 2 of the AgriTrust Connect project to establish the system's technical foundation[cite: 104].

---
## 1. Developer Org & DevOps Setup

The initial environment for development and version control was established.

* [cite_start]A **Salesforce Developer Edition Org** was created[cite: 107].
* [cite_start]Development tools, including **VS Code** with Salesforce extensions and the **Salesforce CLI (SFDX)**, were installed and configured[cite: 109, 110].
* [cite_start]A **GitHub repository** was created and connected to the project for version control[cite: 111].
* [cite_start]An initial DevOps workflow using SFDX commands was established[cite: 112].

---
## 2. Company Profile & Global Settings

Core organizational settings were configured to reflect the project's context.

* **Company Name:** AgriTrust Connect Pvt. [cite_start]Ltd [cite: 114]
* [cite_start]**Locale:** English (India) [cite: 116]
* [cite_start]**Time Zone:** IST (GMT+05:30) [cite: 117]
* [cite_start]**Currency:** INR [cite: 118]
* [cite_start]**Business Hours:** Monday - Saturday, 9:00 AM to 6:00 PM[cite: 120].
* [cite_start]**Holidays:** Configured for Diwali, Pongal, Independence Day, and Republic Day[cite: 121].
* [cite_start]**Fiscal Year:** Set to a standard fiscal year starting in April[cite: 123].

---
## 3. User, Role, & Profile Setup

[cite_start]Users, roles, and profiles were created to manage access for different stakeholders[cite: 105].

* **User Types Created:**
    * [cite_start]Admin User [cite: 125]
    * [cite_start]Farmer User [cite: 126]
    * [cite_start]Extension Officer User [cite: 127]
    * [cite_start]Buyer User [cite: 127]
    * [cite_start]Supplier User [cite: 128]
* **Role Hierarchy Established:**
    * [cite_start]System Administrator [cite: 131]
    * [cite_start]Farmer [cite: 132]
    * [cite_start]Extension Officer [cite: 133]
    * [cite_start]Buyer [cite: 134]
    * [cite_start]Supplier [cite: 135]
    * [cite_start]Government Officer [cite: 136]
* **Custom Profiles Defined:**
    * [cite_start]Admin Profile (Full Access) [cite: 138]
    * [cite_start]Farmer Profile (Restricted Access) [cite: 139]
    * [cite_start]Extension Officer Profile (Farmer data access) [cite: 140]
    * [cite_start]Buyer Profile (Procurement data) [cite: 141]
    * [cite_start]Supplier Profile (Input/product data) [cite: 142]

---
## 4. Security & Sharing Model

A foundational security model was implemented to protect data.

* [cite_start]**Permission Sets:** Created for "Weather Data Access" [cite: 144] [cite_start]and "Financial Data Access" [cite: 145] to grant additional permissions.
* **Org-Wide Defaults (OWD):**
    * [cite_start]Farmer records set to **Private**[cite: 148].
    * [cite_start]Crop/advisory data set to **Controlled by Parent**[cite: 149].
    * [cite_start]Buyer/Supplier data set to **Read Only**[cite: 150].
* **Sharing Rules:**
    * [cite_start]A rule was created to allow Extension Officers to view the data of farmers assigned to them[cite: 152].
* [cite_start]**Field-Level Security (FLS):** Applied to restrict access to sensitive financial fields[cite: 157].

---
## 5. Next Steps

[cite_start]With the foundational org setup complete, the project is ready to proceed to the next phase[cite: 169].

* [cite_start]**Next Phase:** Phase 3: Data Modeling & Relationships[cite: 169].
* **Upcoming Activities:**
    * [cite_start]Create custom objects like `Farmers`, `Farms`, and `Crop Cycles`[cite: 171].
    * [cite_start]Define object relationships using the Schema Builder[cite: 172].
    * [cite_start]Set up Record Types and Page Layouts[cite: 173].
