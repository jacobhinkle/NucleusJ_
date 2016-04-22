#!/bin/sh

#VER=1.0.6
VER=1.1.1
JAR=MorphoLibJ_-${VER}.jar
URL=https://github.com/ijpb/MorphoLibJ/releases/download/v${VER}/$JAR

wget --no-check-certificate ${URL}

mvn install:install-file -Dfile=$JAR
