# AWS EC2 Staging & Production Environment (DevOps Project)

## 🌟 Project Overview

This project demonstrates a **real-world DevOps setup** using **AWS EC2**, where both **staging** and **production environments** are hosted on a single server with clear separation and automated deployment using Git and Bash scripting.  

The main goal was to simulate a **professional DevOps workflow** suitable for portfolio, client demonstration, or interview purposes.

---

## 🗂 Folder Structure

aws-staging-production-devops/
│
├── production/ # Production environment files
│ └── index.html
│
├── staging/ # Staging / testing environment files
│ └── index.html
│
├── scripts/ # Deployment scripts
│ └── deploy.sh # Bash script for branch-based auto deployment
│
├── nginx/ # Nginx configuration files
│ ├── production.conf
│ └── staging.conf
│
├── README.md # Project documentation
└── .gitignore # Optional: ignore unnecessary files


---

## 🚀 Features & Workflow

### 1. Dual Environment Setup
- **Production Environment** → Port `8080`  
- **Staging Environment** → Port `8081`  
- Isolated folders for each environment (`/var/www/production` and `/var/www/staging`)  
- Nginx server blocks configured separately for each environment  

### 2. Git Branch-Based Deployment
- `production` branch → deploys to **production folder**  
- `staging` branch → deploys to **staging folder**  
- Deployment automated using `deploy.sh` script  

### 3. Bash Deployment Script
- Detects current Git branch  
- Copies files to the correct environment folder automatically  
- Reduces human errors during deployment  

---

## 🛠 Tech Stack
- **AWS EC2 (Free Tier)**  
- Ubuntu 22.04 LTS Linux  
- Nginx Web Server  
- Git Version Control  
- Bash scripting for deployment automation  
- Security Group configuration for controlled access  

---

## 🔐 AWS Setup & Security

### 1. EC2 Instance
- Ubuntu 22.04 LTS, **t2.micro (Free Tier)**  
- Key-pair authentication for SSH login  

### 2. Security Groups (Firewall Rules)
Inbound rules configured:
| Protocol | Port  | Source         | Purpose                                      |
|----------|-------|----------------|---------------------------------------------|
| SSH      | 22    | Your IP        | Secure login only from trusted IP           |
| HTTP     | 80    | 0.0.0.0/0      | Default HTTP traffic                         |
| HTTPS    | 443   | 0.0.0.0/0      | Secure HTTPS traffic (future SSL)           |
| Custom   | 8080  | 0.0.0.0/0      | Production environment access                |
| Custom   | 8081  | 0.0.0.0/0      | Staging environment access                   |

> This setup ensures that **only authorized access** is allowed for SSH while both staging and production are publicly accessible for testing and demonstration.

---

## 📜 Nginx Configuration
- Separate server blocks for **production** and **staging**  
- Ports `8080` and `8081` respectively  
- Example:

**production.conf**
```nginx
server {
    listen 8080;
    root /var/www/production;
    index index.html;
}

server {
    listen 8081;
    root /var/www/staging;
    index index.html;
}

🏗 Deployment Flow

Developer pushes changes to a specific Git branch (staging or production)

deploy.sh script detects the branch

Script automatically copies files to the correct environment

Browser test to verify deployment:

http://<EC2_PUBLIC_IP>:8080 → Production

http://<EC2_PUBLIC_IP>:8081 → Staging

💡 AWS Project History & Context

Built using AWS Free Tier for cost-efficiency

Focused on creating realistic staging and production environments

Practiced server hardening and secure remote access

Used AWS Security Groups for network-level isolation and controlled exposure

🔮 Future Improvements

Implement CI/CD with GitHub Actions for fully automated deployments

Add SSL certificates (Let's Encrypt) for secure HTTPS

Integrate monitoring tools like Netdata or Prometheus

Dockerize environments for portability and scalability

👨‍💻 Author

Momin
DevOps Enthusiast & Cloud Infrastructure Learner

Portfolio-ready project demonstrating:

Environment separation

Git-based deployments

Server automation

Cloud infrastructure management
