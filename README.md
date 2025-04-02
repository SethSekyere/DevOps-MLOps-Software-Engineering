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

pom.xml Configuration
The pom.xml is the fundamental file in Maven that contains project configurations and dependencies.

Key Elements in pom.xml
modelVersion: Specifies the version of the POM model (usually 4.0.0 for Maven 2 and 3).

groupId: Defines the project’s group/organization.

artifactId: The name of the project.

version: Version of the project.

packaging: Defines how the project should be packaged (e.g., jar, war).

Example pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.example</groupId>
    <artifactId>my-project</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>

