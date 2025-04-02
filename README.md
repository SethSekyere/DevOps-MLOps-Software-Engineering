# Jenkins with SonarQube, Nexus, and Maven Setup

## Prerequisites

To set up Jenkins with SonarQube, Nexus, and Maven, you will need the following Jenkins plugins for smooth integration and functionality:

### Plugins for Jenkins Integration

- **SonarQube Scanner Plugin**  
  - **Purpose:** Integrates SonarQube code quality analysis with Jenkins.
  - **Installation:** Go to Jenkins → Manage Jenkins → Manage Plugins → Available → Search for "SonarQube Scanner".
  - **Plugin Page:** [SonarQube Scanner Plugin](https://plugins.jenkins.io/sonar)

- **Nexus Artifact Uploader Plugin**  
  - **Purpose:** Allows uploading of build artifacts (e.g., JAR/WAR) to Nexus Repository from Jenkins.
  - **Installation:** Go to Jenkins → Manage Jenkins → Manage Plugins → Available → Search for "Nexus Artifact Uploader".
  - **Plugin Page:** [Nexus Artifact Uploader Plugin](https://plugins.jenkins.io/nexus-artifact-uploader)

- **Maven Integration Plugin**  
  - **Purpose:** Enables Jenkins to build Maven projects and handle the build lifecycle, including unit tests and packaging.
  - **Installation:** Go to Jenkins → Manage Jenkins → Manage Plugins → Available → Search for "Maven Integration".
  - **Plugin Page:** [Maven Integration Plugin](https://plugins.jenkins.io/maven-plugin)

- **Pipeline Utility Steps Plugin**  
  - **Purpose:** Provides additional steps for pipelines, such as reading a Maven POM file and handling artifacts.
  - **Installation:** Go to Jenkins → Manage Jenkins → Manage Plugins → Available → Search for "Pipeline Utility Steps".
  - **Plugin Page:** [Pipeline Utility Steps Plugin](https://plugins.jenkins.io/pipeline-utility-steps)

### Additional Recommended Plugins

- **Git Plugin**  
  - Integrates Git with Jenkins to fetch code from Git repositories.
  
- **Pipeline: Stage View Plugin**  
  - Provides a better UI for Jenkins pipeline stages.

- **Blue Ocean Plugin**  
  - A modern UI for Jenkins pipelines.

- **Email Extension Plugin**  
  - Sends customizable email notifications on build status.

### Steps to Install Plugins in Jenkins

1. Go to Jenkins Dashboard.
2. Navigate to **Manage Jenkins → Manage Plugins**.
3. Select the **Available Tab**.
4. Search for the desired plugin (e.g., SonarQube Scanner, Nexus Uploader).
5. Install and Restart Jenkins (if required).

### System Requirements

- **JDK 17 or later**
- **Maven 3**
- **MySQL 8**


