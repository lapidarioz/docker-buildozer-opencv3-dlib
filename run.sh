#!/bin/bash
docker run --rm -ti -v $(pwd):/src -v package-name:/home/kivy/.buildozer:rw kivy-app android debug
