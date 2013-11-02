hubot-divvy
===========

Hubot plugin to use the Divvy API

###How to install:

* include the coffee file in your hubot's ```scripts``` directory
* include nDivvy and geocoder in your hubot's ```package.json```
  * ```"ndivvy": "0.0.9",
    "geocoder": "0.1.0"``` should work just fine

###Example usage
```
hubot find me divvy bikes near  130 E. Randolph St. Chicago, Illinois
```

You should see a list of up to 5 bikes.

![screen shot 2013-10-30 at 11 56 23 am](https://f.cloud.github.com/assets/389926/1438957/44fadb1c-4184-11e3-8458-9f2eec3f9ea5.png)

