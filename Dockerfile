FROM node:16
# Create app directory
WORKDIR /usr/apps/remix

# Set environment variables

# Copy package json
COPY . .

# Install the application
RUN npm install
RUN npm run build
RUN npx prisma db push
RUN node --require esbuild-register prisma/seed.ts

# Expose port 3000
EXPOSE 3000

# Start the application
CMD [ "./scripts/start.sh"]
