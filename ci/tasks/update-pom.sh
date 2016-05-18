#!/bin/sh

VERSION=`cat version/number`
MESSAGE="Release $VERSION"

if [ "$SNAPSHOT" == "true" ]; then
    VERSION=${VERSION}-SNAPSHOT
    MESSAGE="Bump to Next Development Version ($VERSION)"
fi

cd out
shopt -s dotglob
mv -f ../repo/* ./
if [ "$SNAPSHOT" == "true" ]; then
    echo "Rebase ..."
    git rebase master
fi
echo "Bump to ($VERSION)"
./mvnw versions:set -DnewVersion=${VERSION} -DallowSnapshots -Dmaven.repo.local=../m2/rootfs/opt/m2
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add pom.xml
git commit -m "${MESSAGE}"