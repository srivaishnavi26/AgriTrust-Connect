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
   * [Relationships Defined](#2-relationships-defined) 
   * [Page Layouts & Record Types](#3-page-layouts--record-types) 
   * [Compact Layouts](#4-compact-layouts)   
   * [Schema Builder Visualization](#5-schema-builder-visualization)
4. **[Phase 4: Process Automation (Admin)](#phase-4-process-automation-admin)**   
    *This phase focuses on automating business processes in AgriTrust Connect using **Validation Rules, Workflow Rules, Process Builder, Approval Processes, and Flows**. Automation reduces manual effort, ensures data accuracy, and provides timely notifications to stakeholders.*
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

## Phase 4: Process Automation (Admin)

This phase focuses on automating business processes in AgriTrust Connect using **Validation Rules, Workflow Rules, Process Builder, Approval Processes, and Flows**. Automation reduces manual effort, ensures data accuracy, and provides timely notifications to stakeholders.

### 1. Validation Rules

Validation rules enforce data integrity and prevent incorrect entries. Examples implemented include:

| # | Rule Name | Object | Formula | Error Message |
|---|-----------|--------|---------|---------------|
| 1 | Crop Cycle Dates | Crop_Cycle__c | `End_Date__c < Start_Date__c` | End date cannot be before start date. |
| 2 | Soil Moisture Range | Crop_Cycle__c | `Moisture__c < 0 || Moisture__c > 100` | Moisture must be between 0 and 100. |
| 3 | Soil pH Range | Crop_Cycle__c | `pH__c < 0 || pH__c > 14` | pH value must be between 0 and 14. |
| 4 | Mandatory Crop Type | Crop_Cycle__c | `ISBLANK(Crop_Type__c)` | Crop type is required. |
| 5 | Buyer Order Quantity | Procurement__c | `Order_Qty__c <= 0` | Order quantity must be greater than zero. |
| 6 | Buyer Order Price Check | Procurement__c | `Price__c <= 0` | Price must be greater than zero. |
| 7 | Farmer Phone Number | Contact / Farmer__c | `NOT(REGEX(Phone__c, "^[0-9]{10}$"))` | Enter a valid 10-digit phone number. |

> **Note:** Validation rules were implemented incrementally, starting with key fields and gradually covering all critical data points.

---

### 2. Workflow Rule

**Purpose:** Notify farmers automatically when a new advisory is created.

* **Object:** Advisory__c  
* **Rule Name:** Notify_Farmer_On_Advisory  
* **Evaluation Criteria:** Created  
* **Action:** Email Alert  
  * **Recipient:** Related_Farmer__c  
  * **Email Template Example:**

```

Hello {!\$Record.Related\_Farmer\_\_c.Name},

A new advisory has been created for your crop submission.

Advisory Name: {!\$Record.Name}
Date: {!\$Record.Advisory\_Date\_\_c}
Message: {!\$Record.Advisory\_Text\_\_c}

Please review and follow the instructions.

Thanks,
AgriTrust Connect

```

---

### 3. Process Builder

**Purpose:** Automatically create follow-up tasks whenever a harvest date is logged.

* **Object:** Crop_Cycle__c  
* **Criteria:** Harvest_Date__c is changed AND is not null  
* **Action:** Create Task  
  * Subject: `"Harvest Logged – Follow Up"`  
  * Assigned To: Owner / Agronomist  
  * Due Date: Harvest_Date__c  
  * Related To: Crop_Cycle__c record  

---

### 4. Approval Process

**Purpose:** Ensure procurement requests are reviewed by an Agronomist before approval.

* **Object:** Procurement__c  
* **Approval Process Name:** Buyer_Request_Approval  
* **Entry Criteria:** Status__c = "Submitted"  
* **Steps:**  
  1. Submission routed to Agronomist for approval  
  2. Approved → Update record and notify buyer  
  3. Rejected → Update record and notify buyer  

---

### 5. Flow Automations

#### Flow 1 – Procurement → Traceability Ledger

* **Trigger:** Record-created on Procurement__c  
* **Action:** Create Traceability_Ledger__c record  
* **Field Mapping:**  
  * Related Procurement = {!$Record.Id}  
  * Stage = "Created"  
  * Movement Date = {!$Flow.CurrentDateTime}  

#### Flow 2 – Crop_Cycle → Advisory

* **Trigger:** Record-created on Crop_Cycle__c  
* **Decision:** Crop type = Paddy (extendable for other crops)  
* **Action:** Create Advisory__c record  
* **Field Mapping:**  
  * Advisory Name = `"Advisory for " & {!$Record.Name}`  
  * Advisory Date = {!$Flow.CurrentDate}  
  * Advisory Text = `"Please follow best practices for " & {!$Record.Crop_Name__c}`  
  * Related Farmer = {!$Record.Related_Farm__c}  
  * Owner / Office User = Assign to Agronomist  

---

### 6. Phase 4 Outcome

* Validation rules ensure **data integrity**  
* Farmers receive **automated notifications** via Workflow Rule  
* Harvest follow-up **tasks are auto-created** via Process Builder  
* Procurement approvals are **managed systematically** via Approval Process  
* Traceability Ledger and advisories are **automatically generated** via Flows  

**Phase 4 is complete** and ready for integration with subsequent phases of the project.
```
