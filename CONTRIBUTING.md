# Windup Documentation Contributing Guide

## Wiki Asciidoc Syntax Guidelines

The following guidelines make the transition from the Windup Wiki pages to the Windup documentation GitHub smoother.

*   Be sure to add a level 3 page heading for each page. When compiled in a book, the Guide name is the top level, chapters are level 2, and the page is level  3.

        === Build Windup from Source

*   At the beginning of each new Wiki page, add an anchor with the exact page name, including the dashes. This is needed when the pages are combined into a book.

        [[Dev-Build-Windup-from-Source]]
        === Build Windup from Source

*   Wiki generates anchors using dashes for spaces. AsciiDoctor generates a leading underscore and underscores for spaces. When referring to another section within the same page, do not use the `<<section-title-anchor>>` syntax. It does not generate correctly for the documentation books. Instead, create an anchor and use the 'xref:' syntax to provide the link. 

    Create the anchor at the top of the page:

        [_windup_command_examples]
        ==== Windup Command Examples

    Then use the `xref` to create the link. Note, the Wiki generates the name with dashes (-) for spaces.

        See xref:windup-command-examples[Windup Command Examples] for more information.
    
    Because Asciidoctor generates a leading underscore and underscores for spaces, we need to modify the `xref:` text when the documentation is copied to windup-documenation.

        See xref:_windup_command_examples[Windup Command Examples] for more information.

## Build the Windup Guides

*   Install Ascidoctor

        gem install sciidoctor

*   Grab the latest changes from the Windup Wiki site
 
   * Copy any updated pages from the Windup Wiki and replace the `.asciidoc` extension with `.adoc`

            cp ../windup.wiki/Features-of-Windup-2.0.asciidoc Features-of-Windup-2.0.adoc

   * Find the internal `link:` macros in pages that link to other pages.

      * Make sure each linked page is added with an `include:` in the Guide template.

      * Make sure the wiki page is copied and added to this GitHub.

      * Replace the `link:` macros with a `xref:` macros.
      
   * Find the internal `xref:` macros. Add a leading underscore and replace the dashes with underscores.
   
           Old: See xref:windup-command-examples[Windup Command Examples] for more information.
           New: See xref:_windup_command_examples[Windup Command Examples] for more information.

* Build the HTML version of the guide

        asciidoctor -dbook -a toc -o WindupUserGuide.html Windup-User-Guide.adoc

