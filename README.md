# Sellsy API
## Yeah, finaly a Ruby REALLY simple script

## But how does it works ?

### Setup
Just add your method into your script / program. If you use Ruby on Rails, you can set it into a controller or a helper (if you require Sellsy-API in multiples methods from a same controller).

### How to use it ?
Generate 2 vars : 1 string and 1 hash.
  - request:string = Your request, just find what you want on the documentation (https://api.sellsy.fr/documentation/methodes)
  - params:hash = Your params, here is an example :

@params = {
  'pagination' => {
    'nbperpage' => 15
  },
  'search' => {
    'name' => 'test'
  }

###
Documentation: https://api.sellsy.fr/documentation/resources
Sellsy-API script is referred by the Sellsy official developer guide.

### Licence
Under Apache license, because license is cool :)
