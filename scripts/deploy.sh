#!/bin/bash
# rm -rf artifacts
npm run build
mkdir -p artifacts/code

# Package the lambda code
pushd artifacts/code
  # Copy the server code in here
  cp -r ../../build/ .
  cp ../../lambda/index.js .
  cp ../../package.json .

  # Run a production install
  npm install --production

  # Generate the prisma types
  npx prisma generate --schema ../../prisma/schema.prisma

  # Zip all the files
  zip -r -q bundle.zip ./*

  aws s3 cp bundle.zip s3://remix-jokes-2/code/
popd


aws lambda update-function-code --function-name RemixJokesServer --s3-bucket remix-jokes-2 --s3-key code/bundle.zip

pushd public
  aws s3 cp . s3://remix-jokes-2/assets --recursive --acl public-read
popd