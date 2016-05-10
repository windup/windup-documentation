if [ "$1" == "" ]; then 

    echo "You must pass the path to the windup.wiki GitHub directories on the command line." 
    echo "For example:  scripts/windupDocCopyWiki.sh ~/GitRepos/windup.wiki"
    exit
fi
echo "Copy the original wiki files from $1 into the wiki-docs/ folder"
cp $1/*.asciidoc wiki-docs/
echo ""

echo "Copy and convert asciidoc files from $1 into into docs/topics adoc files"
echo ""
cp $1/About-Rules.asciidoc docs/topics/About-Rules.adoc
cp $1/About-the-HOME-Variable.asciidoc docs/topics/About-the-HOME-Variable.adoc
cp $1/About-this-Wiki.asciidoc docs/topics/About-this-Wiki.adoc
cp $1/Architectural-Components.asciidoc docs/topics/Architectural-Components.adoc
cp $1/Core-Development-Guide.asciidoc docs/topics/Core-Development-Guide.adoc  ## this topic is not used
cp $1/Dev-Add-Images-to-the-Wiki.asciidoc docs/topics/Dev-Add-Images-to-the-Wiki.adoc
cp $1/Dev-Bootstrap-Process.asciidoc docs/topics/Dev-Bootstrap-Process.adoc
cp $1/Dev-Build-from-Source.asciidoc docs/topics/Dev-Build-from-Source.adoc
cp $1/Dev-Classloading-Notes.asciidoc docs/topics/Dev-Classloading-Notes.adoc
cp $1/Dev-Concepts-and-Philosophy.asciidoc docs/topics/Dev-Concepts-and-Philosophy.adoc
cp $1/Dev-Connect-to-the-Graph-via-Rexster-or-Gremlin.asciidoc docs/topics/Dev-Connect-to-the-Graph-via-Rexster-or-Gremlin.adoc
cp $1/Dev-Create-A-Test-for-A-Java-based-Rule-Add-on.asciidoc docs/topics/Dev-Create-A-Test-for-A-Java-based-Rule-Add-on.adoc 
cp $1/Dev-Create-Your-First-Java-based-Rule-Add-on.asciidoc docs/topics/Dev-Create-Your-First-Java-based-Rule-Add-on.adoc
cp $1/Dev-Create-the-JavaDoc.asciidoc docs/topics/Dev-Create-the-JavaDoc.adoc
cp $1/Dev-Customer-Portal-Tags.asciidoc docs/topics/Dev-Customer-Portal-Tags.adoc  ## this topic is not used
cp $1/Dev-Debugging-and-Profiling.asciidoc docs/topics/Dev-Debugging-and-Profiling.adoc
cp $1/Dev-Decompiling.asciidoc docs/topics/Dev-Decompiling.adoc
cp $1/Dev-Dependencies.asciidoc docs/topics/Dev-Dependencies.adoc
cp $1/Dev-Development-Guidelines-and-Conventions.asciidoc docs/topics/Dev-Development-Guidelines-and-Conventions.adoc
cp $1/Dev-Documentation-Process.asciidoc docs/topics/Dev-Documentation-Process.adoc
cp $1/Dev-Execute-Built-from-Source.asciidoc docs/topics/Dev-Execute-Built-from-Source.adoc
cp $1/Dev-Frames-Extensions.asciidoc docs/topics/Dev-Frames-Extensions.adoc
cp $1/Dev-Get-the-Source-Code.asciidoc docs/topics/Dev-Get-the-Source-Code.adoc
cp $1/Dev-Git-Rebasing.asciidoc docs/topics/Dev-Git-Rebasing.adoc
cp $1/Dev-Internal-API-Features.asciidoc docs/topics/Dev-Internal-API-Features.adoc
cp $1/Dev-Jenkins-Setup.asciidoc docs/topics/Dev-Jenkins-Setup.adoc  ## this topic is not used
cp $1/Dev-Logging.asciidoc docs/topics/Dev-Logging.adoc
cp $1/Dev-Port-WindRide-Functionality.asciidoc docs/topics/Dev-Port-WindRide-Functionality.adoc ## this topic is not used
cp $1/Dev-Project-Information.asciidoc docs/topics/Dev-Project-Information.adoc
cp $1/Dev-Project-Structure.asciidoc docs/topics/Dev-Project-Structure.adoc
cp $1/Dev-Release-Checklist.asciidoc docs/topics/Dev-Release-Checklist.adoc  ## this topic is not used
cp $1/Dev-Release-Process.asciidoc docs/topics/Dev-Release-Process.adoc
cp $1/Dev-Rule-Documentation-Tracker.asciidoc docs/topics/Dev-Rule-Documentation-Tracker.adoc  ## this topic is not used
cp $1/Dev-Rule-Metadata-and-API-Discrepancies.asciidoc docs/topics/Dev-Rule-Metadata-and-API-Discrepancies.adoc  ## this topic is not used
cp $1/Dev-Startup-Configuration-Arguments.asciidoc docs/topics/Dev-Startup-Configuration-Arguments.adoc  ## this topic is not used
cp $1/Dev-Submit-Code-Updates-to-the-Project.asciidoc docs/topics/Dev-Submit-Code-Updates-to-the-Project.adoc
cp $1/Dev-Team-Meeting.asciidoc docs/topics/Dev-Team-Meeting.adoc  ## this topic is not used
cp $1/Dev-Test-Logging.asciidoc docs/topics/Dev-Test-Logging.adoc  ## this topic is not used
## cp $1/Dev-Troubleshoot-Issues.asciidoc docs/topics/Dev-Troubleshoot-Issues.adoc
cp $1/Dev-Variables-Stack.asciidoc docs/topics/Dev-Variables-Stack.adoc
cp $1/Dev-Web-Instructions.asciidoc docs/topics/Dev-Web-Instructions.adoc  ## this topic is not used
cp $1/Execute.asciidoc docs/topics/Execute.adoc
cp $1/Export-the-Report-for-Use-by-Spreadsheet-Programs.asciidoc docs/topics/Export-the-Report-for-Use-by-Spreadsheet-Programs.adoc
cp $1/Extend-the-Rules.asciidoc docs/topics/Extend-the-Rules.adoc  ## this topic is not used
cp $1/Features.asciidoc docs/topics/Features.adoc
cp $1/Get-Involved.asciidoc docs/topics/Get-Involved.adoc
cp $1/Glossary.asciidoc docs/topics/Glossary.adoc
cp $1/Home.asciidoc docs/topics/Home.adoc  ## this topic is not used
cp $1/Important-Links.asciidoc docs/topics/Important-Links.adoc
cp $1/Install-and-Configure-Maven.asciidoc docs/topics/Install-and-Configure-Maven.adoc
cp $1/Install.asciidoc docs/topics/Install.adoc
cp $1/Known-Issues.asciidoc docs/topics/Known-Issues.adoc
cp $1/Lab-Setup-Scripts.asciidoc docs/topics/Lab-Setup-Scripts.adoc  ## this topic is not used
cp $1/Migration-Planning-Guide.asciidoc docs/topics/Migration-Planning-Guide.adoc  ## this topic is not used
cp $1/Migration-Planning-Process.asciidoc docs/topics/Migration-Planning-Process.adoc  ## this topic is not used
cp $1/News.asciidoc docs/topics/News.adoc  ## this topic is not used
cp $1/OBSOLETE-Migration-Technology-Categories.asciidoc docs/topics/OBSOLETE-Migration-Technology-Categories.adoc  ## this topic is not used
cp $1/OBSOLETE-Rules-Ops-Reporting-Classification.asciidoc docs/topics/OBSOLETE-Rules-Ops-Reporting-Classification.adoc
cp $1/OBSOLETE-Rules-Ops-Reporting-Hint.asciidoc docs/topics/OBSOLETE-Rules-Ops-Reporting-Hint.adoc
cp $1/OBSOLETE-Rules-Ops-Reporting-TypeReference.asciidoc docs/topics/OBSOLETE-Rules-Ops-Reporting-TypeReference.adoc
cp $1/OBSOLETE-Rules-Ops-Xml-XsltTransformation.asciidoc docs/topics/OBSOLETE-Rules-Ops-Xml-XsltTransformation.adoc
cp $1/OBSOLETE:-Rules-Rules-Operations.asciidoc docs/topics/OBSOLETE-Rules-Rules-Operations.adoc
cp $1/Optimize-Performance.asciidoc docs/topics/Optimize-Performance.adoc
cp $1/Performance-tuning.asciidoc docs/topics/Performance-tuning.adoc  ## this topic is not used
cp $1/Processing-Overview.asciidoc docs/topics/Processing-Overview.adoc
cp $1/Report-Issues.asciidoc docs/topics/Report-Issues.adoc
cp $1/Review-the-Quickstarts.asciidoc docs/topics/Review-the-Quickstarts.adoc
cp $1/Review-the-Report.asciidoc docs/topics/Review-the-Report.adoc
cp $1/Rule-Metadata.asciidoc docs/topics/Rule-Metadata.adoc
cp $1/Rule-Phases.asciidoc docs/topics/Rule-Phases.adoc
cp $1/Rules-Available-Rules-Utilities.asciidoc docs/topics/Rules-Available-Rules-Utilities.adoc
cp $1/Rules-Basic-Rule-Execution-Flow-Patterns.asciidoc docs/topics/Rules-Basic-Rule-Execution-Flow-Patterns.adoc
cp $1/Rules-Create-a-Basic-Java-based-Rule-Add-on.asciidoc docs/topics/Rules-Create-a-Basic-Java-based-Rule-Add-on.adoc
cp $1/Rules-Create-a-Basic-XML-Rule.asciidoc docs/topics/Rules-Create-a-Basic-XML-Rule.adoc
cp $1/Rules-Create-a-Groovy-Rule-Add-on.asciidoc docs/topics/Rules-Create-a-Groovy-Rule-Add-on.adoc  ## this topic is not used
cp $1/Rules-Create-an-Advanced-Ruleset.asciidoc docs/topics/Rules-Create-an-Advanced-Ruleset.adoc
cp $1/Rules-Create-Custom-Reports.asciidoc docs/topics/Rules-Create-Custom-Reports.adoc  ## this topic is not used
##cp $1/Rules-Create-Java-Queries.asciidoc docs/topics/Rules-Create-Java-Queries.adoc
cp $1/Rules-Creating-Rule-Operations.asciidoc docs/topics/Rules-Creating-Rule-Operations.adoc
cp $1/Rules-Development-Guide.asciidoc docs/topics/Rules-Development-Guide.adoc  ## this topic is not used
cp $1/Rules-Difference-Between-XML-based-and-Java-based-Rules.asciidoc docs/topics/Rules-Difference-Between-XML-based-and-Java-based-Rules.adoc
cp $1/Ruleset-Core.asciidoc docs/topics/Ruleset-Core.adoc  ## this topic is not used
cp $1/Ruleset-Docs-Template.asciidoc docs/topics/Ruleset-Docs-Template.adoc  ## this topic is not used
cp $1/Ruleset-Java-Archives-Identification.asciidoc docs/topics/Ruleset-Java-Archives-Identification.adoc  ## this topic is not used
cp $1/Ruleset-Java-Basic-Ruleset.asciidoc docs/topics/Ruleset-Java-Basic-Ruleset.adoc
cp $1/Ruleset-Java-Classifications-and-Inline-Hints.asciidoc docs/topics/Ruleset-Java-Classifications-and-Inline-Hints.adoc
cp $1/Ruleset-Java-Code-Matching-Examples.asciidoc docs/topics/Ruleset-Java-Code-Matching-Examples.adoc  ## this topic is not used
cp $1/Ruleset-Java-EE-Apps.asciidoc docs/topics/Ruleset-Java-EE-Apps.adoc
cp $1/Ruleset-Java-EE-Servers.asciidoc docs/topics/Ruleset-Java-EE-Servers.adoc
cp $1/Ruleset-Reporting.asciidoc docs/topics/Ruleset-Reporting.adoc
cp $1/Ruleset-Server-Configuration-Migration.asciidoc docs/topics/Ruleset-Server-Configuration-Migration.adoc
cp $1/Ruleset-XML.asciidoc docs/topics/Ruleset-XML.adoc
cp $1/Ruleset-XML-Ruleset-Element-Reference.asciidoc docs/topics/Ruleset-XML-Ruleset-Element-Reference.adoc  ## this topic is not used
cp $1/Rules-Create-Your-First-Rule.asciidoc docs/topics/Rules-Create-Your-First-Rule.adoc
cp $1/Rules-Important-Links.asciidoc docs/topics/Rules-Important-Links.adoc
cp $1/Rules-Java-based-Rule-Structure.asciidoc docs/topics/Rules-Java-based-Rule-Structure.adoc
cp $1/Rules-Models.asciidoc docs/topics/Rules-Models.adoc
cp $1/Rules-Review-the-Existing-XML-Rules.asciidoc docs/topics/Rules-Review-the-Existing-XML-Rules.adoc
cp $1/Rules-Rule-Configuration.asciidoc docs/topics/Rules-Rule-Configuration.adoc  ## this topic is not used
cp $1/Rules-Rule-Execution-Lifecycle.asciidoc docs/topics/Rules-Rule-Execution-Lifecycle.adoc
cp $1/Rules-Rulesets.asciidoc docs/topics/Rules-Rulesets.adoc
cp $1/Rules-Rules-Overview.asciidoc docs/topics/Rules-Rules-Overview.adoc   ## this topic is not used
cp $1/Rules-Rule-Story-Points.asciidoc docs/topics/Rules-Rule-Story-Points.adoc
cp $1/Rules-Test-a-Basic-XML-Rule.asciidoc docs/topics/Rules-Test-a-Basic-XML-Rule.adoc
cp $1/Rules-Validate-Rulesets-Against-the-Schema.asciidoc docs/topics/Rules-Validate-Rulesets-Against-the-Schema.adoc
cp $1/Rules-Override-Rules.asciidoc docs/topics/Rules-Override-Rules.adoc
cp $1/Rules-XML-Rule-Construction.asciidoc docs/topics/Rules-XML-Rule-Construction.adoc  ## this topic is not used
cp $1/Rules-XML-Rule-Perform-Action-Syntax.asciidoc docs/topics/Rules-XML-Rule-Perform-Action-Syntax.adoc
cp $1/Rules-XML-Rule-When-Condition-Syntax.asciidoc docs/topics/Rules-XML-Rule-When-Condition-Syntax.adoc
cp $1/Rule-XML-Ruleset-Examples-Match-on-XMLFile.asciidoc docs/topics/Rule-XML-Ruleset-Examples-Match-on-XMLFile.adoc  ## this topic is not used
cp $1/Sande-ScratchPad.asciidoc docs/topics/Sande-ScratchPad.adoc  ## this topic is not used
cp $1/_Sidebar.asciidoc docs/topics/_Sidebar.adoc  ## this topic is not used
cp $1/Start.asciidoc docs/topics/Start.adoc  ## this topic is not used
cp $1/System-Requirements.asciidoc docs/topics/System-Requirements.adoc  ## this topic is not used
cp $1/User-Guide.asciidoc docs/topics/User-Guide.adoc  ## this topic is not used
cp $1/What-is-it.asciidoc docs/topics/What-is-it.adoc
echo "Copy is complete!"
