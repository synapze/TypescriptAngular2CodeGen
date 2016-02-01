#!/bin/bash

# loopback server host
LOOPBACK_HOST=http://localhost:3000

# application path
APP_PATH=[YOUR APPLICATIONS PATH]

# output path for auto generated files
OUTPUT_PATH=[YOUR OUTPUT PATH]

# swagger template for typeScripted Angular2
SWAGGER_TEMPLATE=[PATH TO ANGULAR 2 TEMPLATE]

# go into bmcloud directory
echo "change directory to $APP_PATH"
cd $APP_PATH

# Generate typescripted models and apis from swagger:
echo "generating codegen based models and apis..."
 swagger-codegen generate  \
    -i $LOOPBACK_HOST/explorer/swagger.json  \
    -o $OUTPUT_PATH \
    -l typescript-angular \
    -t $SWAGGER_TEMPLATE

# go into auto generated files output  directory
echo "change directory to $OUTPUT_PATH"
cd $OUTPUT_PATH

# Search and replace data type naming conventions from generated files.
# @note - you will need the replace node package..  npm install replace -g
# Tip: you can use the --preview flag if you want to preview changes before modifying files

echo "search and replace post treatment..."
 replace 'data\?: User' 'data?: API.IUser' . -r --include="*.ts"
 replace 'options: Options' 'options: API.IOptions' . -r --include="*.ts"
 replace 'data\?: AccessToken' 'data?: API.IAccessToken' . -r --include="*.ts"
 replace '<inline_response_200>' '<API.IInlineResponse200>' . -r --include="*.ts"
 replace '<inline_response_200_1>' '<API.IInlineResponse2001>' . -r --include="*.ts"
 replace '<inline_response_200_2>' '<API.IInlineResponse2002>' . -r --include="*.ts"
 replace '<InlineResponse200_2>' '<API.IInlineResponse2002>' . -r --include="*.ts"
 replace 'credentials: Credentials' 'credentials: API.ICredentials' . -r --include="*.ts"
 replace 'created: date' 'created: Date' . -r --include="*.ts"
 replace '<User>' '<API.IUser>' . -r --include="*.ts"
 replace '<AccessToken>' '<API.IAccessToken>' . -r --include="*.ts"

 # change loopback base basePath in auto generated files
 replace "basePath = 'https://localhost/api'" "basePath = '$LOOPBACK_HOST/api'" . -r --include="*.ts"

echo "auto generation complete..."




