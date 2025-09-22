# AgriTrust Connect - Complete Project Documentation

This document provides a complete overview of the AgriTrust Connect project, from its initial problem analysis in Phase 1 to the detailed org setup in Phase 2.

---

## Table of Contents

1.  **[Phase 1: Problem Understanding & Industry Analysis](#phase-1-problem-understanding--industry-analysis)**
    * [Project Goal](#project-goal)
    * [Requirement Gathering](#1-requirement-gathering)
    * [Stakeholder Analysis](#2-stakeholder-analysis)
    * [Business Process Mapping](#3-business-process-mapping)
    * [Technology & Risks](#4-technology--risks)
    * [Success Metrics & Future Vision](#5-success-metrics--future-vision)
2.  **[Phase 2: Org Setup & Configuration](#phase-2-org-setup--configuration)**
    * [Developer Org & DevOps Setup](#1-developer-org--devops-setup)
    * [Company Profile & Global Settings](#2-company-profile--global-settings)
    * [User, Role, & Profile Setup](#3-user-role--profile-setup)
    * [Security & Sharing Model](#4-security--sharing-model)
3.  **[Phase 3: Data Modeling & Relationships (Coming Soon)](#phase-3-data-modeling--relationships-coming-soon)**

---

## Phase 1: Problem Understanding & Industry Analysis

[cite_start]This section details the analysis and planning performed during Phase 1 of the AgriTrust Connect project[cite: 80].

### Project Goal

[cite_start]The primary goal of AgriTrust Connect is to create a Salesforce-powered platform that digitizes the agricultural value chain for smallholder farmers[cite: 84]. [cite_start]The platform aims to **boost farmer profitability** [cite: 85][cite_start], **ensure supply chain transparency** [cite: 86][cite_start], and **promote sustainable farming practices** [cite: 87] [cite_start]by connecting farmers, agronomists, and corporate buyers[cite: 88].

### 1. Requirement Gathering

[cite_start]Analysis began with engaging key stakeholders to understand their needs[cite: 89].

* **Stakeholders Engaged:**
    * [cite_start]Smallholder farmers [cite: 91]
    * [cite_start]Farmer cooperatives [cite: 92]
    * [cite_start]Field agronomists [cite: 93]
    * [cite_start]Agricultural lenders [cite: 94]
    * [cite_start]Corporate procurement managers [cite: 95]
    * [cite_start]Government agricultural extension officers [cite: 96]
* **Key Requirements:**
    * [cite_start]Real-time management of farm entities (boundaries, plots) [cite: 98]
    * [cite_start]Simple daily activity logging for farmers (sowing, irrigation) [cite: 99]
    * [cite_start]Automated alerts for weather, pests, and harvest times [cite: 100]
    * [cite_start]Traceability of produce from farm to buyer [cite: 105]
    * [cite_start]Dashboards for regional yield forecasting and resource usage [cite: 102]
    * [cite_start]Task management capabilities for agronomists [cite: 104]

### 2. Stakeholder Analysis

[cite_start]The following key user roles were identified for the platform[cite: 106]:

* [cite_start]**Farmer:** The primary user, responsible for logging farm activities and viewing advisories on a mobile device[cite: 108].
* [cite_start]**Agronomist (Field Expert):** Onboards farmers, conducts tests, and issues expert advisories[cite: 107].
* [cite_start]**Corporate Buyer:** Uses the platform to view produce availability, sustainability scores, and traceability data before making a purchase[cite: 110].
* [cite_start]**Regional Manager:** Monitors analytics dashboards to inform strategic planning[cite: 109].
* [cite_start]**Platform Administrator:** Manages system rules, user access, and data integrity[cite: 107].
* [cite_start]**Data Analyst:** Analyzes farm-level data for yield forecasting and risk modeling[cite: 111].

### 3. Business Process Mapping

[cite_start]Two core business processes were mapped out[cite: 112]:

* **Farmer's Crop Cycle Journey:**
    1.  [cite_start]An agronomist creates `Farm` and `Plot` records[cite: 114].
    2.  [cite_start]A farmer logs a sowing activity, which creates a `Crop Cycle` record[cite: 115].
    3.  [cite_start]The farmer receives automated alerts (e.g., hailstorm warning) and logs daily activities like irrigation[cite: 117, 118].
    4.  [cite_start]The agronomist issues a pest control advisory[cite: 119].
    5.  [cite_start]The farmer records harvest details, updating the produce inventory available to buyers[cite: 120, 121].
* **Procurement & Traceability Flow:**
    1.  [cite_start]A corporate buyer places an order for a specific quantity and grade of produce[cite: 123].
    2.  [cite_start]The system maps the order to available harvest logs[cite: 124].
    3.  [cite_start]A `Traceability Ledger` is created, linking the buyer's order back to the specific harvest logs, plots, and farms[cite: 125].

### 4. Technology & Risks

* [cite_start]**Technology Stack:** The platform will be built on **Salesforce** [cite: 153][cite_start], utilizing **Service Cloud** for farmer support [cite: 156][cite_start], **Experience Cloud** for farmer and buyer portals [cite: 157][cite_start], and **Tableau CRM** for analytics[cite: 158]. [cite_start]The design is mobile-first with offline capabilities[cite: 160].
* **Key Risks & Mitigations:**
    * [cite_start]**Low Farmer Adoption:** Mitigated by creating a simple, mobile-first UX with vernacular language and voice support[cite: 162].
    * [cite_start]**Poor Connectivity:** Addressed with an offline-first data synchronization strategy[cite: 163].
    * [cite_start]**Conflicting Data:** Managed through validation rules and requiring agronomist approval for key entries[cite: 164].

### 5. Success Metrics & Future Vision

* **Success Metrics:**
    * [cite_start]Percentage of farmer adoption per season [cite: 166]
    * [cite_start]Percentage of yield improvement [cite: 167]
    * [cite_start]Reduction in procurement cycle time [cite: 168]
* **Future Vision:**
    * [cite_start]Implement AI for yield forecasting[cite: 172].
    * [cite_start]Use blockchain for tamper-proof traceability[cite: 173].
    * [cite_start]Provide market pricing insights directly to farmers[cite: 174].

---

## Phase 2: Org Setup & Configuration

[cite_start]This section summarizes all setup and configuration tasks completed during Phase 2 to establish the system's technical foundation[cite: 8].

### 1. Developer Org & DevOps Setup

[cite_start]The initial environment for development and version control was established[cite: 10].

* [cite_start]A **Salesforce Developer Edition Org** was created[cite: 11].
* [cite_start]Development tools, including **VS Code** with Salesforce extensions and the **Salesforce CLI (SFDX)**, were installed and configured[cite: 12, 13, 14].
* [cite_start]A **GitHub repository** was created and connected to the project for version control[cite: 15].
* [cite_start]An initial DevOps workflow using SFDX commands was established[cite: 16].

### 2. Company Profile & Global Settings

[cite_start]Core organizational settings were configured to reflect the project's context[cite: 17].

* **Company Name:** AgriTrust Connect Pvt. [cite_start]Ltd [cite: 18]
* [cite_start]**Locale:** English (India) [cite: 20]
* [cite_start]**Time Zone:** IST (GMT+05:30) [cite: 21]
* [cite_start]**Currency:** INR [cite: 22]
* [cite_start]**Business Hours:** Monday - Saturday, 9:00 AM to 6:00 PM[cite: 24].
* [cite_start]**Holidays:** Configured for Diwali, Pongal, Independence Day, and Republic Day[cite: 25].
* [cite_start]**Fiscal Year:** Set to a standard fiscal year starting in April[cite: 27].

### 3. User, Role, & Profile Setup

[cite_start]Users, roles, and profiles were created to manage access for different stakeholders[cite: 33].

* **User Types Created:**
    * [cite_start]Admin User [cite: 29]
    * [cite_start]Farmer User [cite: 30]
    * [cite_start]Extension Officer User [cite: 31]
    * [cite_start]Buyer User [cite: 31]
    * [cite_start]Supplier User [cite: 32]
* **Role Hierarchy Established:**
    * [cite_start]System Administrator [cite: 35]
    * [cite_start]Farmer [cite: 36]
    * [cite_start]Extension Officer [cite: 37]
    * [cite_start]Buyer [cite: 38]
    * [cite_start]Supplier [cite: 39]
    * [cite_start]Government Officer [cite: 40]
* **Custom Profiles Defined:**
    * [cite_start]Admin Profile (Full Access) [cite: 42]
    * [cite_start]Farmer Profile (Restricted Access) [cite: 43]
    * [cite_start]Extension Officer Profile (Farmer data access) [cite: 44]
    * [cite_start]Buyer Profile (Procurement data) [cite: 45]
    * [cite_start]Supplier Profile (Input/product data) [cite: 46]

### 4. Security & Sharing Model

A foundational security model was implemented to protect data.

* [cite_start]**Permission Sets:** Created for "Weather Data Access" and "Financial Data Access" to grant additional permissions[cite: 47, 48, 49].
* **Org-Wide Defaults (OWD):**
    * [cite_start]Farmer records set to **Private**[cite: 52].
    * [cite_start]Crop/advisory data set to **Controlled by Parent**[cite: 53].
    * [cite_start]Buyer/Supplier data set to **Read Only**[cite: 54].
* **Sharing Rules:**
    * [cite_start]A rule was created to allow Extension Officers to view the data of farmers assigned to them[cite: 56].
* [cite_start]**Field-Level Security (FLS):** Applied to restrict access to sensitive financial fields[cite: 61].

---

## Phase 3: Data Modeling & Relationships (Coming Soon)

[cite_start]With the foundational org setup complete, the project is ready to proceed to the next phase[cite: 73]. This section will be updated with details on custom objects, fields, and relationships. [cite_start]Upcoming activities include[cite: 74]:
* [cite_start]Creating custom objects like `Farmers`, `Farms`, and `Crop Cycles`[cite: 75].
* [cite_start]Defining object relationships using the Schema Builder[cite: 76].
* [cite_start]Setting up Record Types and Page Layouts[cite: 77].
