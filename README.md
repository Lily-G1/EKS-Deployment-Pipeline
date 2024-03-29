# EKS-Deployment-Pipeline  
## CI/CD Pipeline to Deploy Web Applications & Monitoring on AWS EKS Cluster  

### Details:  
using Terraform, this project creates a Jenkins CI/CD pipeline to deploy a microservice web application (Weaveworks' sock-shop) alongside a simple web form in an Amazon Elastic Kubernetes Service (EKS) cluster. Prometheus & Grafana monitoring tools are also configured to collect and display performance metrics of the cluster.  
- The sock-shop project can be found here: https://github.com/microservices-demo/microservices-demo  
- The web form is a personal creation. It is a simple HTML/CSS/PHP application that collects user data and stores it in a backend MySQL database.  

To run:  
- Create an AWS S3 bucket by running terraform in the *'s3-bucket-state'* directory. This bucket will store all terraform state files  
- Launch a Jenkins (EC2) server with required resources by running terraform in the *'create-jenkins-server'* directory  
- Configure Jenkins with necessary AWS & Github access credentials
- Create pipeline in Jenkins and build to launch EKS cluster, deploy web applications to cluster & configure monitoring tools. Web apps, Prometheus & Grafana dashboard 
  can be accessed through Load Balancer DNS names  
- To test built-in metrics in Prometheus, type '**sum(kube_pod_owner{job="kube-state-metrics"}) by (namespace)**' in the search bar & click on the **Execute** button  
- Grafana login details:  
  - username: admin  
  - password: prom-operator (default)

 ![K8s drawio(small)](https://github.com/Lily-G1/EKS-Deployment-Pipeline/assets/104821662/910fc99f-a90c-4cad-8af0-3f13a4ce5add)
