# AgriTrust Connect - Complete Project Documentation  

This document provides a complete overview of the AgriTrust Connect project, from its initial problem analysis in Phase 1, the detailed org setup in Phase 2 and data modelling & relationshios in Phase 3.  

---

## Table of Contents  
1. **[Phase 1: Problem Understanding & Industry Analysis](#phase-1-problem-understanding--industry-analysis)**  
   * [Project Goal](#project-goal)  
   * [Requirement Gathering](#1-requirement-gathering)  
   * [Stakeholder Analysis](#2-stakeholder-analysis)  
   * [Business Process Mapping](#3-business-process-mapping)  
   * [Technology & Risks](#4-technology--risks)  
   * [Success Metrics & Future Vision](#5-success-metrics--future-vision)  

2. **[Phase 2: Org Setup & Configuration](#phase-2-org-setup--configuration)**  
   * [Developer Org & DevOps Setup](#1-developer-org--devops-setup)  
   * [Company Profile & Global Settings](#2-company-profile--global-settings)  
   * [User, Role, & Profile Setup](#3-user-role--profile-setup)  
   * [Security & Sharing Model](#4-security--sharing-model)  

3. **[Phase 3: Data Modeling & Relationships (Coming Soon)](#phase-3-data-modeling--relationships)**  
   * [Object Model Design](#1-object-model-design)  
   * [Relationships Defined](#2-relationships-defined) – Lookup, Master-Detail, and cross-object links  
   * [Page Layouts & Record Types](#3-page-layouts--record-types) – Role-specific layouts and multiple processes  
   * [Compact Layouts](#4-compact-layouts) – Optimized views for mobile users  
   * [Schema Builder Visualization](#5-schema-builder-visualization) – Diagram of the full data model  

---

## Phase 1: Problem Understanding & Industry Analysis  

### Project Goal  
The primary goal of AgriTrust Connect is to create a Salesforce-powered platform that digitizes the agricultural value chain for smallholder farmers. The platform aims to **boost farmer profitability**, **ensure supply chain transparency**, and **promote sustainable farming practices** by connecting farmers, agronomists, and corporate buyers.  

### 1. Requirement Gathering  
Analysis began with engaging key stakeholders to understand their needs.  

* **Stakeholders Engaged:**  
  * Smallholder farmers  
  * Farmer cooperatives  
  * Field agronomists  
  * Agricultural lenders  
  * Corporate procurement managers  
  * Government agricultural extension officers  

* **Key Requirements:**  
  * Real-time management of farm entities (boundaries, plots)  
  * Simple daily activity logging for farmers (sowing, irrigation)  
  * Automated alerts for weather, pests, and harvest times  
  * Traceability of produce from farm to buyer  
  * Dashboards for regional yield forecasting and resource usage  
  * Task management capabilities for agronomists  

### 2. Stakeholder Analysis  
The following key user roles were identified for the platform:  

* **Farmer:** The primary user, responsible for logging farm activities and viewing advisories on a mobile device.  
* **Agronomist (Field Expert):** Onboards farmers, conducts tests, and issues expert advisories.  
* **Corporate Buyer:** Uses the platform to view produce availability, sustainability scores, and traceability data before making a purchase.  
* **Regional Manager:** Monitors analytics dashboards to inform strategic planning.  
* **Platform Administrator:** Manages system rules, user access, and data integrity.  
* **Data Analyst:** Analyzes farm-level data for yield forecasting and risk modeling.  

### 3. Business Process Mapping  
Two core business processes were mapped out:  

* **Farmer's Crop Cycle Journey:**  
  1. An agronomist creates `Farm` and `Plot` records.  
  2. A farmer logs a sowing activity, which creates a `Crop Cycle` record.  
  3. The farmer receives automated alerts (e.g., hailstorm warning) and logs daily activities like irrigation.  
  4. The agronomist issues a pest control advisory.  
  5. The farmer records harvest details, updating the produce inventory available to buyers.  

* **Procurement & Traceability Flow:**  
  1. A corporate buyer places an order for a specific quantity and grade of produce.  
  2. The system maps the order to available harvest logs.  
  3. A `Traceability Ledger` is created, linking the buyer's order back to the specific harvest logs, plots, and farms.  

### 4. Technology & Risks  

* **Technology Stack:**  
  The platform will be built on **Salesforce**, utilizing **Service Cloud** for farmer support, **Experience Cloud** for farmer and buyer portals, and **Tableau CRM** for analytics. The design is mobile-first with offline capabilities.  

* **Key Risks & Mitigations:**  
  * **Low Farmer Adoption:** Mitigated by creating a simple, mobile-first UX with vernacular language and voice support.  
  * **Poor Connectivity:** Addressed with an offline-first data synchronization strategy.  
  * **Conflicting Data:** Managed through validation rules and requiring agronomist approval for key entries.  

### 5. Success Metrics & Future Vision  

* **Success Metrics:**  
  * Percentage of farmer adoption per season  
  * Percentage of yield improvement  
  * Reduction in procurement cycle time  

* **Future Vision:**  
  * Implement AI for yield forecasting  
  * Use blockchain for tamper-proof traceability  
  * Provide market pricing insights directly to farmers  

---

## Phase 2: Org Setup & Configuration  

This section summarizes all setup and configuration tasks completed during Phase 2 to establish the system's technical foundation.  

### 1. Developer Org & DevOps Setup  
The initial environment for development and version control was established.  

* A **Salesforce Developer Edition Org** was created.  
* Development tools, including **VS Code** with Salesforce extensions and the **Salesforce CLI (SFDX)**, were installed and configured.  
* A **GitHub repository** was created and connected to the project for version control.  
* An initial DevOps workflow using SFDX commands was established.  

### 2. Company Profile & Global Settings  
Core organizational settings were configured to reflect the project's context.  

* **Company Name:** AgriTrust Connect Pvt. Ltd  
* **Locale:** English (India)  
* **Time Zone:** IST (GMT+05:30)  
* **Currency:** INR  
* **Business Hours:** Monday - Saturday, 9:00 AM to 6:00 PM  
* **Holidays:** Configured for Diwali, Pongal, Independence Day, and Republic Day  
* **Fiscal Year:** Set to a standard fiscal year starting in April  

### 3. User, Role, & Profile Setup  
Users, roles, and profiles were created to manage access for different stakeholders.  

* **User Types Created:**  
  * Admin User  
  * Farmer User  
  * Extension Officer User  
  * Buyer User  
  * Supplier User  

* **Role Hierarchy Established:**  
  * System Administrator  
  * Farmer  
  * Extension Officer  
  * Buyer  
  * Supplier  
  * Government Officer  

* **Custom Profiles Defined:**  
  * Admin Profile (Full Access)  
  * Farmer Profile (Restricted Access)  
  * Extension Officer Profile (Farmer data access)  
  * Buyer Profile (Procurement data)  
  * Supplier Profile (Input/product data)  

### 4. Security & Sharing Model  
A foundational security model was implemented to protect data.  

* **Permission Sets:** Created for "Weather Data Access" and "Financial Data Access" to grant additional permissions.  
* **Org-Wide Defaults (OWD):**  
  * Farmer records set to **Private**  
  * Crop/advisory data set to **Controlled by Parent**  
  * Buyer/Supplier data set to **Read Only**  
* **Sharing Rules:** A rule was created to allow Extension Officers to view the data of farmers assigned to them.  
* **Field-Level Security (FLS):** Applied to restrict access to sensitive financial fields.  

---
## Phase 3: Data Modeling & Relationships  

This phase focused on designing the data architecture of AgriTrust Connect. We created custom objects, fields, and relationships to represent the agricultural ecosystem, ensuring scalability and traceability across all farming activities.  

### 1. Object Model Design  

We identified the following **core objects**:  

* **Farmer (Contact - Standard):** Represents individual farmers.  
  * Custom Fields: Farmer ID (Auto Number), Village, Landholding Size (Number), Phone  

* **Farm (Custom):** Represents farmland owned/managed by a farmer.  
  * Fields: Farm Name, Location (Text/Geolocation), Size in Acres  
  * Relationship: Lookup to Farmer (Contact)  

* **Crop Cycle (Custom):** Captures details of each planting season.  
  * Fields: Crop Name (Picklist), Season (Picklist – Kharif/Rabi), Sowing Date, Harvest Date  
  * Relationship: Master-Detail to Farm  

* **Soil Record (Custom):** Stores soil health data for each cycle.  
  * Fields: Nutrient Level, pH Value, Test Date  
  * Relationship: Master-Detail to Crop Cycle  

* **Advisory (Custom):** Recommendations given to farmers.  
  * Fields: Advisory Type (Picklist), Message, Date Issued  
  * Relationship: Lookup to Crop Cycle  

* **Procurement (Custom):** Captures buyer orders.  
  * Fields: Order Quantity, Price, Order Date  
  * Relationships: Lookup to Crop Cycle, Lookup to Buyer (Account)  

* **Traceability Ledger (Custom - Optional/Future):** Tracks produce movement from farm to buyer.  
  * Relationship: Lookup to Procurement, Crop Cycle, and Farm  

---

### 2. Relationships Defined  

* **Farmer → Farm:** One farmer can own multiple farms (Lookup)  
* **Farm → Crop Cycle:** One farm can have multiple crop cycles (Master-Detail)  
* **Crop Cycle → Soil Record:** One cycle can have multiple soil records (Master-Detail)  
* **Crop Cycle → Advisory:** Multiple advisories linked to one cycle (Lookup)  
* **Crop Cycle → Procurement:** A crop cycle may generate multiple procurement orders (Lookup)  
* **Procurement → Buyer (Account):** Each order tied to a buyer (Lookup)  

---

### 3. Page Layouts & Record Types  

* **Page Layouts:**  
  * Farmer Layout: Simple fields for basic details  
  * Extension Officer Layout: Full farm, crop, and advisory details  
  * Buyer Layout: Procurement and traceability records  

* **Record Types:**  
  * Procurement: Retail vs Corporate orders  
  * Advisory: Pest Control, Irrigation, Market Pricing  

---

### 4. Compact Layouts  

Compact layouts were set up to improve mobile user experience:  

* **Farmer:** Farmer Name, Village, Phone, Landholding Size  
* **Crop Cycle:** Crop Name, Season, Sowing Date  
* **Procurement:** Order Quantity, Order Date, Buyer  

---

### 5. Schema Builder Visualization  

The object model and relationships were mapped in **Salesforce Schema Builder**.  
This provided a visual confirmation of the data model and will serve as a reference for future phases.   

---

**Phase 3 Completion Status: DONE**  
 Ready to proceed with **Phase 4: Process Automation**  
