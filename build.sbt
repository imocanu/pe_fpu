resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases")
)

val projLibraryDependencies = Seq(
  "edu.berkeley.cs" %% "chisel3" % "3.+",
  "org.easysoc"     %% "layered-firrtl" % "1.1.+",
  "edu.berkeley.cs" %% "firrtl" % "1.+",
  "edu.berkeley.cs" %% "firrtl-diagrammer" % "1.+",
  "edu.berkeley.cs" %% "chisel-iotesters" % "2.+" % "test"
)

val projScalacOptions = Seq(
  "-Xsource:2.11",
  // Enables autoclonetype2 in 3.4.x (on by default in 3.5)
  "-language:reflectiveCalls",
  "-unchecked",
  "-deprecation",
  "-feature",
  "-Xcheckinit"
)

scalaVersion  := "2.12.15"

lazy val hardfloat  = (project in file("berkeley-hardfloat"))
  .settings(
    libraryDependencies ++= projLibraryDependencies,
    scalacOptions ++= projScalacOptions,
    publishArtifact := false,
    addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.full),
    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.+" cross CrossVersion.full)
  )

lazy val root = (project in file("."))
  .settings(
    version := "6.1.1",
    name := "PE_IP",
    organization := "gig",
    libraryDependencies ++= projLibraryDependencies,
    scalacOptions ++= projScalacOptions,
    addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.full),
    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.+" cross CrossVersion.full)
  )
  .dependsOn(hardfloat)