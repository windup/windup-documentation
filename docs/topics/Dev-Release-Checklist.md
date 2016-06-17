# Windup Release Checklist

* [Compile a list of "what's new in Windup <X.Y.Z>"](https://github.com/windup/windup/wiki/What's-new-in-Windup--and-Release-notes) [put to front as we should review that before releasing]
* Build & upload artifacts
```
mvn release:prepare release:perform -DreleaseVersion=<X.Y.Z> -Dtag=<X.Y.Z> -DdevelopmentVersion=<X.Y.Z+1-SNAPSHOT>
```
* Update `<version.windup>...</version.windup>` manually or with `mvn versions:update-property -Dproperty=version.windup -DnewVersion=<new_windup_version>` in:
  - `windup-rulesets`
  - `windup-quickstarts` (each `pom.xml` separatedly) - [Windup Quickstarts Release Instructions](Dev-Quickstart-Release-Instructions)
  - `windup-distribution`
  - `windup-maven-plugin`
  - `nexus-repository-indexer`
* [optional] Release & upload a new version of `nexus-repository-indexer` to have a fresh Maven index next time
* Build & upload the distribution ZIP
* Javadoc to `windup/windup`, branch `gh-pages`
* HTML single-page docs to `windup/windup`, branch `gh-pages`
* Verify the distribution ZIP - download and run against some big app
* PR: Create a short video about what's new
* PR: Announce the release to mailing lists (`windup-users@lists.jboss.org`, `jboss-announce@redhat.com`, `jboss-migration@redhat.com`), including:
  - What's new
  - A link to the download
  - A link to the "How to use" documentation
  - A link to the "What's new" video (if already created)
  - A link to release notes
* Jira: Mark the version as released - [WINDUP](https://issues.jboss.org/plugins/servlet/project-config/WINDUP/versions), [WINDUPRULE](https://issues.jboss.org/plugins/servlet/project-config/WINDUPRULE/versions), [MIGR](https://issues.jboss.org/plugins/servlet/project-config/MIGR/versions)
* Jira: Push the unresolved issues to the next version
* Pub: Roll out the barrels & celebrate

#### Release Maven command example

For `windup-core`, there's a release script at `build/release_windup.sh`.

#### Release Maven command example

    REL=6.0
    DEV=6.1-SNAPSHOT
    mvn release:prepare release:perform \
    -DskipTests -Darguments=-DskipTests -Dmvn.test.skip=true -Dfurnace.dot.skip \
    -DreleaseVersion=$REL \
    -Dtag=$REL \
    -DdevelopmentVersion=$DEV


