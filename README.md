# Keycloak bootstrap 5 theme

Fork of https://github.com/ambersnow/keycloaktheme-bs5

A simple Bootstrap v5 based Keycloak Theme.

## Work In Progess

Currently, the theme only supports these authentication methods :

* Username + password
* Username only
* Webauthn
* IDP delegation

You can use other methods available on Keycloak, but the rendering may be not good. 

## Usage

Download the repo, place it in the `themes` directory in your Keycloak instance.
To use it, you need to define it as default login theme for a realm.

## Customization

The theme also allows you to use a custom logo, so upload your logo with the name of `logo.svg` under `resources/img/`.

