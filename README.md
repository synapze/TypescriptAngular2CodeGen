# Typescript Angular2 Swagger CodeGen Template

Angular 2 typescript template for [swagger-codegen](https://github.com/swagger-api/swagger-codegen)

In this version I've modified the generated models to be interfaces rather than models so they can be implemented and extended.
I've also removed the original name spacing in favour of import * as API from './api'. That seems to play nice with Angular 2 beta.


### Usage
Open the bash script auto_generate.sh and change the variable values as needed. For example the application path and codegen output path.

1. Run the bash script
 ```bash
 sh auto_generate.sh
```

2. Depending on how many models you created in your loopback application, you might need to add more replace commands at the bottom
of the bash script to clean up your auto generated code.


That's all, you should be able to use it in your Angular2 Beta Application by importing the api/interfaces where ever you need it.



