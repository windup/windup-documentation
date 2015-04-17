if [ "$1" == "" ]; then 

    echo "You must pass the path to the windup.wiki GitHub directories on the command line." 
    echo "For example:  scripts/windupDocCopyWiki.sh ~/GitRepos/windup.wiki"
    exit
fi
echo "*******************************************"
echo "Copying files from: " $1
echo "*******************************************"
cp $1/About-the-WINDUP_HOME-Variable.asciidoc docs/About-the-WINDUP_HOME-Variable.adoc
cp $1/About-the-Windup-Wiki.asciidoc docs/About-the-Windup-Wiki.adoc
cp $1/Core-Development-Guide.asciidoc docs/Core-Development-Guide.adoc  ## this topic is not used
cp $1/Dev-Add-Images-to-the-Windup-Wiki.asciidoc docs/Dev-Add-Images-to-the-Windup-Wiki.adoc
cp $1/Dev-Build-Windup-from-Source.asciidoc docs/Dev-Build-Windup-from-Source.adoc
cp $1/Dev-Classloading-Notes.asciidoc docs/Dev-Classloading-Notes.adoc
cp $1/Dev-Concepts-and-Philosophy.asciidoc docs/Dev-Concepts-and-Philosophy.adoc
cp $1/Dev-Connect-to-the-Graph-via-Rexster.asciidoc docs/Dev-Connect-to-the-Graph-via-Rexster.adoc
cp $1/Dev-Create-Windup-JavaDoc.asciidoc docs/Dev-Create-Windup-JavaDoc.adoc
cp $1/Dev-Customer-Portal-Tags.asciidoc docs/Dev-Customer-Portal-Tags.adoc  ## this topic is not used
cp $1/Dev-Debugging-and-Profiling.asciidoc docs/Dev-Debugging-and-Profiling.adoc
cp $1/Dev-Decompiling.asciidoc docs/Dev-Decompiling.adoc
cp $1/Dev-Dependencies.asciidoc docs/Dev-Dependencies.adoc
cp $1/Dev-Development-Guidelines-and-Conventions.asciidoc docs/Dev-Development-Guidelines-and-Conventions.adoc
cp $1/Dev-Execute-Windup-Built-from-Source.asciidoc docs/Dev-Execute-Windup-Built-from-Source.adoc
cp $1/Dev-Frames-Extensions.asciidoc docs/Dev-Frames-Extensions.adoc
cp $1/Dev-Get-the-Windup-Source-Code.asciidoc docs/Dev-Get-the-Windup-Source-Code.adoc
cp $1/Dev-Git-Rebasing.asciidoc docs/Dev-Git-Rebasing.adoc
cp $1/Dev-How-to-Write-a-Rule-Test.asciidoc docs/Dev-How-to-Write-a-Rule-Test.adoc  ## this topic is not used
cp $1/Dev-Internal-API-Features.asciidoc docs/Dev-Internal-API-Features.adoc
cp $1/Dev-Jenkins-Setup.asciidoc docs/Dev-Jenkins-Setup.adoc  ## this topic is not used
cp $1/Dev-Logging.asciidoc docs/Dev-Logging.adoc
cp $1/Dev-Port-WindRide-Functionality-to-Windup.asciidoc docs/Dev-Port-WindRide-Functionality-to-Windup.adoc
cp $1/Dev-Release-Checklist.asciidoc docs/Dev-Release-Checklist.adoc  ## this topic is not used
cp $1/Dev-Rule-Documentation-Tracker.asciidoc docs/Dev-Rule-Documentation-Tracker.adoc  ## this topic is not used
cp $1/Dev-Rule-Metadata-and-API-Discrepancies.asciidoc docs/Dev-Rule-Metadata-and-API-Discrepancies.adoc  ## this topic is not used
cp $1/Dev-Submit-Code-Updates-to-the-Windup-Project.asciidoc docs/Dev-Submit-Code-Updates-to-the-Windup-Project.adoc
cp $1/Dev-Team-Meeting.asciidoc docs/Dev-Team-Meeting.adoc  ## this topic is not used
cp $1/Dev-Test-Logging.asciidoc docs/Dev-Test-Logging.adoc  ## this topic is not used
cp $1/Dev-Troubleshoot-Windup-Issues.asciidoc docs/Dev-Troubleshoot-Windup-Issues.adoc
cp $1/Dev-Variables-Stack.asciidoc docs/Dev-Variables-Stack.adoc
cp $1/Dev-Windup-Bootstrap.asciidoc docs/Dev-Windup-Bootstrap.adoc
cp $1/Dev-Windup-Configuration.asciidoc docs/Dev-Windup-Configuration.adoc  ## this topic is not used
cp $1/Dev-Windup-Documentation-Process.asciidoc docs/Dev-Windup-Documentation-Process.adoc
cp $1/Dev-Windup-Project-Information.asciidoc docs/Dev-Windup-Project-Information.adoc
cp $1/Dev-Windup-Project-Structure.asciidoc docs/Dev-Windup-Project-Structure.adoc
cp $1/Dev-Windup-Release-Process.asciidoc docs/Dev-Windup-Release-Process.adoc
cp $1/Dev-Windup-Web.asciidoc docs/Dev-Windup-Web.adoc  ## this topic is not used
cp $1/Execute-Windup.asciidoc docs/Execute-Windup.adoc
cp $1/Extend-Windup-Rules.asciidoc docs/Extend-Windup-Rules.adoc  ## this topic is not used
cp $1/Features-of-Windup-2.asciidoc docs/Features-of-Windup-2.adoc
cp $1/Get-Involved.asciidoc docs/Get-Involved.adoc
cp $1/Glossary.asciidoc docs/Glossary.adoc
cp $1/Home.asciidoc docs/Home.adoc  ## this topic is not used
cp $1/Install-and-Configure-Maven.asciidoc docs/Install-and-Configure-Maven.adoc
cp $1/Install-Windup.asciidoc docs/Install-Windup.adoc
cp $1/Known-Issues.asciidoc docs/Known-Issues.adoc
cp $1/Migration-Planning-Guide.asciidoc docs/Migration-Planning-Guide.adoc  ## this topic is not used
cp $1/Migration-Planning-Process.asciidoc docs/Migration-Planning-Process.adoc  ## this topic is not used
cp $1/Migration-Technology-Categories.asciidoc docs/Migration-Technology-Categories.adoc  ## this topic is not used
cp $1/News.asciidoc docs/News.adoc  ## this topic is not used
cp $1/Performance-tuning.asciidoc docs/Performance-tuning.adoc  ## this topic is not used
cp $1/Report-Issues-with-Windup.asciidoc docs/Report-Issues-with-Windup.adoc
cp $1/Review-the-Report.asciidoc docs/Review-the-Report.adoc
cp $1/Review-the-Windup-Quickstarts.asciidoc docs/Review-the-Windup-Quickstarts.adoc
cp $1/Rule-Metadata.asciidoc docs/Rule-Metadata.adoc
cp $1/Rule-Phases.asciidoc docs/Rule-Phases.adoc
cp $1/Rules-Available-Rules-Utilities.asciidoc docs/Rules-Available-Rules-Utilities.adoc
cp $1/Rules-Basic-Rule-Execution-Flow-Patterns.asciidoc docs/Rules-Basic-Rule-Execution-Flow-Patterns.adoc
cp $1/Rules-Create-a-Basic-Java-based-Rule-Add-on.asciidoc docs/Rules-Create-a-Basic-Java-based-Rule-Add-on.adoc
cp $1/Rules-Create-a-Basic-XML-Rule.asciidoc docs/Rules-Create-a-Basic-XML-Rule.adoc
cp $1/Rules-Create-a-Groovy-Rule-Add-on.asciidoc docs/Rules-Create-a-Groovy-Rule-Add-on.adoc  ## this topic is not used
cp $1/Rules-Create-an-Advanced-Ruleset.asciidoc docs/Rules-Create-an-Advanced-Ruleset.adoc
cp $1/Rules-Create-Custom-Reports.asciidoc docs/Rules-Create-Custom-Reports.adoc  ## this topic is not used
cp $1/Rules-Create-Java-Queries.asciidoc docs/Rules-Create-Java-Queries.adoc
cp $1/Rules-Creating-Rule-Operations.asciidoc docs/Rules-Creating-Rule-Operations.adoc
cp $1/Rules-Development-Guide.asciidoc docs/Rules-Development-Guide.adoc  ## this topic is not used
cp $1/Rules-Difference-Between-XML-based-and-Java-based-Rules.asciidoc docs/Rules-Difference-Between-XML-based-and-Java-based-Rules.adoc
cp $1/Ruleset-Core.asciidoc docs/Ruleset-Core.adoc  ## this topic is not used
cp $1/Ruleset-Java-Archives-Identification.asciidoc docs/Ruleset-Java-Archives-Identification.adoc  ## this topic is not used
cp $1/Ruleset-Java-Basic-Ruleset.asciidoc docs/Ruleset-Java-Basic-Ruleset.adoc
cp $1/Ruleset-Java-Classifications-and-Inline-Hints.asciidoc docs/Ruleset-Java-Classifications-and-Inline-Hints.adoc
cp $1/Ruleset-Java-Code-Matching-Examples.asciidoc docs/Ruleset-Java-Code-Matching-Examples.adoc  ## this topic is not used
cp $1/Ruleset-Java-EE-Apps.asciidoc docs/Ruleset-Java-EE-Apps.adoc
cp $1/Ruleset-Java-EE-Servers.asciidoc docs/Ruleset-Java-EE-Servers.adoc
cp $1/Ruleset-Reporting.asciidoc docs/Ruleset-Reporting.adoc
cp $1/Ruleset-Ruleset-Template.asciidoc docs/Ruleset-Ruleset-Template.adoc  ## this topic is not used
cp $1/Ruleset-XML.asciidoc docs/Ruleset-XML.adoc
cp $1/Ruleset-XML-Ruleset-Element-Reference.asciidoc docs/Ruleset-XML-Ruleset-Element-Reference.adoc  ## this topic is not used
cp $1/Rules-Java-based-Rule-Structure.asciidoc docs/Rules-Java-based-Rule-Structure.adoc
cp $1/Rules-Ops-Reporting-Classification.asciidoc docs/Rules-Ops-Reporting-Classification.adoc
cp $1/Rules-Ops-Reporting-Hint.asciidoc docs/Rules-Ops-Reporting-Hint.adoc
cp $1/Rules-Ops-Reporting-TypeReference.asciidoc docs/Rules-Ops-Reporting-TypeReference.adoc
cp $1/Rules-Ops-Xml-XsltTransformation.asciidoc docs/Rules-Ops-Xml-XsltTransformation.adoc
cp $1/Rules-Rule-Configuration.asciidoc docs/Rules-Rule-Configuration.adoc  ## this topic is not used
cp $1/Rules-Rule-Execution-Lifecycle.asciidoc docs/Rules-Rule-Execution-Lifecycle.adoc
cp $1/Rules-Rulesets.asciidoc docs/Rules-Rulesets.adoc
cp $1/Rules-Rules-Operations.asciidoc docs/Rules-Rules-Operations.adoc
cp $1/Rules-Rules-Overview.asciidoc docs/Rules-Rules-Overview.adoc   ## this topic is not used
cp $1/Rules-Rule-Story-Points.asciidoc docs/Rules-Rule-Story-Points.adoc
cp $1/Rules-Test-a-Basic-XML-Rule-in-Windup.asciidoc docs/Rules-Test-a-Basic-XML-Rule-in-Windup.adoc
cp $1/Rules-Windup-Models.asciidoc docs/Rules-Windup-Models.adoc
cp $1/Rules-XML-Rule-Construction.asciidoc docs/Rules-XML-Rule-Construction.adoc  ## this topic is not used
cp $1/Rules-XML-Rule-Perform-Action-Syntax.asciidoc docs/Rules-XML-Rule-Perform-Action-Syntax.adoc
cp $1/Rules-XML-Rule-When-Condition-Syntax.asciidoc docs/Rules-XML-Rule-When-Condition-Syntax.adoc
cp $1/Rule-XML-Ruleset-Examples-Match-on-XMLFile.asciidoc docs/Rule-XML-Ruleset-Examples-Match-on-XMLFile.adoc  ## this topic is not used
cp $1/Sande-ScratchPad.asciidoc docs/Sande-ScratchPad.adoc  ## this topic is not used
cp $1/_Sidebar.asciidoc docs/_Sidebar.adoc  ## this topic is not used
cp $1/Start-Windup.asciidoc docs/Start-Windup.adoc  ## this topic is not used
cp $1/User-Guide.asciidoc docs/User-Guide.adoc  ## this topic is not used
cp $1/What-is-Windup.asciidoc docs/What-is-Windup.adoc
cp $1/Windup-Architectural-Components.asciidoc docs/Windup-Architectural-Components.adoc
cp $1/Windup-lab-scripts.asciidoc docs/Windup-lab-scripts.adoc  ## this topic is not used
cp $1/Windup-Processing-Overview.asciidoc docs/Windup-Processing-Overview.adoc

