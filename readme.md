## Availability

Images for `linux/arm64` and `linux/amd64` are built on Alpine using OpenJDK 8, available at [ecivis/ant-builder](https://hub.docker.com/r/ecivis/ant-builder).


## Usage

### Standalone

To execute Apache Ant as a standalone process in a container, mount a project workspace with a `build.xml` to be processed and specify a build target.

```shell
docker run -v $PWD:/project ecivis/ant-builder:1.9.8
```

The standard command line options for may be provided as needed:

```shell
docker run -v $PWD:/project ecivis/ant-builder:1.9.8 -Dbuild=73 -Dcommit=fd16d0d06d -f build/special.xml clean build archive
```


### Multi-stage Build

The Ant builder can be used in a multi-stage image build to retrieve an artifact from its overlay filesystem.

```dockerfile
FROM docker.io/ecivis/ant-builder:1.9.8 AS ant
COPY build.xml ./
COPY src ./src/
RUN ant dist

FROM tomcat:9
# ...
COPY --from=ant /project/dist/app.war /usr/local/tomcat/webapps
```
