<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>

        <body>
            <xsl:apply-templates select="/Centro/Personal/Profesor">
               <xsl:sort select="Apellidos" order="ascending"/>
            </xsl:apply-templates>

        </body>

        </html>
    </xsl:template>
    <xsl:template match="/Centro/Personal/Profesor">
        <h2>PROFESOR: : <xsl:value-of select="Nombre"/></h2>
        <h4>Tutor de: <xsl:value-of select="@tutor"/></h4>
        <xsl:apply-templates select="/Centro/Personal/Alumnos">

        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="/Centro/Personal/Alumnos">
        
    </xsl:template>
</xsl:stylesheet>