<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>

        <head>
            <title>Ejemplo XSLT simple</title>
        </head>

        <body>
            <xsl:apply-templates />
        </body>

        </html>
    </xsl:template>
    <xsl:template match="nombre">
        <p> Nombre encontrado:
        <h3>
            <xsl:value-of select="." />
        </h3>
        </p>
    </xsl:template>
</xsl:stylesheet>