# ROKKUTO

Rokkuto is auth web service.

Features in version v1:
- adding component to a rokkuto db
- share that component with users that doesn't have access to your application



## Installation
- fork the repo
- then `bundle install`
- run it with `foreman start`

## Usage
- creating an object:

`POST /api/v1/auth_object/`

``` json
{ 
  "api_key" : "89e652f5c52704f6a9f86bc608df5b22", 
  "content_id" : "7", 
  "content_type" : "link", 
  "email" : "me@example.org", 
  "permissions" : "rwx" 
}
```
- giving access rights:

`POST /api/v1/access/`
``` json
{ 
  "api_key" : "89e652f5c52704f6a9f86bc608df5b22", 
  "content_id" : "7", 
  "content_type" : "link", 
  "email" : "me@example.org",
  "to" : {
           "other@example.org" : "rw", 
           "someone@example.org" : "rwx",
           "other_someone@example.org" : "r"
         } 
}

```