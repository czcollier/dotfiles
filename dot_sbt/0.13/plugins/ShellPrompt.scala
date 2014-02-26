import sbt._
import Keys._
import scala.Console._

/**
 * Shell prompt that shows the current project,
 * git branch and build version in color.
 */ 
object ShellPrompt extends Plugin {
  /** /dev/null equivalent to send unwanted output to */
  object devnull extends ProcessLogger {
    def info (s: => String) {}
    def error (s: => String) { }
    def buffer[T] (f: => T): T = f
  }

  def currBranch = (
    (("git status -sb" lines_! devnull headOption)
      getOrElse "-/-" stripPrefix "## " split ("/")))(1)

  override def settings = Seq(
    shellPrompt := { state => {
      val currProject = Project.extract (state).currentProject.id
      s"$BOLD$currProject $YELLOW($currBranch)$BLUE > $RESET"
    }}
  )
}
