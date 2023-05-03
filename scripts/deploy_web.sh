#!/bin/bash
if [ ! -d "flutter" ]; then
    git clone https://github.com/flutter/flutter.git
fi

cd flutter
git checkout 3.7.12
cd ..
export PATH="$PATH:`pwd`/flutter/bin"

flutter packages get
flutter build web
