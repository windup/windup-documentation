if [ "$1" == "" ]; then 

    echo "You must pass the path to the windup.wiki GitHub directories on the command line." 
    echo "For example:  scripts/windupDocCopyWiki.sh ~/GitRepos/windup.wiki"
    exit
fi
echo "*******************************************"
echo "Copying files from: " $1
echo "*******************************************"
cp $1/About-Rules.asciidoc docs/About-Rules.adoc
cp $1/About-the-HOME-Variable.asciidoc docs/About-the-HOME-Variable.adoc
cp $1/About-this-Wiki.asciidoc docs/About-this-Wiki.adoc
cp $1/Architectural-Components.asciidoc docs/Architectural-Components.adoc
cp $1/Core-Development-Guide.asciidoc docs/Core-Development-Guide.adoc  ## this topic is not used
cp $1/Dev-Add-Images-to-the-Wiki.asciidoc docs/Dev-Add-Images-to-the-Wiki.adoc
cp $1/Dev-Bootstrap-Process.asciidoc docs/Dev-Bootstrap-Process.adoc
cp $1/Dev-Build-from-Source.asciidoc docs/Dev-Build-from-Source.adoc
cp $1/Dev-Classloading-Notes.asciidoc docs/Dev-Classloading-Notes.adoc
cp $1/Dev-Concepts-and-Philosophy.asciidoc docs/Dev-Concepts-and-Philosophy.adoc
cp $1/Dev-Connect-to-the-Graph-via-Rexster.asciidoc docs/Dev-Connect-to-the-Graph-via-Rexster.adoc
cp $1/Dev-Create-A-Test-for-A-Java-based-Rule-Add-on.asciidoc docs/Dev-Create-A-Test-for-A-Java-based-Rule-Add-on.adoc 
cp $1/Dev-Create-Your-First-Java-based-Rule-Add-on.asciidoc docs/Dev-Create-Your-First-Java-based-Rule-Add-on.adoc
cp $1/Dev-Create-the-JavaDoc.asciidoc docs/Dev-Create-the-JavaDoc.adoc
cp $1/Dev-Customer-Portal-Tags.asciidoc docs/Dev-Customer-Portal-Tags.adoc  ## this topic is not used
cp $1/Dev-Debugging-and-Profiling.asciidoc docs/Dev-Debugging-and-Profiling.adoc
cp $1/Dev-Decompiling.asciidoc docs/Dev-Decompiling.adoc
cp $1/Dev-Dependencies.asciidoc docs/Dev-Dependencies.adoc
cp $1/Dev-Development-Guidelines-and-Conventions.asciidoc docs/Dev-Development-Guidelines-and-Conventions.adoc
cp $1/Dev-Documentation-Process.asciidoc docs/Dev-Documentation-Process.adoc
cp $1/Dev-Execute-Built-from-Source.asciidoc docs/Dev-Execute-Built-from-Source.adoc
cp $1/Dev-Frames-Extensions.asciidoc docs/Dev-Frames-Extensions.adoc
cp $1/Dev-Get-the-Source-Code.asciidoc docs/Dev-Get-the-Source-Code.adoc
cp $1/Dev-Git-Rebasing.asciidoc docs/Dev-Git-Rebasing.adoc
cp $1/Dev-Internal-API-Features.asciidoc docs/Dev-Internal-API-Features.adoc
cp $1/Dev-Jenkins-Setup.asciidoc docs/Dev-Jenkins-Setup.adoc  ## this topic is not used
cp $1/Dev-Logging.asciidoc docs/Dev-Logging.adoc
cp $1/Dev-Port-WindRide-Functionality.asciidoc docs/Dev-Port-WindRide-Functionality.adoc ## this topic is not used
cp $1/Dev-Project-Information.asciidoc docs/Dev-Project-Information.adoc
cp $1/Dev-Project-Structure.asciidoc docs/Dev-Project-Structure.adoc
cp $1/Dev-Release-Checklist.asciidoc docs/Dev-Release-Checklist.adoc  ## this topic is not used
cp $1/Dev-Release-Process.asciidoc docs/Dev-Release-Process.adoc
cp $1/Dev-Rule-Documentation-Tracker.asciidoc docs/Dev-Rule-Documentation-Tracker.adoc  ## this topic is not used
cp $1/Dev-Rule-Metadata-and-API-Discrepancies.asciidoc docs/Dev-Rule-Metadata-and-API-Discrepancies.adoc  ## this topic is not used
cp $1/Dev-Startup-Configuration-Arguments.asciidoc docs/Dev-Startup-Configuration-Arguments.adoc  ## this topic is not used
cp $1/Dev-Submit-Code-Updates-to-the-Project.asciidoc docs/Dev-Submit-Code-Updates-to-the-Project.adoc
cp $1/Dev-Team-Meeting.asciidoc docs/Dev-Team-Meeting.adoc  ## this topic is not used
cp $1/Dev-Test-Logging.asciidoc docs/Dev-Test-Logging.adoc  ## this topic is not used
cp $1/Dev-Troubleshoot-Issues.asciidoc docs/Dev-Troubleshoot-Issues.adoc
cp $1/Dev-Variables-Stack.asciidoc docs/Dev-Variables-Stack.adoc
cp $1/Dev-Web-Instructions.asciidoc docs/Dev-Web-Instructions.adoc  ## this topic is not used
cp $1/Execute.asciidoc docs/Execute.adoc
cp $1/Extend-the-Rules.asciidoc docs/Extend-the-Rules.adoc  ## this topic is not used
cp $1/Features.asciidoc docs/Features.adoc
cp $1/Get-Involved.asciidoc docs/Get-Involved.adoc
cp $1/Glossary.asciidoc docs/Glossary.adoc
cp $1/Home.asciidoc docs/Home.adoc  ## this topic is not used
cp $1/Important-Links.asciidoc docs/Important-Links.adoc
cp $1/Install-and-Configure-Maven.asciidoc docs/Install-and-Configure-Maven.adoc
cp $1/Install.asciidoc docs/Install.adoc
cp $1/Known-Issues.asciidoc docs/Known-Issues.adoc
cp $1/Lab-Setup-Scripts.asciidoc docs/Lab-Setup-Scripts.adoc  ## this topic is not used
cp $1/Migration-Planning-Guide.asciidoc docs/Migration-Planning-Guide.adoc  ## this topic is not used
cp $1/Migration-Planning-Process.asciidoc docs/Migration-Planning-Process.adoc  ## this topic is not used
cp $1/News.asciidoc docs/News.adoc  ## this topic is not used
cp $1/OBSOLETE-Migration-Technology-Categories.asciidoc docs/OBSOLETE-Migration-Technology-Categories.adoc  ## this topic is not used
cp $1/OBSOLETE-Rules-Ops-Reporting-Classification.asciidoc docs/OBSOLETE-Rules-Ops-Reporting-Classification.adoc
cp $1/OBSOLETE-Rules-Ops-Reporting-Hint.asciidoc docs/OBSOLETE-Rules-Ops-Reporting-Hint.adoc
cp $1/OBSOLETE-Rules-Ops-Reporting-TypeReference.asciidoc docs/OBSOLETE-Rules-Ops-Reporting-TypeReference.adoc
cp $1/OBSOLETE-Rules-Ops-Xml-XsltTransformation.asciidoc docs/OBSOLETE-Rules-Ops-Xml-XsltTransformation.adoc
cp $1/OBSOLETE:-Rules-Rules-Operations.asciidoc docs/OBSOLETE-Rules-Rules-Operations.adoc
cp $1/Optimize-Performance.asciidoc docs/Optimize-Performance.adoc
cp $1/Performance-tuning.asciidoc docs/Performance-tuning.adoc  ## this topic is not used
cp $1/Processing-Overview.asciidoc docs/Processing-Overview.adoc
cp $1/Report-Issues.asciidoc docs/Report-Issues.adoc
cp $1/Review-the-Quickstarts.asciidoc docs/Review-the-Quickstarts.adoc
cp $1/Review-the-Report.asciidoc docs/Review-the-Report.adoc
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
cp $1/Ruleset-Docs-Template.asciidoc docs/Ruleset-Docs-Template.adoc  ## this topic is not used
cp $1/Ruleset-Java-Archives-Identification.asciidoc docs/Ruleset-Java-Archives-Identification.adoc  ## this topic is not used
cp $1/Ruleset-Java-Basic-Ruleset.asciidoc docs/Ruleset-Java-Basic-Ruleset.adoc
cp $1/Ruleset-Java-Classifications-and-Inline-Hints.asciidoc docs/Ruleset-Java-Classifications-and-Inline-Hints.adoc
cp $1/Ruleset-Java-Code-Matching-Examples.asciidoc docs/Ruleset-Java-Code-Matching-Examples.adoc  ## this topic is not used
cp $1/Ruleset-Java-EE-Apps.asciidoc docs/Ruleset-Java-EE-Apps.adoc
cp $1/Ruleset-Java-EE-Servers.asciidoc docs/Ruleset-Java-EE-Servers.adoc
cp $1/Ruleset-Reporting.asciidoc docs/Ruleset-Reporting.adoc
cp $1/Ruleset-Server-Configuration-Migration.asciidoc docs/Ruleset-Server-Configuration-Migration.adoc
cp $1/Ruleset-XML.asciidoc docs/Ruleset-XML.adoc
cp $1/Ruleset-XML-Ruleset-Element-Reference.asciidoc docs/Ruleset-XML-Ruleset-Element-Reference.adoc  ## this topic is not used
cp $1/Rules-Create-Your-First-Rule.asciidoc docs/Rules-Create-Your-First-Rule.adoc
cp $1/Rules-Important-Links.asciidoc docs/Rules-Important-Links.adoc
cp $1/Rules-Java-based-Rule-Structure.asciidoc docs/Rules-Java-based-Rule-Structure.adoc
cp $1/Rules-Models.asciidoc docs/Rules-Models.adoc
cp $1/Rules-Review-the-Existing-XML-Rules.asciidoc docs/Rules-Review-the-Existing-XML-Rules.adoc
cp $1/Rules-Rule-Configuration.asciidoc docs/Rules-Rule-Configuration.adoc  ## this topic is not used
cp $1/Rules-Rule-Execution-Lifecycle.asciidoc docs/Rules-Rule-Execution-Lifecycle.adoc
cp $1/Rules-Rulesets.asciidoc docs/Rules-Rulesets.adoc
cp $1/Rules-Rules-Overview.asciidoc docs/Rules-Rules-Overview.adoc   ## this topic is not used
cp $1/Rules-Rule-Story-Points.asciidoc docs/Rules-Rule-Story-Points.adoc
cp $1/Rules-Test-a-Basic-XML-Rule.asciidoc docs/Rules-Test-a-Basic-XML-Rule.adoc
cp $1/Rules-Validate-Rulesets-Against-the-Schema.asciidoc docs/Rules-Validate-Rulesets-Against-the-Schema.adoc
cp $1/Rules-XML-Rule-Construction.asciidoc docs/Rules-XML-Rule-Construction.adoc  ## this topic is not used
cp $1/Rules-XML-Rule-Perform-Action-Syntax.asciidoc docs/Rules-XML-Rule-Perform-Action-Syntax.adoc
cp $1/Rules-XML-Rule-When-Condition-Syntax.asciidoc docs/Rules-XML-Rule-When-Condition-Syntax.adoc
cp $1/Rule-XML-Ruleset-Examples-Match-on-XMLFile.asciidoc docs/Rule-XML-Ruleset-Examples-Match-on-XMLFile.adoc  ## this topic is not used
cp $1/Sande-ScratchPad.asciidoc docs/Sande-ScratchPad.adoc  ## this topic is not used
cp $1/_Sidebar.asciidoc docs/_Sidebar.adoc  ## this topic is not used
cp $1/Start.asciidoc docs/Start.adoc  ## this topic is not used
cp $1/System-Requirements.asciidoc docs/System-Requirements.adoc  ## this topic is not used
cp $1/User-Guide.asciidoc docs/User-Guide.adoc  ## this topic is not used
cp $1/What-is-it.asciidoc docs/What-is-it.adoc

