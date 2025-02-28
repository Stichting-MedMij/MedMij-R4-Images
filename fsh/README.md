# FSH

This folder contains a basic FSH (FHIR Shorthand) configuration. The FSH definitions in the `input` folder can be built using the `sushi build` command.

## Prerequisites

It is assumed that the appropriate tooling, including SUSHI (FHIR Shorthand Compiler), is installed. If not, you can install it using:

```sh
npm install -g fsh-sushi
```

## Building the FSH Configuration

To generate the necessary FHIR artifacts from the FSH definitions, run the following command inside this folder:

```sh
sushi build
```

## Handling generated files

The `fsh-generated` folder is included in `.gitignore`, meaning that its contents are not tracked by Git. After running `sushi build`, you need to manually move the generated files to the `../test/resources/` folder in the repository.
