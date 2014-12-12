# Windup Documentation Contributing Guide

## Wiki Asciidoc Syntax Guidelines

The following guidelines make the transition from the Windup Wiki pages to the Windup documentation GitHub smoother.

*   Be sure to add a level 3 page heading for each page. When compiled in a book, the Guide name is the top level, chapters are level 2, and the page is level  3.

        === Build Windup from Source

*   At the beginning of each new Wiki page, add an anchor with the exact page name, including the dashes. This generates the correct anchors that are needed when the pages are combined into a book.

        [[Dev-Build-Windup-from-Source]]
        === Build Windup from Source

*   Wiki generates anchors using dashes for spaces. AsciiDoctor generates a leading underscore and underscores for spaces.When referring to another section within the same page, do not use the `<<section-title-anchor>>` syntax. Instead, create an anchor and use the 'xref:' syntax to provide the link. 

    Create the anchor at the top of the section using double brackets to force the generation of dashes instead of underscores:

        [[windup-command-examples]]
        ==== Windup Command Examples

    Then use the `xref` to create the link.

        See xref:windup-command-examples[Windup Command Examples] for more information.
    

## Build the Windup Guides

*   If you have not yet done so, install Ascidoctor

        gem install sciidoctor

*   Grab the latest changes from the Windup Wiki site
 
   * Copy the guides from the Wiki and leave the `.asciidoc` extension. Compare this page to the Guide template in the windup-documentaion to see if any pages were added to the guide.
   
   | **Wiki Guide Name** | **Windup Documentation Guide Name** |
   |:-------------|:-------------|
   | User-Guide.asciidoc | Windup-User-Guide.adoc |
   | Rules-Development-Guide.asciidoc | Windup-Rules-Development-Guide.adoc |
   | Core-Development-Guide.asciidoc | Windup-Core-Development-Guide.adoc |
   | Migration-Planning-Guide.asciidoc | Windup-Migration-Planning-Guide.adoc |
   

   * Copy any updated pages from the Windup Wiki and replace the `.asciidoc` extension with `.adoc`

            cp ../windup.wiki/Features-of-Windup-2.0.asciidoc Features-of-Windup-2.0.adoc
            
   * Find the internal `link:` macros in pages that link to other pages.

      * Make sure each page referenced by the link is added to the guide template with an `include:`.

      * Make sure the wiki page is copied and added to this GitHub.

      * Replace the `link:` macros with a `xref:` macros.
      

* Build the HTML version of the guide

        asciidoctor -dbook -a toc -o WindupUserGuide.html Windup-User-Guide.adoc

