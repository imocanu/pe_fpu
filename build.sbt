resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases")
)

lazy val hardfloat  = (project in file("berkeley-hardfloat"))
  .settings(
    scalaVersion  := "2.12.15",
    publishArtifact := false,
    libraryDependencies ++= Seq(
      "edu.berkeley.cs" %% "chisel3" % "3.+",
      "edu.berkeley.cs" %% "dsptools" % "1.4.+",
      "edu.berkeley.cs" %% "treadle" % "1.3.+",
      "org.easysoc" %% "layered-firrtl" % "1.1.+",
      "edu.berkeley.cs" %% "chisel3-macros" % "3.4.+",
      "edu.berkeley.cs" %% "firrtl" % "1.+",
      "edu.berkeley.cs" %% "firrtl-diagrammer" % "1.+",
      "edu.berkeley.cs" %% "chisel-iotesters" % "2.+" % "test"
    ),
    scalacOptions ++= Seq(
      "-Xsource:2.11",
      // Enables autoclonetype2 in 3.4.x (on by default in 3.5)
      "-P:chiselplugin:useBundlePlugin",
      "-language:reflectiveCalls",
      "-unchecked",
      "-deprecation",
      "-feature",
      "-Xcheckinit"
    ),
    addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.full),
    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.+" cross CrossVersion.full)
  )

lazy val root = (project in file("."))
  .settings(
    scalaVersion  := "2.12.15",
    version := "1.0.0",
    name := "PE_FPU",
    organization := "com.gig",
    libraryDependencies ++= Seq(
      "edu.berkeley.cs" %% "chisel3" % "3.+",
      "edu.berkeley.cs" %% "dsptools" % "1.4.+",
      "edu.berkeley.cs" %% "treadle" % "1.3.+",
      "org.easysoc" %% "layered-firrtl" % "1.1.+",
      "edu.berkeley.cs" %% "chisel3-macros" % "3.4.+",
      "edu.berkeley.cs" %% "firrtl" % "1.+",
      "edu.berkeley.cs" %% "firrtl-diagrammer" % "1.+",
      //"org.scalatest" %% "scalatest" % "3.2.0",
      "edu.berkeley.cs" %% "chisel-iotesters" % "2.+" % "test"
    ),
    scalacOptions ++= Seq(
      "-Xsource:2.11",
      // Enables autoclonetype2 in 3.4.x (on by default in 3.5)
      "-P:chiselplugin:useBundlePlugin",
      "-language:reflectiveCalls",
      "-unchecked",
      "-deprecation",
      "-feature",
      "-Xcheckinit"
    ),
    addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.full),
    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.+" cross CrossVersion.full)
  )
  .dependsOn(hardfloat)