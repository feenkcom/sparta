pipeline {
    agent any
    stages {
        stage('Clean Workspace') {
            when { expression {
                    env.BRANCH_NAME.toString().equals('main') && (env.TAG_NAME == null)
                }
            }
            steps {
                sh 'git clean -fdx'
                sh 'chmod +x scripts/build/*.sh'
            }
        }
        // stage('Load') {
        //     steps {
        //         sh 'rm -rf pharo-local'
        //         sh 'scripts/build/load.sh'
        //     }
        // }
        // stage('Run examples') {
        //     steps {
        //         sh 'scripts/build/test.sh'
        //         junit '*.xml'
        //     }
        // }
        stage('Build gtoolkit') {
            when { expression {
                    env.BRANCH_NAME.toString().equals('main') && (env.TAG_NAME == null)
                }
            }
            steps {
                build(job: '../gtoolkit/main', wait: false)
            }
        }
    }
}
