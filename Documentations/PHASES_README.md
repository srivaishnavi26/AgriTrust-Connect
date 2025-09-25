# AgriTrust Connect - Salesforce Project Documentation

This document provides the full lifecycle of the **AgriTrust Connect** Salesforce project, aligned with standard Salesforce implementation phases (Admin + Developer).

---

## Table of Contents

1.  **[Phase 1: Problem Understanding & Industry Analysis](#phase-1-problem-understanding--industry-analysis)**
2.  **[Phase 2: Org Setup & Configuration](#phase-2-org-setup--configuration)**
3.  **[Phase 3: Data Modeling & Relationships](#phase-3-data-modeling--relationships)**
4.  **[Phase 4: Process Automation (Admin)](#phase-4-process-automation-admin)**
5.  **[Phase 5: Apex Programming (Developer)](#phase-5-apex-programming-developer)**
6.  **[Phase 6: User Interface Development](#phase-6-user-interface-development)**
7.  **[Phase 7: Integration & External Access](#phase-7-integration--external-access)**
8.  **[Phase 8: Data Management & Deployment](#phase-8-data-management--deployment)**
9.  **[Phase 9: Reporting, Dashboards & Security Review](#phase-9-reporting-dashboards--security-review)**
10. **[Phase 10: Final Presentation & Demo Day](#phase-10-final-presentation--demo-day)**

---

## Phase 1: Problem Understanding & Industry Analysis

### Requirement Gathering
-   Real-time management of farms and plots
-   Simple daily activity logging for farmers
-   Automated alerts (weather, pests, harvest)
-   Produce traceability from farm to buyer
-   Dashboards for yield forecasting and resource usage
-   Task management for agronomists

### Stakeholder Analysis
-   **Farmer** – Logs activities, receives advisories
-   **Agronomist** – Onboards farmers, issues advisories
-   **Corporate Buyer** – Views availability, sustainability, traceability
-   **Regional Manager** – Monitors dashboards
-   **Admin** – Manages access and data integrity
-   **Data Analyst** – Runs forecasts and risk models

### Business Process Mapping
-   **Farmer’s Crop Cycle Journey**: From sowing → advisories → harvesting → produce inventory
-   **Procurement & Traceability Flow**: Buyer orders → harvest logs → traceability ledger

### Technology & Risks
-   **Tech Stack**: Salesforce Service Cloud, Experience Cloud, Tableau CRM
-   **Risks & Mitigations**:
    -   Low farmer adoption → Mobile-first, vernacular UX
    -   Poor connectivity → Offline-first sync
    -   Conflicting data → Validation + agronomist approval

### Success Metrics & Future Vision
-   **Metrics**: Adoption %, Yield improvement, Procurement cycle time reduction
-   **Future Vision**: AI forecasting, Blockchain traceability, Market insights

### Phase 1 Outcome
*Clear understanding of needs, processes, and risks → solid foundation for Salesforce implementation.*

---

## Phase 2: Org Setup & Configuration

### Developer Org & DevOps Setup
-   Salesforce Dev Org created
-   VS Code + Salesforce CLI configured
-   GitHub repository set up for version control
-   DevOps workflow established

### Company Profile & Global Settings
-   **Company Name**: AgriTrust Connect Pvt. Ltd
-   **Locale**: English (India), Time Zone: IST
-   **Currency**: INR
-   **Business Hours**: Mon–Sat, 9AM–6PM
-   **Holidays**: Diwali, Pongal, Independence Day, Republic Day
-   **Fiscal Year**: Starts April

### User, Role, & Profile Setup
-   **Users**: Admin, Farmer, Extension Officer, Buyer, Supplier
-   **Roles**: System Admin → Farmer / Officer / Buyer / Supplier / Govt Officer
-   **Profiles**: Admin (Full), Farmer, Officer, Buyer, Supplier

### Security & Sharing Model
-   **Permission Sets**: Weather Data, Financial Data
-   **Org-Wide Defaults (OWD)**: Farmer = Private, Crop = Controlled by Parent, Buyer/Supplier = Read Only
-   **Sharing Rules**: Officers see assigned farmer data
-   **Field-Level Security (FLS)**: Sensitive financial fields restricted

### Phase 2 Outcome
*Org foundation established with company settings, users, roles, and security model.*

---

## Phase 3: Data Modeling & Relationships

### Object Model Design
-   **Farmer (Contact)** – ID, Village, Phone, Landholding Size
-   **Farm (Custom)** – Name, Location, Size → Lookup(Farmer)
-   **Crop Cycle (Custom)** – Crop, Season, Dates → Master-Detail(Farm)
-   **Soil Record (Custom)** – Nutrient data, pH → Master-Detail(Crop Cycle)
-   **Advisory (Custom)** – Type, Message, Date → Lookup(Crop Cycle)
-   **Procurement (Custom)** – Qty, Price, Date → Lookup(Crop Cycle + Buyer)
-   **Traceability Ledger (Custom)** – Links produce movement → Lookup(Procurement, Farm, Crop Cycle)

### Relationships Defined
-   Farmer → Farm: Lookup (1:N)
-   Farm → Crop Cycle: Master-Detail (1:N)
-   Crop Cycle → Soil Record: Master-Detail (1:N)
-   Crop Cycle → Advisory: Lookup (N:1)
-   Crop Cycle → Procurement: Lookup (N:1)
-   Procurement → Buyer: Lookup

### Page Layouts & Record Types
-   **Layouts**: Farmer (basic), Officer (detailed), Buyer (procurement)
-   **Record Types**: Procurement (Retail/Corporate), Advisory (Pest, Irrigation, Pricing)

### Compact Layouts
-   **Farmer**: Name, Village, Phone, Landholding Size
-   **Crop Cycle**: Name, Season, Sowing Date
-   **Procurement**: Qty, Date, Buyer

### Schema Builder Visualization
Objects and relationships mapped visually for validation.

### Phase 3 Outcome
*Scalable data model finalized with clear relationships and schema validation.*

---

## Phase 4: Process Automation (Admin)

### Validation Rules
Examples:
-   Crop End Date ≥ Start Date
-   Moisture between 0–100
-   pH between 0–14
-   Mandatory Crop Type
-   Order Qty & Price > 0
-   Farmer Phone must be 10 digits

### Workflow Rules
-   Notify farmers automatically when a new advisory is created

### Process Builder
-   Auto-create a follow-up task when a Harvest Date is logged

### Approval Processes
-   Procurement requests submitted → Agronomist approval before confirmation

### Flow Automations
-   **Procurement → Traceability Ledger**: Auto-create ledger when procurement is made
-   **Crop Cycle → Advisory**: Auto-generate advisory based on crop type

### Escalation Rules
-   Advisory pending >48h → Escalate to Extension Officer
-   Procurement submitted >72h → Escalate to Procurement Manager

### Scheduled / Time-Based Flows
-   Advisory reminders sent daily
-   Seasonal alerts (e.g., Kharif start)
-   Buyer reminders sent before delivery date

### Phase 4 Outcome
*Automated workflows, approvals, escalations, and notifications ensure efficiency and accuracy.*

---

## Phase 5: Apex Programming (Developer)

### Files Created
-   `FarmManagementHandler.cls` – Farm calculations/validations
-   `CropCycleTriggerHandler.cls` – Trigger logic for Crop Cycle
-   `ProcurementTriggerHandler.cls` – Trigger logic for Procurement
-   `CropCycleTrigger.trigger` – Validations before insert/update
-   `ProcurementTrigger.trigger` – Creates Traceability Ledger after insert
-   `WeatherService.cls` – Async weather data retrieval (Future method)
-   `ProcurementProcessor.cls` – Queueable Apex for processing
-   `CropCycleTriggerTest.cls` – Unit test class

### Apex Development Goals
-   Clean Apex classes encapsulating business logic
-   Trigger-Handler pattern for modularity
-   Efficient SOQL/SOSL
-   Collections (List, Set, Map)
-   Asynchronous Apex (Future, Queueable)
-   Robust exception handling
-   Test coverage >75%

### Phase 5 Outcome
*Developer-side foundation completed with Apex classes, triggers, async handling, and test coverage.*

---

## Phase 6: User Interface Development

### UI Development Goals
-   Build a rich, responsive, and interactive user interface (UI).
-   Create custom components to visualize complex data and streamline workflows.
-   Leverage the Apex backend from Phase 5 to display dynamic data.
-   Ensure a mobile-first experience for field users.

### Lightning App Builder Enhancements
-   **Custom Record Pages**: Configured Farm and Procurement pages with Tabs and Related List components to show contextual information without scrolling.
-   **Dynamic Home Page**: Built a dashboard-style Home Page with a Report Chart for "Crop Cycles by Season" and a List View for "Pending Procurements".
-   **Utility Bar**: Added productivity tools like Notes, Recent Items, and To Do List for persistent access.

### Lightning Web Components (LWC) Created
-   `procurementTracker`: Visual path component on the Procurement page to show its current status.
-   `farmDetailMap`: Displays a farm's geo-location on an interactive map on the Farm record page.
-   `relatedCropCycles`: Custom data table on the Farmer page showing a summary of all their crop cycles.
-   `advisorySearch`: Utility component for users to perform a keyword search across all advisories.
-   `weatherAlertPanel`: Home page component that calls the Weather Service to display recent alerts.

### Jest Test Classes
-   Unit tests were created for each LWC to validate JavaScript logic, rendering, and event handling, ensuring front-end code quality.

### Phase 6 Outcome
*A dynamic, responsive, and user-friendly interface was delivered through custom components and enhanced page layouts, fully integrated with the backend.*

---

## Phase 7: Integration & External Access

### Integration Goals
-   Connect AgriTrust Connect with external data sources for data enrichment.
-   Enable real-time data exchange with external systems (e.g., ERP, Supply Chain).
-   Expose Salesforce data securely via APIs for authorized external applications.

### Outbound Integrations (Salesforce → External)
-   **Named Credentials**: Setup for `WeatherAPI` and `MarketPriceAPI` to securely store endpoint URLs and authentication details, eliminating hardcoded values in code.
-   **Apex Callouts**: Enhanced `WeatherService.cls` to make REST callouts to the weather API. The service fetches rainfall and temperature forecasts to automatically create or update weather-related `Advisory__c` records.
-   **Platform Events**: Defined a `Procurement_Order_Event__e` platform event. This event is published via an Apex trigger on the `Procurement__c` object to notify external ERP and supply chain systems of new orders in real-time.

### Inbound Integrations (External → Salesforce)
-   **Apex REST Service**: Developed an Apex REST class (`ProcurementAPI`) to expose `Procurement__c` data. External systems can now retrieve specific procurement records via a secure GET request to a custom endpoint (e.g., `/services/apexrest/procurements/{recordId}`).

### Data Virtualization (Salesforce Connect)
-   **External Objects**: Configured Salesforce Connect with an OData adapter to create an External Object, `GovtSubsidy__x`. This allows users to view, search, and report on a government subsidy database directly within Salesforce without data replication.

### Security & Governance
-   **Remote Site Settings**: Configured to authorize callout endpoints for the Weather and Market Price APIs.
-   **Authentication**: Implemented the OAuth 2.0 protocol for secure server-to-server authentication with trusted external systems.
-   **API Limit Monitoring**: Established monitoring and alert mechanisms for daily API call limits to ensure system stability and prevent service disruptions.

### Phase 7 Outcome
*Successfully connected Salesforce with external systems for both inbound and outbound data flow, enabling real-time data enrichment and process synchronization.*

---

## Phase 8: Data Management & Deployment

### Data Migration & Management
-   **Data Import**: Utilized the **Data Import Wizard** for initial import of Farmer (Contact) records and the **Salesforce Data Loader** for bulk `Upsert` operations on Procurement data.
-   **Data Quality**: Implemented a **Duplicate Rule** on the Contact object, leveraging a custom **Matching Rule** to block the creation of new records with identical `Phone` numbers, ensuring data integrity.
-   **Data Backup**: Configured the **Data Export Service** to perform automated weekly backups of all organization data, establishing a disaster recovery plan.

### Deployment & Environment Strategy
-   **Sandbox Usage**: A **Developer Sandbox** was used as the primary environment for all development, configuration, and testing activities.
-   **Deployment Method**: The deployment pipeline was managed via **VS Code and the Salesforce CLI (SFDX)**. The `sf project deploy start` command was used to successfully deploy all custom metadata from the local source repository to the Salesforce org.

### Phase 8 Outcome
*Successfully established a complete data management lifecycle and a modern deployment process, making the application ready for user acceptance testing.*

---

## Phase 9: Reporting, Dashboards & Security Review
*(Placeholder for future work)*

---

## Phase 10: Final Presentation & Demo Day
*(Placeholder for future work)*

---