<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>

        <head>
            <title>Ejemplo XSLT</title>
        </head>

        <body>
            <h1> CIUDADES DE ESPA�A </h1>
            <xsl:apply-templates select="//nombre" />
        </body>

        </html>
    </xsl:template>
    <xsl:template match="nombre">
        <h3>
            <xsl:value-of select="." />
        </h3>
    </xsl:template>
</xsl:stylesheet>