<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <body>
            <h1>CDTeca</h1>
            <h3>Album:</h3>
            <ul>
                <xsl:for-each select="cdteca/cd">
                    <li>
                        <p style="font-size: 1.2em"><xsl:value-of select="titulo"/> 
                            <span style="font-size: 0.6em; color: grey"> 
                                artista:
                                
                                <xsl:if test="string-length(artista/@wiki) > 0">
                                    <xsl:variable name="link" select="artista/@wiki"/> 
                                    <a href='{$link}'><xsl:value-of select="artista"/></a>
                                </xsl:if>
                                <xsl:if test="string-length(artista/@wiki) = 0">
                                    <xsl:value-of select="artista"/>
                                </xsl:if>
                            </span>
                        </p>
                        <xsl:if test="string-length(artista/@foto) > 0">
                            <xsl:variable name="foto" select="artista/@foto"/>
                            <img src="{$foto}" alt="" style="width: 20%; height: 20%"/>
                        </xsl:if>
                        <ul>
                            <h4>Canciones</h4>
                                <xsl:for-each select="cancion">
                                    <xsl:sort select="@tiempo"/>
                                    <xsl:if test="@tiempo &gt; 200">
                                        <li>
                                            <p><xsl:value-of select="."/> - 
                                                <xsl:value-of select="floor(@tiempo div 60)"/>m <xsl:value-of select="@tiempo mod 60"/>s
                                            </p>
                                        </li>
                                    </xsl:if>
                                </xsl:for-each>
                        </ul>
                    </li>
                </xsl:for-each>
            </ul>
        </body>

        </html>
    </xsl:template>
</xsl:stylesheet>