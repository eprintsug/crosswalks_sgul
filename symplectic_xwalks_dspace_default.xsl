<?xml version="1.0" encoding="utf-8"?>
<!--
  ~ Copyright (c) 2012. Symplectic Ltd. All Rights Reserved
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:crosswalks="info:symplectic/crosswalks" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:pubs="http://www.symplectic.co.uk/publications/atom-api" version="1.0">
    <!-- Required for all crosswalks - import the standard toolkit -->
    <xsl:import href="symplectic_xwalks_toolkit.xsl" />

    <!-- Required for all crosswalks - load the data islands from the crosswalk stylesheet -->
    <xsl:variable name="crosswalk-mappings" select="document('')//crosswalks:mappings" />
    <!-- xsl:variable name="crosswalk-object-mappings" select="document('')//crosswalks:object-mappings" / -->
    <!-- xsl:variable name="crosswalk-label-mappings" select="document('')//crosswalks:label-mappings" / -->
    <xsl:variable name="crosswalk-dictionaries" select="document('')//crosswalks:dictionaries" />
    <xsl:variable name="crosswalk-datasource-precedences" select="document('')//crosswalks:datasource-precedences/crosswalks:datasource-precedence" />

    <!--
        Data Source Mappings
        ====================
        Map values from the data source into repository fields
    -->
    <crosswalks:mappings for="dspace">
        <!-- Default mappings -->
        <crosswalks:mapping dspace="dc.identifier.citation" format-elements="[$journal], [$parent-title], [$publication-date:date(yyyy)], [$edition], [$volume] ~([$issue])~, ~pp. [$pagination]~" />

        <crosswalks:mapping dspace="dc.contributor.author" elements="authors" />
        <crosswalks:mapping dspace="dc.contributor.editor" elements="editors" />
        <crosswalks:mapping dspace="dc.contributor.other" elements="associated-authors" />
        <crosswalks:mapping dspace="dc.coverage.spatial" elements="location" />
        <crosswalks:mapping dspace="dc.date.available" elements="publication-date" />
        <crosswalks:mapping dspace="dc.description.abstract" elements="abstract" />
        <crosswalks:mapping dspace="dc.format" elements="medium" />
        <crosswalks:mapping dspace="dc.format.extent" elements="number-of-pieces,pagination" />
        <crosswalks:mapping dspace="dc.identifier" elements="author-url,number,patent-number,pii" />
        <crosswalks:mapping dspace="dc.identifier.doi" elements="doi" />
        <crosswalks:mapping dspace="dc.identifier.eissn" elements="eissn" />
        <crosswalks:mapping dspace="dc.identifier.isbn" elements="isbn-10,isbn-13" />
        <crosswalks:mapping dspace="dc.identifier.issn" elements="issn" />
        <crosswalks:mapping dspace="dc.language" elements="language" />
        <crosswalks:mapping dspace="dc.publisher" elements="publisher" />
        <crosswalks:mapping dspace="dc.relation.isPartOf" elements="journal,parent-title,series" />
        <crosswalks:mapping dspace="dc.source" elements="name-of-conference" />
        <crosswalks:mapping dspace="dc.subject" elements="keywords" />
        <crosswalks:mapping dspace="dc.title" elements="title" />
        <crosswalks:mapping dspace="pubs.awarded-date" elements="awarded-date" />
        <crosswalks:mapping dspace="pubs.commissioning-body" elements="commissioning-body" />
        <crosswalks:mapping dspace="pubs.confidential" elements="confidential" />
        <crosswalks:mapping dspace="pubs.edition" elements="edition" />
        <crosswalks:mapping dspace="pubs.filed-date" elements="filed-date" />
        <crosswalks:mapping dspace="pubs.finish-date" elements="finish-date" />
        <crosswalks:mapping dspace="pubs.issue" elements="issue" />
        <crosswalks:mapping dspace="pubs.notes" elements="notes" />
        <crosswalks:mapping dspace="pubs.patent-status" elements="patent-status" />
        <crosswalks:mapping dspace="pubs.place-of-publication" elements="place-of-publication" />
        <crosswalks:mapping dspace="pubs.publication-status" elements="publication-status" />
        <crosswalks:mapping dspace="pubs.start-date" elements="start-date" />
        <crosswalks:mapping dspace="pubs.version" elements="version" />
        <crosswalks:mapping dspace="pubs.volume" elements="volume" />
    </crosswalks:mappings>

    <!--
        Object level field mappings
        ===========================
        Map values from the publication fields into repository fields
    -->
    <!--

        <crosswalks:object-mappings for="dspace">
            <crosswalks:mapping dspace="dc.subject" list-elements="labels" />
        </crosswalks:object-mappings>
    -->

    <!--
        Label mappings
        ==============
    -->
    <!--
        <crosswalks:label-mappings for="dspace">
            <crosswalks:label-mapping dspace="dc.subject" list-separator=", ">
                <crosswalks:label-mapping origin="issn-inferred" />
                <crosswalks:label-mapping exclude-scheme="for" />
            </crosswalks:label-mapping>
            <crosswalks:label-mapping dspace="dc.subject" list-separator="; ">
                <crosswalks:label-mapping exclude-scheme="for" />
            </crosswalks:label-mapping>
            <crosswalks:label-mapping dspace="dc.subject" />
        </crosswalks:label-mappings>
    -->

    <!--
        Data Dictionaries
        =================
        Convert values supplied by Elements to values used in DSpace
        NB: This is an example - uncomment to use
    -->
    <!-- crosswalks:dictionaries>
        <crosswalks:dictionary elements="publication-status">
            <crosswalks:entry elements="Published"      dspace="Published" />
            <crosswalks:entry elements="Submitted"      dspace="submitted" />
            <crosswalks:entry elements="Accepted"       dspace="Accepted" />
            <crosswalks:entry elements="Unpublished"    dspace="Unpublished" />
        </crosswalks:dictionary>
    </crosswalks:dictionaries -->


    <!--
        Data Source Precedences
        =======================
        Used when passing the full atom feed from Repository Tools.
        Please check your Elements instance to see what data sources are being used.
        Only data sources listed here will be considered for mapping.
    -->
    <crosswalks:datasource-precedences>
        <crosswalks:datasource-precedence>web-of-science</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>wos-lite</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>pubmed</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>isi-precedings</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>manual-entry</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>arxiv</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>dblp</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>scopus</crosswalks:datasource-precedence>
    </crosswalks:datasource-precedences>
</xsl:stylesheet>
