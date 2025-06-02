# Naestack AI – Azure-Based Aria Automation Clone

## Project Overview
This project was designed to showcase my skills as a Solution Architect. It demonstrates my ability to design, plan, and execute a multi-phase, cloud-native automation platform entirely within Microsoft Azure. Naestack AI reflects my familiarity with modern cloud technologies, my understanding of infrastructure-as-code, and my ability to incorporate advanced services like Azure OpenAI into practical, enterprise-aligned solutions. It is both a technical challenge and a professional showcase that highlights my capability to architect scalable, intelligent proof-of-concept systems for enterprise use cases.

Naestack AI is an Azure-native automation platform inspired by VMware's Aria Automation. Its purpose is to enable teams to easily provision and manage cloud infrastructure using a self-service web interface, with intelligent guidance from OpenAI. The tool simplifies the complexity of cloud deployments by offering predefined templates, real-time dashboards, and AI-driven assistance.

The platform is designed to help cloud architects, engineers, and project managers automate proof-of-concept (POC) deployments, track progress, and reduce overhead communication between technical and leadership teams. By offering a centralized dashboard, project lifecycle automation, and AI support, Naestack AI bridges the gap between ideation and execution in cloud infrastructure planning.

---

## Key Features

- **Self-Service Web Portal:** Choose and configure Azure resources in a shopping-cart style interface.
- **Predefined Project Templates:** Common infrastructure stacks like Dev/Test, Web App, or Data Science can be selected and automatically provisioned.
- **Automated Infrastructure Deployment:** Using ARM/Bicep templates and backend automation logic.
- **OpenAI Integration:** Smart assistant for recommendations, error explanations, template generation, documentation, and summarization.
- **Dashboard:** Real-time team and project tracking viewable by leadership.
- **Feedback Analysis:** Collect and analyze team feedback using AI to improve the system.

---

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

---

## OpenAI Integration Use Cases

1. **Resource Recommendation Assistant:** Suggests infrastructure based on user intent.
2. **Template Generator:** Converts user inputs into Bicep templates.
3. **Error Analyzer:** Explains failed deployments and suggests fixes.
4. **Progress Summarizer:** Converts POC deployment data into readable summaries.
5. **Feedback Analyzer:** Summarizes sentiment and key issues from user input.
6. **Documentation Generator:** Creates deployment summaries for stakeholders.

---

## Timeline & Phases

### ✪ Phase 1: Environment Bootstrapping

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

- **OpenAI Integration:** None

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

**Objective:** Provide visual insight into POC and project status across teams.

- **Tasks:**
  - Build dashboard UI (React + charting lib or Power BI Embedded)
  - Load project/user data from DB
  - Generate status summaries using GPT

- **OpenAI Integration:** GPT-generated POC summaries

- **Test:**
  - Display user/project metrics
  - Generate readable AI summary

---

### ✪ Phase 6: Feedback + Continuous Improvement

**Objective:** Gather and analyze user feedback using AI.

- **Tasks:**
  - Add feedback submission per project
  - Use GPT to analyze sentiment and extract themes
  - Admin interface to review AI findings

- **OpenAI Integration:** Sentiment & suggestion analysis

- **Test:**
  - Enter 3 pieces of feedback
  - GPT identifies top issues/themes

---

## Optional Enhancements

- Slack or Teams integration with Logic Apps
- Embedded documentation generation for project hand-offs
- Usage analytics + metering for chargeback tracking

---

## Deployment

This project will use GitHub Actions (or Azure DevOps) to deploy all components:

- Bicep templates provision Azure infrastructure
- GitHub Actions automates frontend/backend build and publish
- `.logs/` folder stores all deployment and AI interaction logs for auditing

---

## Testing

Each phase concludes with a clearly defined test to validate progress. These include resource deployments, DB interactions, AI prompt validation, and UI/UX output confirmations. Unit and integration tests will be added in future phases as components become stable.

---

## License & Contribution

This project is intended for internal prototype and educational use. Future public release may include contribution guidelines and open-source licensing.

---
