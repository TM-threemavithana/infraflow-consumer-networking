# InfraFlow Consumer Reference — Networking Infrastructure

Independent consumer repository validating the **InfraFlow Internal Developer Platform (IDP)** multi-repository adoption lifecycle.

- **Workload Type:** `networking`
- **Responsible Team:** `platform-networking`
- **Target Adapter:** `aws`
- **InfraFlow Platform Reference:** `TM-threemavithana/infraflow`
- **Pinned Platform SHA:** `8fd761bb42165435e1162f37ee39df15d5532b09`

## Architecture & Integration

This repository follows the InfraFlow Multi-Repository Adoption Architecture (Milestone G08).
All security scanning (Checkov, Trivy, OPA/Rego policy evaluation), input sanitization, and speculative planning are delegated entirely to the central InfraFlow reusable workflow (`reusable-tf-aws.yml`).

- **Zero Cloud Cost:** 100% cloud-free local validation and speculative planning using `terraform_data`.
- **Zero Cloud Credentials:** No cloud provider authentication or secrets required in this consumer repo.
- **Fail-Closed Security:** Policy enforcement and mandatory scanning run automatically on every pull request.

## Local Validation

Run the standalone consumer validator from the InfraFlow platform:

```bash
python3 path/to/infraflow/scripts/validate-consumer.py --config infraflow.config.yaml --repo-dir .
```
