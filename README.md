# Naestack AI – Azure-Based Aria Automation Clone

## Project Overview

This project was designed to showcase my skills as a Solution Architect. It demonstrates my ability to design, plan, and execute a multi-phase, cloud-native automation platform entirely within Microsoft Azure. Naestack AI reflects my familiarity with modern cloud technologies, my understanding of infrastructure-as-code, and my ability to incorporate advanced services like Azure OpenAI into practical, enterprise-aligned solutions. It is both a technical challenge and a professional showcase that highlights my capability to architect scalable, intelligent proof-of-concept systems for enterprise use cases.

Naestack AI is an Azure-native automation platform inspired by VMware's Aria Automation. Its purpose is to enable teams to easily provision and manage cloud infrastructure using a self-service web interface, with intelligent guidance from OpenAI. The tool simplifies the complexity of cloud deployments by offering predefined templates, real-time dashboards, and AI-driven assistance.

The platform is designed to help cloud architects, engineers, and project managers automate proof-of-concept (POC) deployments, track progress, and reduce overhead communication between technical and leadership teams. By offering a centralized dashboard, project lifecycle automation, and AI support, Naestack AI bridges the gap between ideation and execution in cloud infrastructure planning.

## Software Design and Architecture Rationale

Naestack AI was architected with a modern Azure-first approach, leveraging managed services and scalable components that require minimal infrastructure maintenance.

### Why Azure Static Web Apps?
Azure Static Web Apps provide a secure and scalable platform for hosting the React-based frontend with integrated GitHub Actions for CI/CD. It also offers built-in authentication support and tight integration with APIs hosted in Azure Functions.

### Why Azure Functions?
Azure Functions enable serverless backend APIs that scale on-demand, reducing operational costs and simplifying backend development. This decision supports lightweight and modular business logic for provisioning, user workflows, and OpenAI API calls.

### Why Azure AD B2C?
Authentication is offloaded to Azure AD B2C to ensure scalable, secure identity management. This also enables future multi-tenant and enterprise integration options with minimal changes.

### Why Cosmos DB?
Cosmos DB was selected as the default database for its scalability and low-latency NoSQL support. It allows flexible schema design for storing user configurations, project state, and logs.

### Why Bicep / ARM Templates?
Infrastructure-as-Code using Bicep simplifies Azure resource deployment and management, enabling repeatability and version control for infrastructure changes. This promotes environment consistency and makes the platform portable.

### Why Azure OpenAI?
Azure OpenAI provides GPT-based services that empower Naestack AI to assist with natural language queries, error interpretation, documentation summarization, and more. It acts as an AI copilot throughout the platform.

### Why GitHub Actions?
GitHub Actions was chosen for CI/CD to streamline code deployment and template updates. It fits well within developer workflows and integrates natively with Azure and GitHub-hosted codebases.

### Why Power BI Embedded?
For leadership reporting, Power BI Embedded delivers rich, interactive dashboards with minimal effort. It elevates visibility into project status, cost tracking, and usage analytics.

## Key Features

- **Self-Service Web Portal:** Choose and configure Azure resources in a shopping-cart style interface.
- **Predefined Project Templates:** Common infrastructure stacks like Dev/Test, Web App, or Data Science can be selected and automatically provisioned.
- **Automated Infrastructure Deployment:** Using ARM/Bicep templates and backend automation logic.
- **OpenAI Integration:** Smart assistant for recommendations, error explanations, template generation, documentation, and summarization.
- **Dashboard:** Real-time team and project tracking viewable by leadership.
- **Feedback Analysis:** Collect and analyze team feedback using AI to improve the system.

## Tech Stack

- **Frontend:** Azure Static Web Apps (React)
- **Backend:** Azure Functions (Node.js or .NET), Azure API Management (optional)
- **Authentication:** Azure AD B2C
- **Database:** Azure Cosmos DB (NoSQL) or Azure SQL
- **Infrastructure as Code:** Bicep / ARM Templates
- **CI/CD:** GitHub Actions or Azure DevOps Pipelines
- **AI Services:** Azure OpenAI Service (GPT-4)
- **Monitoring:** Azure Monitor, Log Analytics
- **Visualization:** Power BI Embedded or React-based chart libraries

## OpenAI Integration Use Cases

1. **Resource Recommendation Assistant:** Suggests infrastructure based on user intent.
2. **Template Generator:** Converts user inputs into Bicep templates.
3. **Error Analyzer:** Explains failed deployments and suggests fixes.
4. **Progress Summarizer:** Converts POC deployment data into readable summaries.
5. **Feedback Analyzer:** Summarizes sentiment and key issues from user input.
6. **Documentation Generator:** Creates deployment summaries for stakeholders.

## Timeline & Phases

### ✪ Phase 1: Environment Bootstrapping

**Resources Provisioned:**

- App Service Plan
- Static Web App
- Azure Functions
- Cosmos DB
- Key Vault
- Resource Group

**Objective:** Deploy foundational Azure resources and CI/CD.

- **Tasks:**
  - Create Resource Group
  - Deploy:
    - App Service Plan
    - Static Web App (frontend)
    - Azure Functions (backend)
    - Cosmos DB or Azure SQL
    - Key Vault
  - Configure GitHub Actions or Azure DevOps pipeline

- **OpenAI Integration:** None

- **Test:**
  - Confirm successful deployment
  - Load frontend URL
  - DB write/read test

---

### ✪ Phase 2: UI + Resource Configuration Engine

**Objective:** Build the UI and backend for selecting Azure resources like a shopping cart.

- **Tasks:**
  - Azure AD login
  - UI form for resource selection
  - API to save user configuration to DB
  - Add support for selecting predefined project templates

- **Test:**
  - User selects resources and submits
  - Configuration is stored in DB

---

### ✪ Phase 3: Infrastructure Provisioning Engine

**Objective:** Translate user input into resource deployment using ARM/Bicep.

- **Tasks:**
  - Backend API to launch Bicep deployments
  - Status tracking in DB
  - Error handling logic

- **OpenAI Integration:** Optional early error analysis (experimental)

- **Test:**
  - User config triggers live Azure deployment
  - Status updates in real-time

---

### ✪ Phase 4: AI Copilot Integration

**Additional Resources Introduced:**

- Azure OpenAI Service

**Objective:** Enable intelligent interactions with Azure OpenAI.

- **Tasks:**
  - Deploy Azure OpenAI and GPT-4 endpoint
  - Build API route `/api/ask-openai`
  - Add Copilot UI in frontend:
    - Resource guidance
    - Template generation
    - POC progress summaries
    - Error explanation

- **OpenAI Integration:** Full

- **Test:**
  - Ask GPT: "What do I need for a scalable web app?"
  - Get usable answer that feeds UI or generates templates

---

### ✪ Phase 5: Team & POC Dashboard

**Objective:** Provide leadership and team members with real-time visibility into project status and resource usage.

- **Tasks:**
  - Build dashboard UI using React charting libraries or Power BI Embedded
  - Integrate with Azure Monitor and Log Analytics for real-time tracking
  - Implement Microsoft Teams integration via Logic Apps to send updates on deployment milestones
  - Enable usage analytics and cost metering for chargeback or showback models

- **Test:**
  - Dashboard displays accurate user/project metrics
  - Cost analytics appear for active POCs
  - Microsoft Teams receives deployment status update on resource creation
  - Generate readable AI summary

---

### ✪ Phase 6: Feedback + Continuous Improvement

**Objective:** Continuously improve the platform by gathering user insights and automating documentation.

- **Tasks:**
  - Add feedback submission form per project
  - Use GPT to analyze sentiment and extract themes from user input
  - Auto-generate deployment documentation summaries for each POC
  - Surface findings and documents in a centralized admin interface

- **Test:**
  - Submit 3 pieces of feedback, verify GPT-generated insights
  - Deployment documentation is created and stored for stakeholder review

---

## Deployment

This project will use GitHub Actions (or Azure DevOps) to deploy all components:

- Bicep templates provision Azure infrastructure
- GitHub Actions automates frontend/backend build and publish
- `.logs/` folder stores all deployment and AI interaction logs for auditing

## Testing

Each phase concludes with a clearly defined test to validate progress. These include resource deployments, DB interactions, AI prompt validation, and UI/UX output confirmations. Unit and integration tests will be added in future phases as components become stable.

## License & Contribution

This project is intended for internal prototype and educational use. Future public release may include contribution guidelines and open-source licensing.
