# Sellsy API
## Yeah, finaly a Ruby REALLY simple script

## But how does it works ?

### Setup
Just add your method into your script / program. If you use Ruby on Rails, you can set it into a controller, a helper (if you want to use this method in multiples method from a same controller) or the application helper  (if you want to use this method in multiples controllers).

### How to use it ?
Generate 2 vars : 1 string and 1 hash.
  - request:string = Your request, just find what you want on the documentation
  - params:hash = Your params, here is an example :

@params = {
  'pagination' => {
    'nbperpage' => 15
  },
  'search' => {
    'name' => 'test'
  }


### Licence
Under Apache license, because license is cool :)
