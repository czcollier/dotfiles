//user-level plugin config
//plugins configured here will be available in all projects
resolvers += "jgit-repo" at "http://download.eclipse.org/jgit/maven"

addSbtPlugin("com.typesafe.sbt" % "sbt-git" % "0.6.2")

addSbtPlugin("com.github.mpeltonen" % "sbt-idea" % "1.5.1")

addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "2.3.0")

addSbtPlugin("org.ensime" % "ensime-sbt-cmd" % "0.1.2")

//addSbtPlugin("io.spray" % "sbt-revolver" % "0.7.1")

addSbtPlugin("net.virtual-void" % "sbt-dependency-graph" % "0.7.4")
