#!/bin/sh

echo y | fly -t azr sp -p demo -c pipeline.yml -l credentials.yml