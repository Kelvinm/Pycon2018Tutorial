
#!/bin/bash
. ~/bin/demo-magic.sh
clear

# change to 0 for demo, 1 for testing
PROMPT_TIMEOUT=0

p "# ROLLING BACK AN UPDATE"
DEMO_PROMPT="$ "

p "cd whereplot"
cd whereplot
pe "kubectl apply -f deployment/"
pe "kubectl get pods"
sleep 30

pe "kubectl set image deploy/frontend whereplot=localhost:5000/whereplotv2"
sleep 60
pe "kubectl get deploy frontend"
pe "kubectl get pods"

pe "kubectl rollout undo deploy/frontend"
sleep 60
pe "kubectl get deploy frontend"
pe "kubectl get pods"

pe "kubectl delete deploy frontend"
pe "kubectl delete service frontend"
