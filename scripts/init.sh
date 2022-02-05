# Initialize
copilot init --app remix-apps-ecs \
             --name jokes-app \
             --type 'Load Balanced Web Service' \
             --dockerfile './Dockerfile' \
             --port 80 \
             --deploy