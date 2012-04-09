# Katana

## Overview
Opinionated personal URL shortener which runs on [Heroku][1] and uses [Redis to
go][2] as a backend. Shortening is done through the fabulous [Guillotine][3]
engine and its Redis adapter.

## Features
- Authentication
- Gauges support

## Setup

    git clone git://github.com/mrtazz/katana.git
    cd katana
    heroku create --stack cedar
    git push heroku master
    # for gauges support
    heroku config:add GAUGES_TOKEN="token"
    heroku config:add GAUGES_GAUGE="gauge"
    # for authentication
    heroku config:add HTTP_USER="theuser"
    heroku config:add HTTP_PASS="thepass"


## Thanks
[@technoweenie][4] for the awesome guillotine and [@roidrage][5] for
[s3itch][6] from which somehow get me started on wanting an own URL shortener.

[1]: http://heroku.com
[2]: http://redistogo.com
[3]: https://github.com/technoweenie/guillotine
[4]: https://twitter.com/technoweenie
[5]: https://twitter.com/roidrage
[6]: https://github.com/mattmatt/s3itch
