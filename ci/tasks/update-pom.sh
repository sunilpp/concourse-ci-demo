#/bin/sh

VERSION=`cat version/number`
MESSAGE="Release $VERSION"

if [ "$SNAPSHOT" == "true" ]; then
    VERSION=${VERSION}-SNAPSHOT
    MESSAGE="Bump to Next Development Version ($VERSION)"
fi

cd out
shopt -s dotglob
mv -f ../repo/* ./
echo "Bump to ($VERSION)"
./mvnw versions:set -DnewVersion=${VERSION} -DallowSnapshots -Dmaven.repo.local=../m2/rootfs/opt/m2
git config --global user.email "{{git-email}}"
git config --global user.name "{{git-name}}"
git add pom.xml
git commit -m "${MESSAGE}"