pipeline {
	agent any
	
	tools {
		maven 'maven-3.8'
	}
	
	stages {
		stage("build war") {
			steps {
				script {
					echo "building the war app....."
					sh 'mvn package'
				}
			}
		}
		stage("building docker image") {
			steps {
				script{
					echo "building docker image with war file..."
					withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'PASS', usernameVariable: 'DOCKER_ID')])
					sh 'docker build -t abubandit/demo-app:1.0 .'
					sh 'echo $PASS | docker login -u $DOCKER_ID --password-stdin'
					sh 'docker push abubandit/demo-app:1.0'
				}
			}
		}
		stage("deploying app") {
			steps {
				script {
					echo 'deploying app...'
				}
			}
		}
	}
}
