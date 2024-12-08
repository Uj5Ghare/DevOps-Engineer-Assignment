# DevOps-Engineer-Assignment

This project consists of two parts: a ReactJS frontend and a NodeJS backend.

## 👨‍💻Frontend (ReactJS) <br>
This ReactJS application provides the user interface for the application.

#### Getting Started

Clone the repository:

```
git clone https://github.com/Uj5Ghare/DevOps-Engineer-Assignment.git
```

Navigate to the frontend directory:
```
cd frontend
```

Install dependencies:
```
npm install
```

Run the application:

```
npm start
```

This will start the development server and open the application in your browser at http://localhost:3000/.   

**Build for Production To create an optimized build for production deployment.** 
<br>
**run:**
```
npm run build
```

This will create a production-ready build in the build directory.
<br>
<br>
## ⌨️Backend (NodeJS)
This NodeJS application provides the backend logic and API endpoints for the application.

#### Getting Started
Clone the repository (if not already done):
```
git clone https://github.com/Uj5Ghare/DevOps-Engineer-Assignment.git
```

Navigate to the backend directory:
```
cd backend
```

Install dependencies:
```
npm install
```

Start the development server:
```
npm start
```

This will start the backend server and listen for API requests on http://localhost:8000/
<br>
#### New API Endpoint: `/status`
The backend provides a new API endpoint at `/status` that provides information about the application's current state and uptime.

#### Testing
The backend has integrated simple test case. 
<br>
To run the tests:
```
npm test
```
<br>
<br>
<br>

## 🐙GitHub Workflow
This workflow automates building, testing, deploying, and securing of ReactJS frontend and NodeJS backend applications.

### Workflow Triggers
Pushes to branches main and dev that modify files in:
- `.github/workflows/main.yml` (the workflow itself)
- `frontend/` directory
- `backend/` directory
- `k8s/manifests/**/*` directory
- Pull requests to the main branch

### Workflow Jobs
**Build-And-Test (runs on pull requests):** <br>
- Tests the backend code (requires `backend/` directory) <br>

**Push-To-DockerHub-Frontend (frontend changes):**
<br>
- Builds and pushes a Docker image for the frontend application <br>

**Image-Vuln-Check-Frontend (frontend changes):**
<br>
- Scans the built frontend Docker image for vulnerabilities <br>

**Update-ImgTag-Frontend (frontend changes):**
<br>
- Updates the image tag in the Kubernetes deployment manifest based on the workflow run number <br>

**Deploy-On-Minikube-Frontend (frontend changes):**
<br>
- Deploys the updated frontend image to a local Minikube cluster (for testing) <br>

**Slack-Notification-Frontend (frontend changes):**
<br>
- Sends a notification to a Slack channel about the deployment result <br>
- Similar jobs exist for backend changes (replace "frontend" with "backend")

### Requirements
- Docker and Docker Hub access (secrets: `DOCKER_TOKEN`, `DOCKER_USER`)
- GitHub personal access token (secrets: `GITHUB_TOKEN`) - optional
- Slack communication (secrets: `SLACK_BOT_TOKEN`, `SLACK_CHANNEL_ID`)

### Security
The workflow scans frontend Docker images for vulnerabilities using Trivy.
