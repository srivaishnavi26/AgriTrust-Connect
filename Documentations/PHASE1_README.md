# Phase 1: Problem Understanding & Industry Analysis

This document details the analysis and planning performed during Phase 1 of the AgriTrust Connect project.

---
## Project Goal

The primary goal of AgriTrust Connect is to create a Salesforce-powered platform that digitizes the agricultural value chain for smallholder farmers. The platform aims to **boost farmer profitability**, **ensure supply chain transparency**, and **promote sustainable farming practices** by connecting farmers, agronomists, and corporate buyers.

---
## 1. Requirement Gathering

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

---
## 2. Stakeholder Analysis

The following key user roles were identified for the platform:

* **Farmer:** The primary user, responsible for logging farm activities and viewing advisories on a mobile device.
* **Agronomist (Field Expert):** Onboards farmers, conducts tests, and issues expert advisories.
* **Corporate Buyer:** Uses the platform to view produce availability, sustainability scores, and traceability data before making a purchase.
* **Regional Manager:** Monitors analytics dashboards to inform strategic planning.
* **Platform Administrator:** Manages system rules, user access, and data integrity.
* **Data Analyst:** Analyzes farm-level data for yield forecasting and risk modeling.

---
## 3. Business Process Mapping

Two core business processes were mapped out:

* **Farmer's Crop Cycle Journey:**
    1.  An agronomist creates `Farm` and `Plot` records.
    2.  A farmer logs a sowing activity, which creates a `Crop Cycle` record.
    3.  The farmer receives automated alerts (e.g., hailstorm warning) and logs daily activities like irrigation.
    4.  The agronomist issues a pest control advisory.
    5.  The farmer records harvest details, updating the produce inventory available to buyers.
* **Procurement & Traceability Flow:**
    1.  A corporate buyer places an order for a specific quantity and grade of produce.
    2.  The system maps the order to available harvest logs.
    3.  A `Traceability Ledger` is created, linking the buyer's order back to the specific harvest logs, plots, and farms.

---
## 4. Technology & Risks

* **Technology Stack:** The platform will be built on **Salesforce**, utilizing **Service Cloud** for farmer support, **Experience Cloud** for farmer and buyer portals, and **Tableau CRM** for analytics. The design is mobile-first with offline capabilities.
* **Key Risks & Mitigations:**
    * **Low Farmer Adoption:** Mitigated by creating a simple, mobile-first UX with vernacular language and voice support.
    * **Poor Connectivity:** Addressed with an offline-first data synchronization strategy.
    * **Conflicting Data:** Managed through validation rules and requiring agronomist approval for key entries.

---
## 5. Success Metrics & Future Vision

* **Success Metrics:**
    * Percentage of farmer adoption per season
    * Percentage of yield improvement
    * Reduction in procurement cycle time
* **Future Vision:**
    * Implement AI for yield forecasting.
    * Use blockchain for tamper-proof traceability.
    * Provide market pricing insights directly to farmers.
