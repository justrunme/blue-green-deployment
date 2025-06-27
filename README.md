# Blue-Green Deployment with Terraform and Kubernetes

[![Terraform E2E Test](https://github.com/justrunme/blue-green-deployment/workflows/Terraform%20E2E%20Test/badge.svg)](https://github.com/justrunme/blue-green-deployment/actions?query=workflow%3A%22Terraform+E2E+Test%22)

This project demonstrates a robust blue-green deployment strategy for applications on Kubernetes, managed entirely with Terraform. It provides a clear and automated way to deploy new versions of your application with minimal downtime and a straightforward rollback mechanism.

## Features

-   **Blue-Green Deployment:** Seamlessly switch traffic between two identical environments (blue and green) to achieve zero-downtime deployments.
-   **Terraform-Managed Infrastructure:** All Kubernetes resources, including namespaces, deployments, and services, are defined and managed using HashiCorp Terraform.
-   **Automated Testing with GitHub Actions:** A comprehensive GitHub Actions workflow is included to perform end-to-end tests. This involves:
    -   Spinning up a temporary Kubernetes cluster using KinD (Kubernetes in Docker).
    -   Applying the Terraform configuration to the KinD cluster.
    -   Validating the successful deployment and readiness of both blue and green application versions.
    -   Verifying the Kubernetes service.

## Project Structure

```
.terraform/
.terraform.lock.hcl
.gitignore
main.tf
outputs.tf
variables.tf
versions.tf
k8s/
├── deployment_blue.tf
├── deployment_green.tf
├── namespace.tf
├── service.tf
└── variables.tf
.github/workflows/
└── test.yml
```

-   `main.tf`: The main Terraform configuration file, orchestrating the Kubernetes module.
-   `variables.tf`: Defines input variables for the root module.
-   `outputs.tf`: Defines output values from the root module.
-   `versions.tf`: Specifies Terraform and provider version requirements.
-   `k8s/`: A module containing all Kubernetes resource definitions.
    -   `k8s/namespace.tf`: Defines the Kubernetes namespace.
    -   `k8s/deployment_blue.tf`: Defines the blue application deployment.
    -   `k8s/deployment_green.tf`: Defines the green application deployment.
    -   `k8s/service.tf`: Defines the Kubernetes service that routes traffic to either blue or green.
    -   `k8s/variables.tf`: Defines input variables for the `k8s` module.
-   `.github/workflows/test.yml`: The GitHub Actions workflow for continuous integration and end-to-end testing.

## Getting Started

### Prerequisites

-   [Terraform](https://www.terraform.io/downloads.html) (>= 1.3.0)
-   [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
-   [Docker](https://docs.docker.com/get-docker/) (for KinD-based testing)

### Local Deployment

1.  **Initialize Terraform:**
    ```bash
    terraform init
    ```

2.  **Review the Plan:**
    ```bash
    terraform plan
    ```

3.  **Apply the Configuration:**
    ```bash
    terraform apply
    ```

### Blue-Green Switch

To switch traffic from the current active version (e.g., green) to the other (e.g., blue), you would typically modify the `color` label in `k8s/service.tf` and re-apply the Terraform configuration.

For example, to switch to blue:

```hcl
# k8s/service.tf
spec {
  selector = {
    app   = "app"
    color = "blue" # Change this to switch traffic
  }
  # ...
}
```

After modifying, run:

```bash
terraform apply
```

## Contributing

Feel free to fork this repository and contribute. Please ensure your changes pass the GitHub Actions tests.

## License

This project is open-sourced under the MIT License. See the [LICENSE](LICENSE) file for details.
