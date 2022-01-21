<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        
        <body>
            <h2>Ciudades de España</h2>
            <table border="1">
                <tr style="background-color:green; color:white">
                    <th>Ciudad</th>
                    <th>Habitantes</th>
                    <th>Tipo</th>
                    <th>Numero</th>
                </tr>
                <xsl:for-each select="ciudades/ciudad">
                    <!-- <xsl:sort select="otros" order="descending"/>     -->
                    
                    <tr>
                        <td><xsl:value-of select="nombre"/></td>
                        <td><xsl:value-of select="habitantes"/></td>
                        <td><xsl:value-of select="otros/@tipo"/></td>
                        <td><xsl:value-of select="otros"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>

        </html>
    </xsl:template>
</xsl:stylesheet>