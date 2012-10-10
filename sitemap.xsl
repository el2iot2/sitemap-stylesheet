<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:sitemap="http://www.google.com/schemas/sitemap/0.9"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" version="5.0" encoding="utf-8" indent="yes"/>

  <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
    <html lang="en">
      <head>
        <meta charset="utf-8"></meta>
        <title>sitemap-stylesheet</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
        <meta name="description" content="a google sitemap that was converted to HTML"></meta>
        <meta name="author" content="http://github.com/automatonic"></meta>
        <link href="sitemap.css" rel="stylesheet"></link>
        <script src="sitemap.js"></script>
        <style type="text/css">
          body {
          padding-top: 60px;
          padding-bottom: 40px;
          }
        </style>
        <!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script>
          $(function() {

          $.extend($.tablesorter.themes.bootstrap, {
          // these classes are added to the table. To see other table classes available,
          // look here: http://twitter.github.com/bootstrap/base-css.html#tables
          table    : 'table table-bordered table-striped',
          header   : 'bootstrap-header', // give the header a gradient background
          icons    : '', // add "icon-white" to make them white; this icon class is added to the {i} in the header 
    sortNone : 'bootstrap-icon-unsorted', 
    sortAsc  : 'icon-chevron-up', 
    sortDesc : 'icon-chevron-down', 
    active   : '', // applied when column is sorted 
    hover    : '', // use custom css here - bootstrap class may not override it 
    filterRow: '', // filter row class 
    even     : '', // odd row zebra striping 
    odd      : ''  // even row zebra striping 
  }); 
 
  // call the tablesorter plugin and apply the uitheme widget 
  $("#urlTable").tablesorter({ 
    widthFixed: true, 
 
    // widget code contained in the jquery.tablesorter.widgets.js file 
    // use the zebra stripe widget if you plan on hiding any rows (filter widget) 
    widgets : [ "uitheme", "filter", "zebra" ], 
 
    widgetOptions : { 
      // using the default zebra striping class name, so it actually isn't included in the theme variable above 
      // this is ONLY needed for bootstrap theming if you are using the filter widget, because rows are hidden 
      zebra : ["even", "odd"], 
 
      // reset filters button 
      filter_reset : ".reset", 
 
      // set the uitheme widget to use the bootstrap theme class names 
      uitheme : "bootstrap" 
 
    } 
  }) 
  .tablesorterPager({ 
 
    // target the pager markup - see the HTML block below 
    container: $(".pager"), 
 
    // target the pager page select dropdown - choose a page 
    cssGoto  : ".pagenum", 
 
    // remove rows from the table to speed up the sort of large tables. 
    // setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled. 
    removeRows: false, 
 
    // output string - default is '{page}/{totalPages}'; 
    // possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows} 
    output: '{startRow} - {endRow} / {filteredRows} ({totalRows})' 
 
  }); 
 
});
</script>
      </head>
      <body>

        <div class="navbar navbar-inverse navbar-fixed-top">
          <div class="navbar-inner">
            <div class="container">
              <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </a>
              <a class="brand" href="#">sitemap-stylesheet</a>
              <div class="nav-collapse collapse">
                <ul class="nav">
                  <li class="active">
                    <a href="#">All URLs</a>
                  </li>
                  <li>
                    <a href="http://github.com/automatonic/sitemap-stylesheet">GitHub Project</a>
                  </li>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      Dropdown <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a href="#">Action</a>
                      </li>
                      <li>
                        <a href="#">Another action</a>
                      </li>
                      <li>
                        <a href="#">Something else here</a>
                      </li>
                      <li class="divider"></li>
                      <li class="nav-header">Nav header</li>
                      <li>
                        <a href="#">Separated link</a>
                      </li>
                      <li>
                        <a href="#">One more separated link</a>
                      </li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <div class="container">
          <div class="row">
            <h3>
              <xsl:value-of select="count(sitemap:urlset/sitemap:url)"></xsl:value-of> URLs
            </h3>
            <table id="urlTable" class="tablesorter">
              <thead>
                <tr>
                  <th>URL</th>
                  <th>Last Modification</th>
                  <th>Change Frequency</th>
                  <th>Priority</th>
                </tr>
              </thead>
              <tbody>
                <xsl:apply-templates select="sitemap:urlset/sitemap:url">
                  <xsl:sort select="sitemap:priority" order="descending"/>
                </xsl:apply-templates>
              </tbody>

              <tfoot>
                <tr>
                  <th>URL</th>
                  <th>Last Modification</th>
                  <th>Change Frequency</th>
                  <th>Priority</th>
                </tr>
                <tr>
                  <th colspan="4" class="pager form-horizontal">
                    <button class="btn first">
                      <i class="icon-step-backward"></i>
                    </button>
                    <button class="btn prev">
                      <i class="icon-arrow-left"></i>
                    </button>
                    <span class="pagedisplay"></span>
                    <!-- this can be any element, including an input -->
                    <button class="btn next">
                      <i class="icon-arrow-right"></i>
                    </button>
                    <button class="btn last">
                      <i class="icon-step-forward"></i>
                    </button>
                    <select class="pagesize input-small" title="Select page size">
                      <option selected="selected" value="10">10</option>
                      <option value="20">20</option>
                      <option value="30">30</option>
                      <option value="40">40</option>
                    </select>
                    <select class="pagenum input-small" title="Select page number"></select>
                  </th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="sitemap:url">
    <tr>
      <td>
        <xsl:variable name="loc">
          <xsl:value-of select="sitemap:loc"/>
        </xsl:variable>
        <a href="{$loc}" target="_blank" ref="nofollow">
          <xsl:value-of select="$loc"></xsl:value-of>
        </a>
      </td>
      <td>
        <xsl:value-of select="sitemap:lastmod"/>
      </td>
      <td>
        <xsl:value-of select="sitemap:changefreq"/>
      </td>
      <td>
        <xsl:value-of select="sitemap:priority"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>