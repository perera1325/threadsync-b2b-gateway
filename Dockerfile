# Stage 1: Build the CAR file
FROM maven:3.8.4-openjdk-11-slim AS build
COPY . /src
WORKDIR /src
RUN mvn clean install -Dmaven.test.skip=true

# Stage 2: Package into MI Runtime
FROM wso2/micro-integrator:4.2.0
COPY --from=build /src/ThreadSyncCompositeExporter/target/*.car /home/wso2carbon/wso2mi/repository/deployment/server/carbonapps/
